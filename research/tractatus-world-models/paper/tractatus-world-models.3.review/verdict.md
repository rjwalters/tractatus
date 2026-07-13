# Verdict — tractatus-world-models.3

- **Total**: 43 / 44
- **Decision**: `advance: true`
- **Rubric**: `anvil-pub-v2` (threshold ≥35; critical flags short-circuit)

Total exceeds the threshold and no critical flags are set. Both v2 critical flags were independently re-verified as resolved this pass (not taken on the changelog's word):

## Critical flags

None.

- **v2 `theorem_artifact_mismatch` — CLEARED.** Theorem 5.3 (`thm:horn-boundary`) now cites `horn_valuation_realizable_iff`. The declaration exists at `proofs/TractatusOntologyHorn.lean:167-176`; its Lean statement `(∃ w : HornModel S cs, ∀ s, w.val s ↔ (v s = true)) ↔ (∀ c ∈ cs, v c.1 = true → v c.2 = true)` is exactly the printed per-valuation boundary. The added sentence on the global form correctly describes `horn_realizable_iff` (lines 137–140: every assignment `S → Prop` realizable iff every clause is trivial). Verified by a full `lake build` this pass (clean, exactly the 9 documented `#eval` info lines) and `#print axioms Tractatus.horn_valuation_realizable_iff` → "does not depend on any axioms".
- **v2 `render_gate_overfull_boxes` — CLEARED.** The deterministic render gate was *skipped* per the audit-first fail-open contract (no `paper.pdf`/`main.pdf` or `compile-log.txt` exists for v3 — `pub-audit` has not run). Because the v2 gate failure was a critical flag, the reviewer independently compiled v3 from scratch (`pdflatex → bibtex → pdflatex ×3`, per friction note F15): final log shows **0 overfull hboxes** (any threshold), 0 errors, 0 undefined references/citations, 10 pages; the rerun hint present after the second post-bibtex pass disappears on the third, confirming F15.

## Dimension summary

| # | Dimension | Weight | v2 | v3 |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 4 | 6 |
| 2 | Evidence sufficiency | 6 | 4 | 6 |
| 3 | Clarity of contribution | 5 | 5 | 5 |
| 4 | Related-work positioning | 5 | 4 | 5 |
| 5 | Reproducibility | 5 | 4 | 4 |
| 6 | Figure & table quality | 4 | 3 | 4 |
| 7 | Prose & structural quality | 4 | 3 | 4 |
| 8 | Citation hygiene | 5 | 4 | 5 |
| 9 | Rhetorical economy | 4 | 4 | 4 |
| | **Total** | **44** | **35** | **43** |

Full justifications in `scoring.md`; line-level items in `comments.md`.

## Remaining priorities (non-blocking; `advance: true`)

1. **Pin the artifact before submission (dim 5, major).** The paper's URL (`https://github.com/rjwalters/tractatus`) resolves, but the newly cited `horn_valuation_realizable_iff` lives only on the unpushed `feature/issue-5` branch at review time — merge must land before submission, and a commit hash / tagged release / Zenodo DOI should pin the reviewed state (Synthese referees increasingly expect an immutable locator for machine-checked claims).
2. **Thread hygiene (comment, not a flag):** the thread-root `BRIEF.md` still says "63 declarations" while the paper correctly says 64. The BRIEF is reviser input, not part of the reviewable document, and the paper is internally consistent — but the drift will confuse a future drafter pass; update it when next touching the thread.
3. **Optional caption nit:** "no Horn model shares a nontrivial exclusion model's image profiles" could be misread as "shares *any* profile" (they share plenty; the theorem is about the profile *sets* being unequal). "realizes exactly the image profiles of" would be unambiguous.

## Venue overlay

No venue overlay was scored: `.anvil.json` declares no `venue` key (deliberate — no `synthese.yaml` ships). The generic /44 gate is the sole driver of this verdict.
