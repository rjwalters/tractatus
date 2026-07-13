# Line-level comments — tractatus-world-models.4

Keyed to sections of `main.tex` (single-file paper; `resolve_tex_inputs` finds no `\input`/`\include` children and no missing targets — the lone `\includegraphics` is a graphics asset, not a TeX child). Grouped by severity.

## blocker

- None.

## major

- None. All three v3 remaining priorities are verified closed at the artifact level:
  1. **Artifact pin (v3 priority 1, dim 5 major):** §1 now prints "(commit \lean{0852c5b}; the full hash is pinned in Appendix~\ref{app:index})", Appendix A prints the full 40-char hash on its own centered line, and the bib note carries "(commit 0852c5b)". Verified this pass: `0852c5b` **is an ancestor of `master`**, `horn_valuation_realizable_iff` is at `proofs/TractatusOntologyHorn.lean:167` on `master`, and `proofs/` + `lakefile.lean` + `lean-toolchain` + `lake-manifest.json` are byte-identical between the pin and `master`. The pin being older than HEAD is correct behavior for an immutable locator — it names the commit where the reviewed state landed.
  2. **Companion title (author-caught + both prior audits):** `companion2026` now cites "What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*", verified against `research/tractatus-ontology/paper/tractatus-ontology.9/paper.tex:139-140` in-repo, with plain.bst case protection. (Author decision on record: the companion may retitle at its v10 pass — re-sync at submission if so.)
  3. **Fig. 1 caption (v3 priority 3, nit):** now reads "no Horn model realizes exactly the image profiles of a nontrivial exclusion model" — the exact phrasing the v3 review suggested, matching Theorem 6.5.

## minor

- **Submission mechanics, not paper content (§ none):** `BRIEF.md` declares `venue: "Synthese"` and `anonymous: false`. Synthese review is double-anonymous by default and the paper body identifies the author via the repo URL and the self-citation `companion2026`. This is a known, deliberately-open item on issue #5 (venue mechanics: author guidelines / anonymization at submission time) and is not scored against the paper; recorded so the submission pass does not forget it.

## nit

- **§5 (Underfull hbox, badness 1831 at `main.tex:358-367`) and §6.5 (badness 2237 at `main.tex:569-593`):** two mildly loose lines ("Biconditional constraints are the symmetric closure..." and "Every theorem cited above carries a machine-checked proof..."). Cosmetic only; the final compile pass is otherwise warning-free. Not worth chasing unless a later revision touches those paragraphs anyway.
- **Repo `CLAUDE.md` bookkeeping (outside the paper, carried from v3):** `TractatusOntologyExclusion.lean` is 235 lines; the repo `CLAUDE.md` header says 236. The paper prints only the exact four-module total (1,064). Left for a main-branch housekeeping commit, per the v4 changelog's documented non-resolution.

## procedural

- **Render gate ran against the audit's outputs this pass** (first time for this thread — v2/v3 reviews hit the audit-first fail-open): `main.pdf` + `tractatus-world-models.4.audit/compile-log.txt`, PASS — 10 pages, 0 overfull boxes (threshold 5.0pt), 0 placeholders. The 0.8.0 entry-point-derived input naming (`main.pdf`, friction F13 fix) worked as documented; no `paper.pdf` mismatch. Payload at `_gate.json`.
- **artifact_verify gate (issue #663, first exercise):** `.anvil.json` declares `lake build` (absolute elan path, `cwd: ../../../..` = repo root, `timeout_s: 1800`). Discovered by `discover_artifact_verify`, run via `verify()`; PASS — exit 0, build clean (fresh worktree; mathlib cache prefetched as environment setup, gate command unmodified). Raw capture at `_artifact_verify.json`. Verified independently on top of the gate: `#print axioms` on the headline theorems reports `propext, Classical.choice, Quot.sound` only (see `findings.md`).
- **Numeric-consistency detector** ran via `uv` with default discovery (no `--body` needed): 42 numbers, 0 arithmetic claims, 0 findings, pass; sidecar at `tractatus-world-models.4.numeric/`. **Evidence-check verifier** ran: 9/9 dimensions, 0 findings. Both CLIs (and all `anvil.lib.sidecar` calls) ran with completely clean stderr — the F16 runpy RuntimeWarning is gone under 0.8.0. No manual fallbacks needed this pass.
