# Audit flags for tractatus-ontology.9

## Critical flags (block advancement to AUDITED)

None.

- Build: 3-pass pdflatex (vendored asl.cls) exits 0; 25 pages; zero errors,
  zero overfull hboxes, zero undefined refs/cites; no `??` in the rendered PDF.
- Citations: 21/21 `\cite` keys resolve to `\bibitem` entries; no orphans;
  0 claim-support failures.
- Numerical: all proof-artifact statistics (2,296 lines; 80 declarations
  45/9/11/9/3/3; 0 sorries; 1 axiom `silence : True`; toolchain v4.26.0)
  verified exact against `proofs/` on current master; 6/6 headline theorem
  statements match source (verbatim listings).
- External proof artifact: fresh `lake build` on current master completed
  successfully — zero errors, zero warnings, exactly 9 `#eval` info lines.
- Committed `paper.pdf` is content-identical to a fresh build (byte
  difference confined to CreationDate/ModDate/ID metadata).

## Non-critical notes

- **Unverified citations (4)**: `wittgenstein1921`, `wittgenstein1929`,
  `carruthers1989`, `moura2021` — no source PDF or note file on disk in
  `references/`; claim-support could not be tool-verified. All four are
  primary sources or standard tool/monograph citations; author should verify
  off-disk. `fogelin1987` is `partial` (supported indirectly via
  `references/miller.md`).
- **Stale thread-notes file (not a paper defect)**:
  `tractatus-ontology.9/literature.md` Gap Analysis item 4 still states the
  superseded hierarchy claim "structEq ⊊ formEq ⊊ semEq", which the paper
  itself refutes (formEq and semEq are proved incomparable,
  Sec. sec:hierarchy). The paper is correct; the notes file predates the fix
  of the false hierarchy theorem. Recommend updating literature.md if the
  thread is ever revised, since it is claim-support ground truth for future
  audits.
- **Non-reproducible PDF bytes (informational)**: pdflatex embeds
  CreationDate/ModDate/ID, so committed-vs-fresh PDFs can never byte-match
  across invocations without `SOURCE_DATE_EPOCH`. Content equality was
  verified via identical size + identical extracted text instead.
