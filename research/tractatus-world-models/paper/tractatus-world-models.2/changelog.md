# Changelog — tractatus-world-models.2

**Nature of this revision:** format migration, not a review-driven revision.
There is no `tractatus-world-models.1.review/` sibling; v2 is the **canary adoption**
of the freshly-installed anvil `pub` grammar. The paper's contribution, prose,
theorems, structure, and figures are content-identical to v1 modulo the mechanical
changes below. No `notes → changes` mapping applies because no critic notes exist yet;
this file records the migration diff instead.

## Changes (v1 → v2)

| Change | v1 | v2 | Rationale |
|---|---|---|---|
| Entry-point filename | `paper.tex` | `main.tex` | Anvil pub artifact contract: version dir entry point is `main.tex`. |
| Bibliography format | inline `\begin{thebibliography}{99}` with 17 `\bibitem`s | `\bibliographystyle{plain}` + `\bibliography{refs}` + `refs.bib` (17 BibTeX entries) | Anvil contract: BibTeX (`.bib`) is the primary bibliography format. |
| Figure source location | `data/make_spectrum_figure.py` | `figures/src/make_spectrum_figure.py` | Anvil contract: figure source scripts live under `figures/src/`. |
| Rendered figure | `figures/spectrum.pdf` | `figures/spectrum.pdf` (copied unchanged) | Unchanged. |
| `\date` marker | `Draft v1` | `Draft v2` | Version bump (only prose byte-diff). |
| Thread root | (none) | `tractatus-world-models/` with `BRIEF.md` + `.anvil.json` | Anvil contract: thread carries a brief and per-thread config. |

## Deliberate deviations from anvil defaults (see ANVIL-MIGRATION-NOTES.md)

- **Document class kept as `article`, not `anvil-paper.cls`.** The shipped
  `anvil-paper.cls` forces `authoryear` natbib citations and bakes in its own
  preamble; adopting it would change every rendered citation from numeric `[n]` to
  `(Author Year)` and collide with the paper's custom `listings` (Lean) setup and
  theorem environments — a *content* change, which this migration forbids. Keeping
  `article` preserves the byte-identical body. Recorded as friction for upstream.
- **`\bibliographystyle{plain}`** (numeric) chosen to match v1's numbered `\cite{}`
  rendering exactly; `plainnat`/`authoryear` would alter in-text citation shape.

## Verification

Compiled clean via `pdflatex → bibtex → pdflatex → pdflatex`: 9 pages (same as v1),
0 undefined references, 0 undefined citations, all 14 `\cite{}` keys resolved against
`refs.bib`. Body prose diff vs v1 is exactly one line (`\date`).
