#!/usr/bin/env bash
# default-branch.sh — Resolve the repository's default (base) branch name.
#
# Source this file (do not exec). Defines a single function:
#
#   loom_default_branch [remote] -> echoes the default branch name (e.g. "main"
#                                   or "master"); returns non-zero if detection
#                                   fails so callers can emit a clear error.
#
# Motivation (#15): worktree.sh and pr-worktree.sh hardcoded `origin/main` as
# the base ref. Repos whose default branch is `master` (or anything else) hit
# `fatal: invalid reference: origin/main` on worktree creation. This helper
# derives the base branch dynamically instead.
#
# Detection precedence (first match wins), OFFLINE-FIRST with a network
# fallback so it works in fresh clones, sandboxes, and CI without a network
# round-trip when the local repo already knows the answer:
#
#   0. LOOM_DEFAULT_BRANCH env var    — explicit override, highest priority.
#      (escape hatch for unusual setups / tests; no git introspection.)
#   1. git symbolic-ref refs/remotes/origin/HEAD  — OFFLINE. Populated by a
#      normal `git clone` and by `git remote set-head origin --auto`. This is
#      the canonical local record of the remote's default branch.
#   2. git ls-remote --symref <remote> HEAD       — resolves the remote HEAD.
#      Works OFFLINE against local/file remotes (as the test fixtures use) and
#      hits the NETWORK for real remotes. Placed before the branch probe so a
#      genuine remote default is preferred over a heuristic guess.
#   3. Probe common defaults locally: origin/main then origin/master via
#      `git show-ref` — OFFLINE, no network. Ordered main-first to match the
#      historical hardcoded assumption, then master for this repo's reality.
#   4. Bare local branches: main then master via `refs/heads/*` — covers repos
#      with no remote configured at all.
#
# If none match, the function prints a clear diagnostic to stderr and returns
# 1. Callers MUST treat a non-zero return as a hard error (no silent fallback
# to a hardcoded ref), so a detection failure is loud rather than a confusing
# `invalid reference` deep in `git worktree add`.

# loom_default_branch [remote]
#
# Echoes the resolved default branch name on success (exit 0).
# Emits nothing on stdout and returns 1 on failure.
loom_default_branch() {
    local remote="${1:-origin}"
    local ref branch

    # 0. Explicit override.
    if [[ -n "${LOOM_DEFAULT_BRANCH:-}" ]]; then
        echo "$LOOM_DEFAULT_BRANCH"
        return 0
    fi

    # 1. Local symbolic ref for the remote HEAD (offline).
    ref=$(git symbolic-ref "refs/remotes/$remote/HEAD" 2>/dev/null || true)
    if [[ -n "$ref" ]]; then
        # ref looks like: refs/remotes/origin/main
        branch="${ref#refs/remotes/$remote/}"
        if [[ -n "$branch" && "$branch" != "$ref" ]]; then
            echo "$branch"
            return 0
        fi
    fi

    # 2. Ask the remote for its HEAD symref. Offline for file/local remotes;
    #    a network call for real remotes. Parse the `ref: refs/heads/<b> HEAD`
    #    line emitted by --symref.
    ref=$(git ls-remote --symref "$remote" HEAD 2>/dev/null \
            | awk '/^ref:/ {print $2; exit}')
    if [[ -n "$ref" ]]; then
        branch="${ref#refs/heads/}"
        if [[ -n "$branch" && "$branch" != "$ref" ]]; then
            echo "$branch"
            return 0
        fi
    fi

    # 3. Probe common remote-tracking defaults locally (offline). main first
    #    (historical default), then master (this repo).
    local candidate
    for candidate in main master; do
        if git show-ref --verify --quiet "refs/remotes/$remote/$candidate"; then
            echo "$candidate"
            return 0
        fi
    done

    # 4. Probe bare local branches (no remote configured).
    for candidate in main master; do
        if git show-ref --verify --quiet "refs/heads/$candidate"; then
            echo "$candidate"
            return 0
        fi
    done

    echo "loom_default_branch: could not determine default branch for remote '$remote'." >&2
    echo "  Tried: symbolic-ref refs/remotes/$remote/HEAD, ls-remote --symref $remote HEAD," >&2
    echo "  and local refs main/master. Populate it with:" >&2
    echo "    git remote set-head $remote --auto" >&2
    echo "  or set LOOM_DEFAULT_BRANCH explicitly." >&2
    return 1
}
