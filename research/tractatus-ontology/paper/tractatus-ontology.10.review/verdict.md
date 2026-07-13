# Verdict — tractatus-ontology.10

- **Total**: 43 / 44
- **Decision**: `advance: true`
- **Critical flags**: none
- **Rubric**: anvil-pub-v2 (/44, advance threshold ≥35)

## Critical-flag review

Each rubric example flag was checked explicitly; none fires:

- *Citation error*: 23/23 `\cite` keys resolve to `\bibitem` entries (checked
  this pass; no orphans either direction, no `??` in the rendered PDF per the
  render gate). The two entries new in v10 (rogers2012, wehmeier2004) carry
  correct venue/volume/page/DOI details and were Crossref-verified by the
  pre-review code check; the paragraph describing them matches their actual
  content (exclusive identity convention, N as sole primitive, tableau
  calculi, RSL 5(4) 2012 / NDJFL 45(1) 2004).
- *Plagiarism risk*: no passage mirrors prior work without attribution; the
  Aristotle-proved files remain disclosed in a detailed Acknowledgments
  section stating exactly which proofs were machine-found.
- *Missing experiment for a claim*: every mathematical claim carries a
  kernel-checked proof; the novelty claims stay hedged ("to our knowledge").
  The v10 diff touched no Lean, so the v9-audited artifact facts (80 results,
  2,296 lines, six files, clean build) still cover the paper's claims.
- *Numerical inconsistency*: detector found 0 (551 numbers, 0 claims);
  manual cross-check of line and declaration counts
  (2,296 = 1,345+284+239+142+138+148; 80 = 45+9+11+9+3+3) and the appendix
  row ranges (1–45 / 46–80) is exact.
- *Close prior work ignored*: the v9 deduction — the Wehmeier line — is
  addressed: Wehmeier 2004 and Rogers & Wehmeier 2012 (*RSL*, the target
  venue) are now engaged substantively in §5 with a contact sentence at the
  point of use in §4.6, on an honest complementarity framing. No remaining
  omission close enough to misrepresent novelty is known to this reviewer.
- *Build / compile failure*: no `.10.audit` sibling exists, so this review
  compiled the paper itself: 3-pass pdflatex exits 0, 25 pages, 0 errors,
  0 overfull boxes above 5.0pt, 0 placeholders; the committed `paper.pdf`
  content-matches the fresh build (byte size 499,233 + identical extracted
  text).

## Dimension summary

| # | Dimension | Weight | Score | v9 |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 | 6 |
| 2 | Evidence sufficiency | 6 | 6 | 6 |
| 3 | Clarity of contribution | 5 | 5 | 5 |
| 4 | Related-work positioning | 5 | 5 | 4 |
| 5 | Reproducibility | 5 | 5 | 5 |
| 6 | Figure & table quality | 4 | 4 | 4 |
| 7 | Prose & structural quality | 4 | 3 | 4 |
| 8 | Citation hygiene | 5 | 5 | 5 |
| 9 | Rhetorical economy | 4 | 4 | 3 |
| | **Total** | **44** | **43** | **42** |

Score deltas vs v9 (same rubric, directly comparable): D4 4→5 (Wehmeier
engagement lands, accurate and honestly framed), D9 3→4 (abstract compressed
~450→~262 words, conclusion no longer re-narrates the full result set), D7
4→3 (one mis-drafted sentence introduced in the new v10 material — see
below — plus a carried-over v9 nit).

## Recommended (non-blocking) improvements

`advance: true`, so no revision priorities are required. The one must-fix
before submission, plus lower-leverage items:

1. **Fix the "Neither work" sentence in §5** (major, comments.md): "Neither
   work treats identity by the exclusive convention, so their identity
   results have no direct analogue here" is false on its natural reading
   (Wehmeier 2004 and Rogers & Wehmeier 2012 treat identity *precisely* by
   the exclusive convention, as the same paragraph says two sentences
   earlier). Intended subject is this paper's own development. Suggested:
   "Our formalization does not treat identity by the exclusive convention,
   so their identity results have no direct analogue here." One-sentence
   copy edit; a referee — plausibly Wehmeier at this venue — will catch it.
2. **Deduplicate the complementarity framing** (nit): §4.6's contact
   paragraph and §5's Wehmeier paragraph state the same
   they-prove-completeness-on-paper / we-mechanize-semantic-reach contrast
   twice in similar words; trim one to a pointer.
3. **Carried-over v9 nits, still open**: "The three new results" in §4.3
   reads as a version-diff leftover; scherf2025 (unpublished, deleted repo,
   archive-only) is still framed as "the most directly comparable work";
   Fogelin first-edition (1976) dating at first prose mention.

## Venue overlay

No `<thread>/.anvil.json` exists (legacy-grammar thread), so no venue overlay
was scored. The generic /44 gate is the sole driver of this verdict.
