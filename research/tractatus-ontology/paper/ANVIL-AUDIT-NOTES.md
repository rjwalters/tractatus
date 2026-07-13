# Anvil audit friction notes — tractatus-ontology (legacy-grammar thread)

Continuation of the friction log started in
`research/tractatus-world-models/paper/ANVIL-MIGRATION-NOTES.md` (F1–F12, on
branch `feature/anvil-issue-5`; that file is not present on this branch, so
the pub-audit friction points for the legacy `tractatus-ontology` thread live
here). Numbering continues at F13.

- **F13 — entry point is `paper.tex`, not `main.tex`.** pub-audit's discovery
  step ("highest N with `<thread>.{N}/main.tex`") finds nothing on this
  thread; every doc reference to `main.tex` had to be read as `paper.tex`.
  The version dir is immutable (vetted submission artifact), so renaming to
  the anvil grammar was not an option.

- **F14 — no `refs.bib`; hand-rolled `thebibliography`.** The \cite-resolution
  step was re-targeted to `\bibitem` keys inside `paper.tex` (21/21 resolve,
  no orphans), and the documented compile cycle (pdflatex + bibtex + 2x
  pdflatex) was replaced by the thread's own recipe: 3x pdflatex with the
  vendored `asl.cls`, run from inside `tractatus-ontology.9/` into `.build/`.
  A bibtex pass would have been a no-op-with-error (no `.aux` \bibdata).

- **F15 — no `<thread>/refs/` dir; claim-support ground truth lives inside
  the immutable version dir.** The thread's citation notes are
  `tractatus-ontology.9/references/*.md` and
  `tractatus-ontology.9/literature.md`. pub-audit expects author-supplied
  sources in a thread-level `refs/`; on this thread the auditor must read
  (never write) the version dir instead.

- **F16 — external proof-artifact verification has no slot in the pub-audit
  contract.** This paper's evidence base is the Lean development in
  `proofs/`, and the repo's verify-artifact-claims norm requires running it
  (a prior review famously missed a non-building repo). The `lake build`
  result, declaration-count checks (80 rows cross-checked name-by-name), and
  six headline statement-vs-source comparisons were folded into
  `numerical-audit.md` plus a `compile-log.txt` addendum; a dedicated
  artifact-audit output file would fit better.

- **F17 — the committed-PDF byte-match expectation is unreachable with plain
  pdflatex.** Fresh builds differ in `/CreationDate`, `/ModDate`, and `/ID`
  every run. Content equality was established via identical byte size
  (497,434) + identical extracted text. If byte-reproducibility is wanted for
  future gates, build with `SOURCE_DATE_EPOCH` (and
  `\pdftrailerid{}`/`\pdfinfoomitdate`-style pinning).

- **F18 — appendix table names are unqualified; three source declarations are
  namespaced.** `evalBool_correct`, `disj_evalBool`, `literal_evalBool` are
  declared as `Proposition.*` in source. Mechanical name→declaration matching
  must be namespace-insensitive (the table's "locate by exact text search"
  instruction does work, but a naive `^theorem NAME` grep reports false
  misses, and comment lines beginning with `theorem`/`lemma` produce false
  hits for naive counting).

- **F19 — the claim-support ground truth contains a stale superseded claim.**
  `tractatus-ontology.9/literature.md` (Gap Analysis item 4) still asserts
  the old hierarchy chain `structEq ⊊ formEq ⊊ semEq`, which the paper itself
  refutes (formEq/semEq proved incomparable). Harmless here (the paper is
  right and the notes are wrong), but on a legacy thread nothing keeps the
  notes in sync with versions, and a future audit that trusts literature.md
  over the paper would flag a phantom error. Recorded as a non-critical note
  in `tractatus-ontology.9.audit/flags.md`.

- **F20 — `.anvil` venv needed a first `uv sync`, and the sidecar CLI shim
  emits a cosmetic `RuntimeWarning`** (`'anvil.lib.sidecar' found in
  sys.modules ... prior to execution`) on every invocation; stage/commit/
  cleanup all behaved correctly (including surviving a mid-audit session
  interruption: the staging dir was swept and re-staged cleanly). Running
  `uv` also dirties `.anvil/**/__pycache__/*.pyc` in git status — worth
  gitignoring for consumer repos.

- **F21 — repo `.gitignore` (line 27) ignores `_progress.json` globally**, so
  the committed audit sidecar carries only 6 of its 7 files; the phase-state
  checkpoint exists on disk (the staged-sidecar manifest check passed) but is
  invisible to clones/CI. If anvil sidecars are meant to be durable in git,
  the ignore rule needs a carve-out (e.g. `!*.audit/_progress.json`).
