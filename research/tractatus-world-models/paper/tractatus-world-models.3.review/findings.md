# Findings — tractatus-world-models.3

Cross-section observations from the fresh /44 scoring pass (2026-07-13). Both v2 critical flags were re-verified against the artifact directly, per the verify-artifact-claims discipline — not accepted from `changelog.md`.

## Critical-flag re-verification

### v2 `theorem_artifact_mismatch` → resolved at the artifact

- `proofs/TractatusOntologyHorn.lean:167-176` now contains `horn_valuation_realizable_iff`:
  `(∃ w : HornModel S cs, ∀ s, w.val s ↔ (v s = true)) ↔ (∀ c ∈ cs, v c.1 = true → v c.2 = true)` — exactly the per-valuation boundary Theorem 5.3 prints ("A Boolean valuation $v : S \to \mathrm{Bool}$ is the profile of some world of $\mathrm{Horn}(S, \mathit{cs})$ iff $v$ satisfies every clause").
- The follow-on sentence's global form matches `horn_realizable_iff` (lines 137-140): every assignment `S → Prop` realizable iff every clause is trivial (`c.1 = c.2`). Intro item (C4) and the Appendix rows (per-valuation row for Thm 5.3 + new "(global Horn boundary)" row) are consistent with both.
- Full `lake build` (elan toolchain v4.26.0) this pass: "Build completed successfully (3068 jobs)", 0 errors, 0 warnings, exactly the 9 documented `#eval` info lines (5 from `TractatusOntology`, 4 from `TractatusDecidability`).
- `#print axioms Tractatus.horn_valuation_realizable_iff` → "does not depend on any axioms" — stronger than the paper's claimed `propext`/`Classical.choice`/`Quot.sound` envelope, so the abstract's axiom-footprint claim holds as an upper bound.
- File-level attribution (Claude authorship, mirroring `exclusion_realizable_iff`) matches the paper's §7.5 disclosure and Acknowledgments.

### v2 `render_gate_overfull_boxes` → resolved; gate skipped, independently verified

- Render gate (step 4b) skipped fail-open: neither `tractatus-world-models.3/paper.pdf`/`main.pdf` nor a `.3.audit/compile-log.txt` exists (`pub-audit` has not run on v3). No `_gate.json` is emitted for a skipped gate.
- Because the v2 gate failure was flag-bearing, the reviewer compiled v3 from scratch in an isolated scratch dir: `pdflatex → bibtex → pdflatex ×3` (the third post-bibtex pass per friction F15). Final log: **0 overfull hboxes at any threshold**, 0 errors, 0 warnings, 0 undefined references/citations; `main.pdf`, 10 pages. F15 confirmed empirically: the "Labels may have changed" rerun hint is present after post-bibtex passes 1 and 2 and gone after pass 3. Scratch dir cleaned after the pass.

## Count verification (v2 priority 3 residue + changelog claims)

- Four-module totals: `wc -l` = 472 + 212 + 145 + 235 = **1,064 lines exactly** (paper: "1{,}064 lines"). Top-level declarations: Spectrum 37 + Horn 9 + Equiv 6 + Exclusion 12 = **64** (paper: "64 declarations"; a naive grep counts 10 in Horn, but one hit is doc-comment text at line 13).
- Horn module moved 174 → 212 lines, 8 → 9 declarations, matching the changelog.
- `refs.bib`: 17 entries, 17 distinct cited keys, sets identical — "17/17 bib entries cited" verified.
- `exclusion_not_horn` proof body is 6 tactic lines — "The kernel-checked proof is six lines" now correct.
- Thread-root `BRIEF.md` still says 63 declarations (predates the lemma; reviser-declared out of scope). Judged comment-worthy, not flag-worthy — see `comments.md`.

## Other v2 fixes spot-checked

- Figure 1 caption reads "not refinement-equivalent" (matches Theorem 6.5 and the artwork's "no refinement equivalence"; figure rendered and inspected — legible, black-only).
- Hacker claim is now an indirect quotation (no quotation marks, no invented page number); TLP 3.42 is paraphrased outside quotation marks, cited to `wittgenstein1921`.
- `evans2014` converted to `@misc` with `eprint`/`archivePrefix`; `\date` draft marker dropped; proper-noun case protection added across six entries.

## Advisory tool outcomes

- **Numeric consistency (step 4c)**: ran via `uv run --project .anvil python -m anvil.lib.numeric_consistency tractatus-world-models.3/ --write-review` — 42 numbers extracted, 0 arithmetic claims, 0 findings, pass. Sidecar written at `tractatus-world-models.3.numeric/_review.json`.
- **Evidence check (step 5b)**: ran against the staged `scoring.md` — 9 dimensions checked, 0 findings, pass.
- **Provenance / subject-voice tiers (steps 4d/4e)**: inactive — the BRIEF declares no `corpus:` and no `subjects:`; no blocks emitted.
- **Web-search knob**: absent from BRIEF frontmatter — D4 scored from domain knowledge + `refs.bib` only.

## Rubric version transition

Prior review sibling `tractatus-world-models.2.review/_meta.json` stamps `rubric_id: "anvil-pub-v2"` — identical to this pass's rubric, so no transition subsection is required; the v2→v3 score delta (35/44 → 43/44) is directly comparable.
