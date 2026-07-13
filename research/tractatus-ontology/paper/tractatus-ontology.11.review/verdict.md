# Verdict — tractatus-ontology.11

- **Total**: 44 / 44
- **Decision**: `advance: true`
- **Critical flags**: none
- **Rubric**: anvil-pub-v2 (/44, advance threshold ≥35)

## Critical-flag review

Each rubric example flag was checked explicitly; none fires:

- *Citation error*: 23/23 `\cite` keys resolve to `\bibitem` entries
  (re-checked this pass; no orphans either direction; no `??` in the
  rendered PDF per the render gate). No bibliography entry changed in v11.
- *Plagiarism risk*: no passage mirrors prior work without attribution;
  the Aristotle-proved files remain disclosed in a detailed
  Acknowledgments section stating exactly which proofs were machine-found.
- *Missing experiment for a claim*: every mathematical claim carries a
  kernel-checked proof, and — new under anvil v0.8.0 — the external
  artifact was verified by machinery this pass: the thread's declared
  `lake build` (issue #663 gate) exited 0 in this fresh worktree,
  "Build completed successfully (3068 jobs)" with exactly the 9 expected
  `#eval` info lines and empty stderr (`_artifact_verify.json`). The v11
  diff touched no Lean.
- *Numerical inconsistency*: detector found 0 (551 numbers, 0 claims; run
  in place via `--body paper.tex`); manual cross-check of line and
  declaration counts (2,296 = 1,345+284+239+142+138+148;
  80 = 45+9+11+9+3+3) and the appendix row ranges (1–45 / 46–80) is exact.
- *Close prior work ignored*: the Wehmeier line (Wehmeier 2004; Rogers &
  Wehmeier 2012, published at this venue) is engaged substantively in §5
  with an accurate technical contrast at the point of use in §4.6. No
  remaining omission close enough to misrepresent novelty is known to
  this reviewer.
- *Build / compile failure*: the reviser's fresh compile under the 0.8.0
  convergence-loop contract reached the rerun-warning fixpoint at pass 2
  (confirmatory pass 3 `.aux` byte-identical; 5-pass cap not approached):
  exit 0, 25 pages, 0 errors, 0 overfull boxes above 5.0pt,
  0 placeholders, no unresolved refs/cites. The committed `paper.pdf` is
  that fresh build. The external-artifact half of this flag class (#663)
  also passed — see above.

## Dimension summary

| # | Dimension | Weight | Score | v10 |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 | 6 |
| 2 | Evidence sufficiency | 6 | 6 | 6 |
| 3 | Clarity of contribution | 5 | 5 | 5 |
| 4 | Related-work positioning | 5 | 5 | 5 |
| 5 | Reproducibility | 5 | 5 | 5 |
| 6 | Figure & table quality | 4 | 4 | 4 |
| 7 | Prose & structural quality | 4 | 4 | 3 |
| 8 | Citation hygiene | 5 | 5 | 5 |
| 9 | Rhetorical economy | 4 | 4 | 4 |
| | **Total** | **44** | **44** | **43** |

Score delta vs v10 (same rubric, directly comparable): D7 3→4 — the two
defects that carried the v10 deduction (the mis-drafted "Neither work"
sentence, fixed in the v10 source post-review and verified here, and the
§4.3 "three new results" version-diff leftover, fixed in v11) are both
resolved on the artifact. All other dimensions hold at ceiling with the
v10 residuals addressed (§4.6/§5 complementarity dedupe; scherf2025
"attempt" reframing).

## Recommended (non-blocking) improvements

`advance: true` at rubric ceiling; nothing blocks submission. Remaining
polish candidates, both below scoring threshold (see comments.md):

1. Fogelin (1976/1987) dating at first prose mention (declined this pass
   as out of the operator-directed scope; fold into submission mechanics).
2. Optional: "demonstrating" → "suggesting" in the scherf2025 sentence for
   maximal calibration toward an archive-only artifact.

## Venue overlay

`tractatus-ontology/.anvil.json` exists (it declares the #663
`artifact_verify` block) but sets no `venue` field, so no venue overlay
was scored. The generic /44 gate is the sole driver of this verdict.
