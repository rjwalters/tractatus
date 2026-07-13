# Verdict — tractatus-ontology.9

- **Total**: 42 / 44
- **Decision**: `advance: true`
- **Critical flags**: none
- **Rubric**: anvil-pub-v2 (/44, advance threshold ≥35)

## Critical-flag review

Each rubric example flag was checked explicitly; none fires:

- *Citation error*: 21/21 `\cite` keys resolve to `\bibitem` entries (audit
  cross-check; no `??` in the rendered PDF per the render gate). Claim-support
  audit found 0 failures on the on-disk sources.
- *Plagiarism risk*: no passage mirrors prior work without attribution; the
  Aristotle-proved files are disclosed in a detailed Acknowledgments section
  that states exactly which proofs were machine-found and that all statements
  are the authors'.
- *Missing experiment for a claim*: every mathematical claim carries a
  kernel-checked proof; the one novelty claim is hedged ("to our knowledge").
- *Numerical inconsistency*: detector found 0; manual cross-check of line and
  declaration counts (2,296 = 1,345+284+239+142+138+148; 80 = 45+9+11+9+3+3)
  and the appendix row ranges is exact, and the audit verified all statistics
  against `proofs/` source.
- *Close prior work ignored*: the strongest candidate omission (Rogers &
  Wehmeier 2012, *RSL*, on Tractarian first-order logic and the N-operator)
  does not misrepresent this paper's novelty — it is paper-based, not
  machine-checked, and does not address the saying/showing boundary — so it
  is a dim-4 deduction and a `related-work` lead, not a flag.
- *Build / compile failure*: 3-pass pdflatex exits 0; render gate PASS
  (25 pages, 0 overfull, 0 placeholders); fresh `lake build` clean per audit.

## Dimension summary

| # | Dimension | Weight | Score |
|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 |
| 2 | Evidence sufficiency | 6 | 6 |
| 3 | Clarity of contribution | 5 | 5 |
| 4 | Related-work positioning | 5 | 4 |
| 5 | Reproducibility | 5 | 5 |
| 6 | Figure & table quality | 4 | 4 |
| 7 | Prose & structural quality | 4 | 4 |
| 8 | Citation hygiene | 5 | 5 |
| 9 | Rhetorical economy | 4 | 3 |
| | **Total** | **44** | **42** |

## Recommended (non-blocking) improvements

`advance: true`, so no revision priorities are required. If a revision pass
happens anyway (e.g. during CUP submission prep), the highest-leverage items,
in order:

1. **Engage the Wehmeier line in §5/§4.6** (Wehmeier 2004; Rogers & Wehmeier
   2012, *The Review of Symbolic Logic* 5(4)) on Tractarian first-order logic,
   identity, and the N-operator — the omission is most visible precisely at
   the target venue. Verify via a `pub-litsearch`-style resolver pass before
   citing (this review adds no `.bib` entries).
2. **Tighten the abstract and conclusion** (dim 9): the ~450-word abstract and
   the result-by-result conclusion each restate the contribution list; one
   pass of compression saves about a page with no argument loss.
3. **Update the stale internal note**: `tractatus-ontology.9/literature.md`
   Gap Analysis item 4 still asserts the superseded chain
   `structEq ⊊ formEq ⊊ semEq` that the paper itself refutes. Not a paper
   defect (the note is not part of the rendered artifact, and the version dir
   is immutable), but it is claim-support ground truth for future audits —
   carry the fix into any v10.

## Venue overlay

No `<thread>/.anvil.json` exists (legacy-grammar thread), so no venue overlay
was scored. The generic /44 gate is the sole driver of this verdict.
