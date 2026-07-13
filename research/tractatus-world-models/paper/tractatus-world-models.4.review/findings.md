# Findings — tractatus-world-models.4 (cross-section observations)

Reviewer: pub-review (claude-fable-5), 2026-07-13. First pass under anvil v0.8.0. No rubric version transition: the prior review sibling (`tractatus-world-models.3.review/_meta.json`) is stamped `rubric_id: "anvil-pub-v2"`, identical to this pass — the 43/44 → 44/44 delta is directly comparable.

## 1. The v4 polish pass landed exactly as changelogged — verified, not taken on the changelog's word

The v3→v4 diff is precisely four edits in `main.tex` (commit pin in §1, Fig. 1 caption rephrase, stray-space fix in Thm 4.2, full-hash block in Appendix A) plus the two-line `companion2026` fix in `refs.bib`. Each was re-verified against ground truth this pass:

- **Commit pin**: `0852c5b00e1d2942d39cf4067b0816409cac54f9` exists, is an **ancestor of `master`**, and `git diff 0852c5b master -- proofs/ lakefile.lean lean-toolchain lake-manifest.json` is empty — the pinned state and the verified state are the same build. The pin names the commit where `horn_valuation_realizable_iff` landed (PR #24); its being older than HEAD is the correct semantics of an immutable locator, not drift.
- **Companion title**: matches `research/tractatus-ontology/paper/tractatus-ontology.9/paper.tex:139-140` ("What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*"). The invented title flagged by both prior audits is gone.
- **Caption**: uses the v3 review's exact suggested phrasing; now unambiguous about profile-*set* equality (Theorem 6.5, `refinesEquiv_iff_image_eq`).

## 2. External-artifact verification (issue #663 gate, first exercise on this thread)

`<thread>/.anvil.json` declares `artifact_verify` = `lake build` (absolute elan v4.26.0 path), `cwd: ../../../..` (repo root), `timeout_s: 1800`. `discover_artifact_verify` returned `declared: True`; `verify()` ran the command via subprocess in the resolved cwd. **Result: PASS** — exit 0, `Build completed successfully (3068 jobs)`, with exactly the 9 documented `#eval` info lines (5 from `TractatusOntology.lean:705-709`, 4 from `TractatusDecidability.lean:136,139,142,145`) and no warnings. Raw per-command capture written to `_artifact_verify.json` (advisory, not in the manifest). Because the gate passed, **no `artifact_verify_*` critical flag** was emitted into `_review.json` — the blocking path exists but did not fire. Environment note: the worktree had no `.lake/` dir, so the mathlib cache was prefetched (`lake exe cache get`) as environment setup before invoking the gate; the gate command itself ran exactly as declared.

This closes the F12 gap operationally: the class of defect that produced the historical false-ACCEPT (an artifact claim nobody ran) is now checked by a deterministic pre-scoring gate on every review of this thread.

Independent cross-check on top of the gate (repo verify-artifact-claims norm): `#print axioms` on six headline theorems — `horn_valuation_realizable_iff` (no axioms), `horn_realizable_iff`, `exclusion_not_horn`, `color_not_horn` (each `propext, Classical.choice, Quot.sound`), `freeModel_unique_refines_iso` (`Classical.choice`), `spectrum_invariant_iff_freeModel_tautology` (no axioms) — all within the abstract's claimed footprint.

## 3. Render gate ran for the first time on this thread (audit-first ordering satisfied)

v2/v3 reviews hit the audit-first fail-open (no PDF existed at review time). This pass, pub-audit ran first in the same session, so the gate had its documented inputs: `tractatus-world-models.4/main.pdf` (entry-point-derived name, F13/#667/#676 fix — no `paper.pdf` mismatch) + `tractatus-world-models.4.audit/compile-log.txt`. **PASS**: 10 pages, 0 overfull boxes at 5.0pt threshold, 0 placeholder hits, compile ok. The concatenated 4-pass log contains zero `Overfull` lines, so the #668/#677 dedupe-by-(line, amount, kind) had nothing to collapse — no spurious counts observed (the F14 inflation scenario cannot recur on a clean log; the dedupe path itself was not stressed this pass).

## 4. Compile convergence (F15 fix, exercised on its motivating case)

The audit's convergence-loop compile needed **3 post-bibtex passes** — the rerun hint was present after passes 2 and 3 and gone at pass 4, with pass-4 `.aux` byte-identical to pass-3's. This thread is the exact document class F15 described; the 0.8.0 contract (loop to fixpoint, cap 5) converged where the old fixed count would have stopped one pass short with a live rerun warning.

## 5. Scores at ceiling — what would move them down, for the record

44/44 with the sole v3 deduction (dim 5, artifact locator) verifiably repaired is the honest fresh score: every dimension was re-checked against the body, the compiled PDF, and the running artifact, and no substantive objection survives on any dimension. For future passes, the nearest live risks are: (a) the companion retitle at its v10 pass would silently re-break the `companion2026` title (re-sync at submission — author decision on record); (b) Synthese anonymization mechanics (issue #5, open by design) are orthogonal to content but will require a submission variant; (c) the Limitations section's binary-clause scope is honest today but would become a dim 2 deduction if a future revision strengthens the abstract's claims without lifting the theorems.
