#!/usr/bin/env bash
# test-worktree-sentinel.sh - Tests for .loom-managed sentinel marker
#
# Verifies issue #3334 fix: cleanup tooling honors the worktree ownership
# model (Loom-managed worktrees marked with .loom-managed; user-provisioned
# worktrees are never removed).
#
# Coverage:
#   1. worktree.sh writes .loom-managed when creating a Loom-managed worktree
#   2. merge-pr.sh cleanup block contains the sentinel and LOOM_PRESERVE_WORKTREE guards
#   3. agent-destroy.sh cleanup block contains the same guards
#
# Tests 2 and 3 are static (grep-based) because exercising the cleanup path
# end-to-end requires a full forge round-trip. The static check protects
# against accidental regression of the guard lines.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$SCRIPTS_DIR/../.." && pwd)"

WORKTREE_SH="$SCRIPTS_DIR/worktree.sh"
MERGE_PR_SH="$SCRIPTS_DIR/merge-pr.sh"
AGENT_DESTROY_SH="$SCRIPTS_DIR/agent-destroy.sh"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

pass() { TESTS_RUN=$((TESTS_RUN + 1)); TESTS_PASSED=$((TESTS_PASSED + 1)); echo -e "  ${GREEN}PASS${NC}: $1"; }
fail() { TESTS_RUN=$((TESTS_RUN + 1)); TESTS_FAILED=$((TESTS_FAILED + 1)); echo -e "  ${RED}FAIL${NC}: $1"; }

assert_file_exists() {
    if [[ -f "$1" ]]; then
        pass "$2"
    else
        fail "$2 (expected file: $1)"
    fi
}

assert_grep() {
    local pattern="$1"
    local file="$2"
    local msg="$3"
    if grep -qE "$pattern" "$file"; then
        pass "$msg"
    else
        fail "$msg (pattern not found: $pattern in $file)"
    fi
}

# --- Test 1: worktree.sh writes .loom-managed sentinel ---
echo "Test 1: worktree.sh writes .loom-managed sentinel"

TMP=$(mktemp -d /tmp/loom-sentinel-test.XXXXXX)
trap 'rm -rf "$TMP"; cd "$REPO_ROOT" 2>/dev/null || true' EXIT

# Build a tiny throwaway repo and copy the script + the helpers it needs.
# worktree.sh expects an origin/main ref, so we set up a bare remote and push.
git init -q -b main "$TMP/origin.git" --bare
git init -q -b main "$TMP/repo"
cd "$TMP/repo"
git config user.email t@t
git config user.name t
git commit --allow-empty -q -m init
git remote add origin "$TMP/origin.git"
git push -q origin main

