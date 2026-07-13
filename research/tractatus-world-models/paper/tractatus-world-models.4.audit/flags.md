# Audit flags for tractatus-world-models.4

## Critical flags (block advancement to AUDITED)

None.

- Build: **clean and converged**. Convergence-loop compile (anvil 0.8.0 contract, pub-audit.md
  step 4): `pdflatex → bibtex → pdflatex ×3` — the rerun hint ("Label(s) may have changed")
  was present after passes 2 and 3 and **absent after pass 4**, with pass-4 `.aux` byte-identical
  to pass-3's (the optional stronger cross-check). 4 total pdflatex passes, under the 5-pass cap.
  Final pass: 0 errors, 0 overfull hboxes, 0 undefined references/citations, 0 LaTeX warnings,
  10 pages. No `??` in the rendered PDF (`pdftotext` scan). This paper is exactly the F15 case:
  the old fixed 2-post-bibtex-pass contract would have stopped with a live rerun hint.
- Citations: 17/17 keys resolve; cited set == bib set; bibtex 0 errors/warnings. 0 claim-support
  failures.
- Numerics: 0 inconsistencies. All artifact-facing numbers (64 declarations, 1,064 lines,
  six-line proof, lemma at `Horn.lean:167`, commit pin `0852c5b` = ancestor of `master` with
  `proofs/` unchanged since) re-verified against the repository this pass.

## Non-critical notes

- **Unverified citations (16)**: claim-support for all off-repo sources could not be verified
  because no source PDFs exist in `research/tractatus-world-models/refs/`. Author should verify
  off-disk (stable across v2/v3/v4 audits; the one previously *wrong* off-disk-adjacent entry —
  the invented companion title — is now verified fixed in-repo, see `citation-audit.md`).
- **Two mild underfull hboxes** (badness 1831 at `main.tex:358-367`, 2237 at `main.tex:569-593`):
  cosmetic interword spacing only, no content impact; far below any actionable badness. Recorded
  for completeness because the final pass is otherwise warning-free.
