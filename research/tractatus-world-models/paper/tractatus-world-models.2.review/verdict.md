# Verdict — tractatus-world-models.2

- **Total**: 35 / 44
- **Decision**: `advance: false`
- **Rubric**: `anvil-pub-v2` (threshold ≥35; critical flags short-circuit)

The total meets the numeric threshold, but two critical flags block advancement regardless of score.

## Critical flags

- **`theorem_artifact_mismatch` — Theorem 4.3 attributes to `horn_realizable_iff` a statement the artifact does not prove.** The paper prints a per-valuation realizability boundary ("A Boolean valuation $v : S \to \mathrm{Bool}$ is the profile of some world of $\mathrm{Horn}(S, \mathit{cs})$ iff $v$ satisfies every clause") and cites `horn_realizable_iff`; the actual Lean theorem (`proofs/TractatusOntologyHorn.lean`, verified this pass) is the *global* biconditional — every assignment `S → Prop` is realizable iff every clause is trivial (`∀ c ∈ cs, c.1 = c.2`). No declaration proving the printed per-valuation statement exists in any of the four modules. Since §1 asserts "Every result above is formalized in Lean~4 and checked by its kernel," a sophisticated reader who checks the artifact — the exact reader this paper courts — finds a kernel-checked-claim the kernel did not check, on one of the five headline contributions (C4). This is the "missing experiment for a claim" flag class instantiated for machine-checked philosophy, and it upholds the `.2.audit/` flag. The downstream separation chain (Lemma 5.3, Theorem 5.4, Corollary 5.5) does not depend on the mis-stated version and was re-verified sound.

- **`render_gate_overfull_boxes` — render gate failed on overfull boxes.** The deterministic render gate (step 4b) over `main.pdf` + the audit's `compile-log.txt` found overfull hboxes over the 5pt threshold: 6 unique boxes (18 log hits across the 3 concatenated pdflatex passes), worst 121.5pt at the §5 `colorModel` display, plus 75.3pt (Appendix module path) and 73.2pt (Definition 2.3 area). A 121.5pt margin violation is visibly broken typesetting in a submission PDF. Gate payload in `_gate.json`; mechanical to fix.

## Dimension summary

| # | Dimension | Weight | Score |
|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 4 |
| 2 | Evidence sufficiency | 6 | 4 |
| 3 | Clarity of contribution | 5 | 5 |
| 4 | Related-work positioning | 5 | 4 |
| 5 | Reproducibility | 5 | 4 |
| 6 | Figure & table quality | 4 | 3 |
| 7 | Prose & structural quality | 4 | 3 |
| 8 | Citation hygiene | 5 | 4 |
| 9 | Rhetorical economy | 4 | 4 |
| | **Total** | **44** | **35** |

Full justifications in `scoring.md`; line-level items in `comments.md`.

## Top 3 revision priorities

1. **Repair Theorem 4.3 (blocker).** Either (a) restate it to match `horn_realizable_iff`'s actual global biconditional — arguably the sharper TLP 2.061 rendering: *every* profile is realizable iff the clause list says nothing nontrivial — rewriting the contrapositive gloss and intro item (C4) to match; or (b) add the per-valuation Horn lemma to the Lean artifact (a few lines, mirroring `exclusion_realizable_iff`) and cite the new declaration in Thm 4.3 and Appendix A. Option (b) preserves the current prose; option (a) requires no artifact change. Also fix the adjacent artifact-precision items in the same pass: "nine lines" → "six lines" (§5 proof sketch), and the Figure 1 caption's "refinement-incomparable" → "not refinement-equivalent" (match the figure artwork's own "no refinement equivalence").
2. **Zero the overfull hboxes (blocker, mechanical).** Break the `colorModel` display (121.5pt), make the Appendix module path breakable (75.3pt), and rework the Definition 2.3 line (73.2pt); re-run the build until the log shows no boxes over 5pt.
3. **Citation and locator hygiene.** Add a resolvable artifact locator (repository URL + commit, or archival DOI) for the Lean development; add the Hacker page number and verify the quotation; verify the TLP 3.42 wording against Pears–McGuinness ("but" vs "nevertheless"); cite or drop the three unused bib entries — Spinney 2022 (the venue precedent) and Lokhorst 1988 (prior formal reconstruction) merit a sentence each in §6.

## Venue overlay

No venue overlay was scored: `.anvil.json` declares no `venue` key (deliberate — no `synthese.yaml` ships; see migration note F6). The generic /44 gate is the sole driver of this verdict.