# Copy worktree.sh (it uses ../scripts/.loom-managed; mirror enough of the
# tree so the helper runs without the real .loom layout).
mkdir -p .loom/scripts/lib .loom/hooks
cp "$WORKTREE_SH" .loom/scripts/worktree.sh
# Copy any lib helpers worktree.sh sources (none required for sentinel test,
# but copy if present to avoid sourcing errors).
if [[ -d "$SCRIPTS_DIR/lib" ]]; then
    cp -R "$SCRIPTS_DIR"/lib/* .loom/scripts/lib/ 2>/dev/null || true
fi
chmod +x .loom/scripts/worktree.sh

# Run worktree.sh for a synthetic issue number. The script's own success
# message is noise here — we only care about the sentinel.
ISSUE_NUM=99
if ./.loom/scripts/worktree.sh "$ISSUE_NUM" >/tmp/worktree-out.$$ 2>&1; then
    assert_file_exists ".loom/worktrees/issue-$ISSUE_NUM/.loom-managed" \
        "worktree.sh creates .loom-managed in the new worktree"
    # Verify content gives operators something to grep for
    if [[ -f ".loom/worktrees/issue-$ISSUE_NUM/.loom-managed" ]]; then
        assert_grep "Loom-managed worktree marker" \
            ".loom/worktrees/issue-$ISSUE_NUM/.loom-managed" \
            "sentinel file contains identifying header"
    fi
else
    fail "worktree.sh failed for issue $ISSUE_NUM (see /tmp/worktree-out.$$)"
fi

cd "$REPO_ROOT"

# --- Test 2: merge-pr.sh cleanup block enforces sentinel + env var ---
echo ""
echo "Test 2: merge-pr.sh cleanup honors sentinel + LOOM_PRESERVE_WORKTREE"

assert_grep 'LOOM_PRESERVE_WORKTREE' "$MERGE_PR_SH" \
    "merge-pr.sh references LOOM_PRESERVE_WORKTREE"
assert_grep '\.loom-managed' "$MERGE_PR_SH" \
    "merge-pr.sh references .loom-managed sentinel"
assert_grep 'refusing to remove.*user-owned' "$MERGE_PR_SH" \
    "merge-pr.sh emits a refusal message for unmanaged worktrees"

# --- Test 3: agent-destroy.sh cleanup block enforces the same guards ---
echo ""
echo "Test 3: agent-destroy.sh cleanup honors sentinel + LOOM_PRESERVE_WORKTREE"

assert_grep 'LOOM_PRESERVE_WORKTREE' "$AGENT_DESTROY_SH" \
    "agent-destroy.sh references LOOM_PRESERVE_WORKTREE"
assert_grep '\.loom-managed' "$AGENT_DESTROY_SH" \
    "agent-destroy.sh references .loom-managed sentinel"

# --- Test 4: inline simulation of cleanup decision logic ---
echo ""
echo "Test 4: cleanup decision logic (inline simulation)"

# Replicate the decision shape from merge-pr.sh in a function so we can
# exercise both the "managed" and "user-owned" branches without a real PR.
simulate_cleanup_decision() {
    local worktree_path="$1"
    local preserve="${2:-0}"
    if [[ "$preserve" == "1" ]]; then
        echo "skip:env"
        return 0
    fi
    if [[ ! -d "$worktree_path" ]]; then
        echo "skip:missing"
        return 0
    fi
    if [[ ! -f "$worktree_path/.loom-managed" ]]; then
        echo "skip:user-owned"
        return 0
    fi
    echo "remove"
}

CASE_DIR=$(mktemp -d /tmp/loom-sentinel-cases.XXXXXX)
trap 'rm -rf "$CASE_DIR"' RETURN

mkdir -p "$CASE_DIR/managed" "$CASE_DIR/unmanaged"
touch "$CASE_DIR/managed/.loom-managed"

result=$(simulate_cleanup_decision "$CASE_DIR/managed")
if [[ "$result" == "remove" ]]; then pass "managed worktree → remove"; else fail "managed worktree expected 'remove', got '$result'"; fi

result=$(simulate_cleanup_decision "$CASE_DIR/unmanaged")
if [[ "$result" == "skip:user-owned" ]]; then pass "unmanaged worktree → skip:user-owned"; else fail "unmanaged worktree expected 'skip:user-owned', got '$result'"; fi

result=$(simulate_cleanup_decision "$CASE_DIR/managed" 1)
if [[ "$result" == "skip:env" ]]; then pass "LOOM_PRESERVE_WORKTREE=1 short-circuits even for managed worktree"; else fail "env-var preserve expected 'skip:env', got '$result'"; fi

rm -rf "$CASE_DIR"

# --- Test 5: re-invocation restores a missing sentinel (issue #11) ---
#
# Regression for #11: worktree.sh's "worktree already exists" early-exit
# branches (preserve-existing-work, stale-worktree reset) return before the
# first-creation sentinel write. A worktree whose sentinel is missing (e.g.
# a Builder resume, a Doctor re-run, or a worktree created before the sentinel
# write on an interrupted first invocation) must have the marker backfilled on
# re-invocation, or merge-pr.sh's cleanup gate (merge-pr.sh:644) strands it.
echo ""
echo "Test 5: re-invocation backfills a missing .loom-managed sentinel (#11)"

# Use a canonical (non-symlinked) tmp base. On macOS `/tmp` is a symlink to
# `/private/tmp`; `git worktree list --porcelain` records the path as given
# while worktree.sh's orphan check resolves it via `cd && pwd`, so a `/tmp`
# base makes a registered worktree spuriously look orphaned and get recreated
# — which would mask the very preserve/reset branches this test must exercise.
# Real Loom roots (e.g. /Volumes/Stripe) are canonical, so mirror that here.
TMP5_BASE="${TMPDIR:-/tmp}"
TMP5_BASE="$(cd "$TMP5_BASE" && pwd -P)"
TMP5=$(mktemp -d "$TMP5_BASE/loom-sentinel-reinvoke.XXXXXX")
TMP5="$(cd "$TMP5" && pwd -P)"
trap 'rm -rf "$TMP5"; rm -rf "$TMP"; cd "$REPO_ROOT" 2>/dev/null || true' EXIT

git init -q -b main "$TMP5/origin.git" --bare
git init -q -b main "$TMP5/repo"
cd "$TMP5/repo"
git config user.email t@t
git config user.name t
git commit --allow-empty -q -m init
git remote add origin "$TMP5/origin.git"
git push -q origin main

mkdir -p .loom/scripts/lib
cp "$WORKTREE_SH" .loom/scripts/worktree.sh
if [[ -d "$SCRIPTS_DIR/lib" ]]; then
    cp -R "$SCRIPTS_DIR"/lib/* .loom/scripts/lib/ 2>/dev/null || true
fi
chmod +x .loom/scripts/worktree.sh

R_ISSUE=77
WT=".loom/worktrees/issue-$R_ISSUE"

# 5a. First invocation creates the worktree with a sentinel.
./.loom/scripts/worktree.sh "$R_ISSUE" >/tmp/wt-reinvoke-1.$$ 2>&1 || true
assert_file_exists "$WT/.loom-managed" "5a: first invocation writes sentinel"

# 5b. Preserve-existing-work path: give the worktree a commit ahead of main,
# delete the sentinel (simulating the pre-fix stranded state), re-invoke, and
# confirm the sentinel is restored on the preserve branch.
( cd "$WT" && git commit --allow-empty -q -m "work ahead of main" )
rm -f "$WT/.loom-managed"
[[ ! -f "$WT/.loom-managed" ]] && pass "5b: sentinel deleted to simulate stranded worktree" || fail "5b: could not delete sentinel"
./.loom/scripts/worktree.sh "$R_ISSUE" >/tmp/wt-reinvoke-2.$$ 2>&1 || true
assert_grep "preserving existing work" "/tmp/wt-reinvoke-2.$$" \
    "5b: re-invocation took the preserve-existing-work branch"
assert_file_exists "$WT/.loom-managed" \
    "5b: sentinel restored on the preserve-existing-work re-invocation path"
# The preserved commit must NOT have been discarded.
if ( cd "$WT" && [[ "$(git rev-list --count origin/main..HEAD)" -ge 1 ]] ); then
    pass "5b: existing work preserved (commit still ahead of main)"
else
    fail "5b: existing work was lost on re-invocation"
fi

# 5c. Stale-worktree reset path: drop the ahead commit so the worktree is
# stale (0 ahead, clean), delete the sentinel, re-invoke, confirm restore.
( cd "$WT" && git reset --hard origin/main >/dev/null 2>&1 )
rm -f "$WT/.loom-managed"
./.loom/scripts/worktree.sh "$R_ISSUE" >/tmp/wt-reinvoke-3.$$ 2>&1 || true
assert_file_exists "$WT/.loom-managed" \
    "5c: sentinel restored on the stale-worktree reset re-invocation path"

# 5d. The restored sentinel must satisfy merge-pr.sh's cleanup gate, i.e. the
# exact predicate at merge-pr.sh:644 ([[ ! -f <wt>/.loom-managed ]] → refuse).
if [[ -f "$WT/.loom-managed" ]]; then
    pass "5d: merge-pr.sh cleanup gate would ACCEPT the worktree (sentinel present)"
else
    fail "5d: merge-pr.sh cleanup gate would REFUSE (sentinel absent)"
fi

rm -f /tmp/wt-reinvoke-1.$$ /tmp/wt-reinvoke-2.$$ /tmp/wt-reinvoke-3.$$
cd "$REPO_ROOT"

# --- Test 6: default-branch detection on a MASTER-named repo (issue #15) ---
#
# worktree.sh previously hardcoded `origin/main`, so `git worktree add` failed
# with `fatal: invalid reference: origin/main` on any repo whose default branch
# is `master` (this repo's reality — see #13/#14/#11). This test builds a
# throwaway repo whose ONLY branch is `master` (no `main` anywhere, origin/HEAD
# unset — the fresh-clone-in-a-sandbox shape) and asserts worktree.sh succeeds
# without manual patching and bases the branch on master.
echo ""
echo "Test 6: worktree.sh succeeds on a master-default repo (#15)"

# Canonical (non-symlinked) tmp base — same rationale as Test 5 (macOS /tmp
# symlink makes registered worktrees spuriously look orphaned).
TMP6_BASE="${TMPDIR:-/tmp}"
TMP6_BASE="$(cd "$TMP6_BASE" && pwd -P)"
TMP6=$(mktemp -d "$TMP6_BASE/loom-default-branch.XXXXXX")
TMP6="$(cd "$TMP6" && pwd -P)"
trap 'rm -rf "$TMP6"; rm -rf "$TMP5"; rm -rf "$TMP"; cd "$REPO_ROOT" 2>/dev/null || true' EXIT

# Build a repo whose default branch is `master` (NOT main). origin/HEAD is left
# unset (as in a bare-remote push), so detection must fall through to
# `ls-remote --symref` / the master probe — exactly the fresh-clone case.
git init -q -b master "$TMP6/origin.git" --bare
git init -q -b master "$TMP6/repo"
cd "$TMP6/repo"
git config user.email t@t
git config user.name t
git commit --allow-empty -q -m init
git remote add origin "$TMP6/origin.git"
git push -q origin master

mkdir -p .loom/scripts/lib
cp "$WORKTREE_SH" .loom/scripts/worktree.sh
if [[ -d "$SCRIPTS_DIR/lib" ]]; then
    cp -R "$SCRIPTS_DIR"/lib/* .loom/scripts/lib/ 2>/dev/null || true
fi
chmod +x .loom/scripts/worktree.sh

# Confirm the fixture has no `main` branch and origin/HEAD is unset, so we are
# genuinely exercising the master-detection path (guards against a fixture that
# accidentally provides `main` and masks the regression).
if git show-ref --verify --quiet refs/heads/main; then
    fail "6: fixture unexpectedly has a 'main' branch (test would not exercise master path)"
else
    pass "6: fixture has no 'main' branch (master-only, as intended)"
fi

M_ISSUE=42
M_WT=".loom/worktrees/issue-$M_ISSUE"
if ./.loom/scripts/worktree.sh "$M_ISSUE" >/tmp/wt-master.$$ 2>&1; then
    pass "6: worktree.sh succeeds on a master-default repo (no manual patch)"
else
    fail "6: worktree.sh failed on master-default repo (see below)"
    sed 's/^/      /' /tmp/wt-master.$$ || true
fi

# The worktree must exist, be registered, and its branch must be based on
# origin/master (its merge-base with master equals master's tip).
assert_file_exists "$M_WT/.loom-managed" "6: sentinel written on master-default worktree"
if [[ -d "$M_WT" ]]; then
    master_tip=$(git rev-parse origin/master 2>/dev/null)
    wt_base=$(git -C "$M_WT" merge-base HEAD origin/master 2>/dev/null)
    if [[ -n "$master_tip" && "$wt_base" == "$master_tip" ]]; then
        pass "6: worktree branch is based on origin/master"
    else
        fail "6: worktree branch not based on origin/master (tip=$master_tip base=$wt_base)"
    fi
fi

rm -f /tmp/wt-master.$$
cd "$REPO_ROOT"

# --- Summary ---
echo ""
echo "Tests run: $TESTS_RUN, Passed: $TESTS_PASSED, Failed: $TESTS_FAILED"
[[ $TESTS_FAILED -eq 0 ]] || exit 1
