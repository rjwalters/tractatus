# Line-level comments — tractatus-world-models.3

Keyed to sections of `main.tex` (single-file paper; `resolve_tex_inputs` finds no `\input`/`\include` children and no missing targets — the lone `\includegraphics` is a graphics asset, not a TeX child). Grouped by severity.

## blocker

- None.

## major

- **§1 / §7.5 / Appendix A (reproducibility — artifact sync before submission).** Excerpt: "The proof artifact is publicly available in the \lean{tractatus} repository at \url{https://github.com/rjwalters/tractatus}." — At review time this is true of the repository but not yet of the cited declaration: `horn_valuation_realizable_iff` (the Lean anchor of Theorem 5.3, added this revision) exists only on the unpushed `feature/issue-5` branch. A referee following the URL today finds a `TractatusOntologyHorn.lean` *without* the theorem the paper cites. Not flagged critical because the merge that lands this paper lands the lemma with it — but it MUST be verified merged/pushed before submission. While doing so, pin the reviewed state with a commit hash, tagged release, or archival DOI (the paper currently pins only the toolchain, "Lean~4.26").

## minor

- **Thread root `BRIEF.md` ("63 declarations, no `sorry`s").** The paper says 64 (correct — verified 37+9+6+12 across the four modules this pass); the BRIEF predates the added lemma. The reviser declared this out of scope (BRIEF is input, not artifact), and I concur it does not warrant a flag or a dimension deduction — the reviewable document is internally consistent. It earns this comment because the count drift will mislead any future pass that trusts the BRIEF's evidence inventory. Update the BRIEF's Experiments section to 64 when the thread is next touched.

## nit

- **Figure 1 caption (§1).** Excerpt: "no Horn model shares a nontrivial exclusion model's image profiles" — the intended reading is "has the same image-profile *set*" (refinement equivalence, per Theorem 6.5); a fast reader may parse it as "shares any profile", which is false (both tiers realize e.g. the all-false profile). Consider "no Horn model realizes exactly the image profiles of a nontrivial exclusion model."
- **Repo `CLAUDE.md` bookkeeping (outside the paper).** `TractatusOntologyExclusion.lean` is 235 lines; the repo `CLAUDE.md` header says 236. The paper itself prints only the four-module total (1,064), which is exact — nothing to change in `main.tex`.
- **Procedural.** Render gate skipped per the audit-first fail-open contract (no PDF/compile-log for v3; `pub-audit` has not run) — compensated by an independent from-scratch compile this pass (0 overfull, 0 errors, 0 undefined refs, 10 pages; third post-bibtex pass needed to converge, confirming friction F15). Numeric-consistency detector ran via `uv` (42 numbers, 0 arithmetic claims, 0 findings, pass; sidecar at `tractatus-world-models.3.numeric/`). Evidence-check verifier ran (9/9 dimensions, 0 findings). No manual fallbacks needed.
