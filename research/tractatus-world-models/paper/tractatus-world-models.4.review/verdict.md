# Verdict — tractatus-world-models.4

- **Total**: 44 / 44
- **Decision**: `advance: true`
- **Rubric**: `anvil-pub-v2` (threshold ≥35; critical flags short-circuit)

Total exceeds the threshold and no critical flags are set. v4 is a documented polish pass over a converged v3 (43/44); all three changes were independently verified against ground truth (see `findings.md` §1), and both 0.8.0 deterministic gates passed.

## Critical flags

None.

- **Render gate (step 4b): PASS.** First run with real inputs on this thread (pub-audit ran first this session): `main.pdf` (10 pages) + the audit's 4-pass `compile-log.txt` — 0 overfull boxes at 5.0pt, 0 placeholders, compile ok. Payload at `_gate.json`.
- **artifact_verify gate (step 4f, issue #663): PASS.** Declared `lake build` (elan v4.26.0, repo root, 1800s) ran to exit 0 — `Build completed successfully (3068 jobs)`, exactly the 9 documented `#eval` info lines, no warnings. Since `proofs/` + build files are byte-identical between the paper's pinned `0852c5b` and `master`, this verifies the Appendix A claim "at that commit the build is warning-free" at the reviewed state. Raw capture at `_artifact_verify.json`; no `artifact_verify_*` flag emitted (the blocking path exists but did not fire).

## Dimension summary

| # | Dimension | Weight | v3 | v4 |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 | 6 |
| 2 | Evidence sufficiency | 6 | 6 | 6 |
| 3 | Clarity of contribution | 5 | 5 | 5 |
| 4 | Related-work positioning | 5 | 5 | 5 |
| 5 | Reproducibility | 5 | 4 | 5 |
| 6 | Figure & table quality | 4 | 4 | 4 |
| 7 | Prose & structural quality | 4 | 4 | 4 |
| 8 | Citation hygiene | 5 | 5 | 5 |
| 9 | Rhetorical economy | 4 | 4 | 4 |
| | **Total** | **44** | **43** | **44** |

The single moved score is dim 5 (4→5): the v3 deduction — no immutable locator, cited lemma unpushed — is closed by the commit pin (`0852c5b`, verified ancestor of `master`, `proofs/` unchanged since) with the build machine-verified by the artifact gate this pass. Full justifications in `scoring.md`; line-level items in `comments.md`.

## Remaining priorities (non-blocking; `advance: true`)

1. **Submission mechanics only (issue #5, open by design):** Synthese anonymization — the body identifies the author (repo URL, self-citation). Prepare the anonymized submission variant per journal guidelines; nothing in the reviewed content needs to change.
2. **Re-sync the companion title at submission time** if the companion retitles at its v10 pass (author decision on record in the v4 changelog).

## Venue overlay

No venue overlay was scored: `.anvil.json` declares no `venue` key (deliberate — no `synthese.yaml` ships). The generic /44 gate is the sole driver of this verdict.
