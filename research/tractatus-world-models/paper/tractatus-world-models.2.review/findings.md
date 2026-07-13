# Findings — tractatus-world-models.2

Cross-section observations from the pub-review pass (claude-fable-5, 2026-07-13).

## Document shape

- Single-file paper: `resolve_tex_inputs(main.tex)` returned only `main.tex`; `ResolvedTex.missing` is empty (no dangling `\input`/`\include`). 17-entry `refs.bib`, one figure (`figures/spectrum.pdf`, with source under `figures/src/`).
- This is v2 of a format migration (v1 → anvil pub grammar); there is no `tractatus-world-models.1.review/` sibling, so this is the thread's first scored review. No prior rubric to transition from — the rubric-version-transition subsection is intentionally absent.

## Artifact-claim verification (carried from and re-confirmed against `.2.audit/`)

- The audit's critical flag on Theorem 4.3 was independently re-verified this pass by reading `proofs/TractatusOntologyHorn.lean` in the worktree: `horn_realizable_iff` is the global biconditional `(∀ assignment, ∃ w, ∀ s, w.val s ↔ assignment s) ↔ (∀ c ∈ cs, c.1 = c.2)`. The paper's per-valuation Theorem 4.3 is not this statement and has no counterpart declaration in the artifact. Flag upheld as a blocker (see `verdict.md`).
- The audit's positive verifications (63 declarations, clean `lake build`, axiom footprint, 42/42 Appendix names, figure freshness) were treated as tool evidence and inform dims 2 and 5; they were not re-run this pass.

## Render gate (step 4b)

- `gate(pdf_path=main.pdf, log_path=.2.audit/compile-log.txt, page_cap=None, overfull_threshold_pt=5.0)`: **failed** on the `overfull_boxes` dimension — 18 log hits over 5pt (6 unique boxes × 3 pdflatex passes concatenated in `compile-log.txt`; worst 121.5pt). Pages: 9. Placeholder scan: clean. Compile: skipped (pre-built PDF from `pub-audit`). Full payload in `_gate.json`; per the step 4b wiring the failure contributes a `render_gate_overfull_boxes` critical flag to `_review.json`.
- Two procedural mismatches recorded as migration friction (F13, F14 in `../ANVIL-MIGRATION-NOTES.md`): the command doc names the gate input `<thread>.{N}/paper.pdf` while the audit's artifact is `main.pdf`; and the multi-pass compile log triple-counts each overfull box.

## Numeric consistency (step 4c)

- `anvil.lib.numeric_consistency` over `main.tex`: 42 numbers extracted, 0 arithmetic claims, 0 findings, pass. Advisory sidecar written to `tractatus-world-models.2.numeric/_review.json`. The one real numeric defect in the paper — the "nine lines" proof-length claim vs the 6-line proof body — is claim-vs-artifact, outside the detector's claim-vs-claim scope; it is carried as a `major` comment instead.

## Conditional tiers

- Corpus provenance tier (issue #612): inactive — no `corpus:` key in `BRIEF.md`. No provenance back-check, no `provenance_back_check` block.
- Subject voice tier (issue #613): inactive — no `subjects` declared. Dim 7 scored without the sub-pass.
- Venue overlay: `.anvil.json` has no `venue` key (deliberate, migration note F6 — no `synthese.yaml` ships), so no `_review.venue.json`. Synthese calibration was applied informally through the generic rubric's "sophisticated program committee member" standard.
- `web_search` knob: absent from `BRIEF.md` frontmatter — no web searches run; dim 4 scored from the body, `refs.bib`, and the v1 `literature.md` inheritance.

## Cross-section observations

1. **The one defect is load-bearing but repairable in place.** The Thm 4.3 mis-attribution does not infect the separation chain: Lemma 5.3 and Theorem 5.4 depend only on `hornModel_allTrue_realizable` / `exclusionModel_allTrue_not_realizable` / `refinesEquiv_iff_image_eq`, all verified. Either repair option (restate, or add the small per-valuation lemma) leaves the paper's argument intact — this is a one-revision fix.
2. **Statement-vs-artifact discipline is otherwise excellent.** Every other theorem's prose statement matches its Lean declaration per the audit's 17-row spot-check; the paper's practice of displaying the Lean name inline after each theorem is exactly what made the Thm 4.3 slip detectable.
3. **Precision drift at the edges of the formal core.** The two overstatement instances both sit in *informal* surroundings of correct theorems: the figure caption ("refinement-incomparable") and the proof-length aside ("nine lines"). A pass over every informal gloss of a formal result, asking "is this the theorem or more than the theorem?", would catch this class before submission.
4. **The positioning sections are the paper's strength** — each rival (Button, Moss, combinatorialism, cathoristic logic) gets a named, falsifiable relationship to a specific theorem. Extending the same treatment to Spinney 2022 and Lokhorst 1988 (already in `refs.bib`) would close the only related-work gap visible from the bibliography itself.
5. **Reproducibility is one link short of exemplary.** All the hard parts (axiom footprint, cross-reference table, toolchain pin) are done; only a resolvable artifact locator is missing.

## Orchestrator note

- This review ran under an agent harness whose output-file guard intercepts `Write` calls to `findings.md`; per `commands/pub-review.md` §Atomicity (orchestrator note), this required manifest file was written via shell redirect into the staging dir instead. Content and contract are unchanged.
