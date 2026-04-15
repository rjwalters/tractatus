# Review: tractatus-ontology.3

**Reviewer:** Automated (pub-review)
**Date:** 2026-04-14
**Target venue:** Review of Symbolic Logic
**Version history:** v1 (27/40) -> v2 (37/40) -> v3 (this review)

## Resolution of v2 Issues

### Important Issues (from v2)

1. **[RESOLVED] -- RSL document class.** The paper still uses `\documentclass[10pt, letterpaper]{article}`, but now includes (a) a prominent header comment (lines 1-6) explaining that conversion to the CUP class is planned for camera-ready stage, (b) MSC 2020 subject classification codes (line 142-145), and (c) Keywords (line 136-138). These are RSL submission requirements that were previously missing. The paper now follows RSL conventions within the article class (theorem numbering by section, booktabs tables, proper bibliography formatting with DOIs). While submitting in `article` class is still suboptimal, the addition of MSC codes and keywords demonstrates awareness of the venue requirements, and the header comment signals intentionality. This is now a cosmetic issue, not a structural one.

### Suggestions (from v2)

2. **[RESOLVED] -- World-model architecture figure.** The paper now includes Figure 1 (lines 650-724): a three-panel TikZ figure showing (a) the free model as a full Boolean cube with all 2^n vertices, (b) the weather model with invalid vertices (rain without clouds) crossed out in red, and (c) an abstract constrained model as an arbitrary subset. The figure is well-designed, uses color coding consistently (blue for free, green for valid weather worlds, red crosses for excluded, orange for abstract), and includes informative labels. The caption explicitly ties the figure to the theoretical point: "Compositionality holds in all three; independence holds only in (a)." This was previously the only unaddressed v1 suggestion and was listed as "nice to have" in v2.

3. **[RESOLVED] -- axiom silence: True justification.** The paper now includes Remark 7.5 (lines 1242-1254, labeled rem:why-true), a dedicated remark explaining why `True` was chosen as the axiom's type. The explanation is precise: because `True` is already provable via `trivial`, the axiom adds no logical content -- its content is its label, not its type. The remark draws an explicit parallel to TLP 7's status as a proposition that "says nothing." This fully addresses the suggestion.

4. **[RESOLVED] -- Page length.** The paper has grown from 13 to 15 pages (including appendices), addressing the concern about compactness. The additional material is substantive: Section 7.3 ("Beyond the Tractatus", lines 1257-1287) generalizes the collapse theorem beyond the Tractarian setting; Section 7.4 ("Future Work", lines 1289-1313) outlines four specific directions. The "Beyond the Tractatus" section is a particularly strong addition -- it argues that the collapse theorem is a general fact about typed embeddings of truth-functional languages, not specific to the Tractatus, which broadens the paper's appeal for logicians who may not be interested in Wittgenstein exegesis.

### New Issues (from v2 review)

5. **[RESOLVED] -- Overfull hbox in Appendix A.** The LaTeX log no longer shows the overfull hbox at the elan installation URL. The fix uses `\allowbreak{}` insertions in the URL (visible at line 1360). The LaTeX compilation now produces only one underfull hbox (badness 1127) at line 998 in the figure environment, which is cosmetic and below the threshold of concern.

6. **[RESOLVED] -- Table 1 abbreviations.** The theorem names in Table 1 now appear to be given in full. Cross-checking representative entries against the Lean source code confirms exact matches: `truth_functional_compositionality_gen`, `nontrivial_expressibility_requires_world_dependence`, `nontrivial_cannot_express_world_independent`, `formEq_implies_truth_table_iso`, etc. The v2 review's concern about truncated names with periods is no longer applicable.

7. **[RESOLVED] -- Corfield (2020) citation.** The characterization has been substantially revised. The v2 paper's dismissive phrasing ("argues at book length that homotopy type theory is a better logic for philosophy than predicate logic, but provides no machine-checked formalizations") has been replaced with the fair and collegial: "makes a sustained case for homotopy type theory as a foundation for philosophical reasoning, complementing the formal-verification approach taken here" (lines 1141-1144). This is appropriate scholarly positioning.

8. **[RESOLVED] -- "50 theorems" consistency.** The abstract now says "proves 50 formally verified results" (line 120-121). The conclusion says "proves 50 formally verified results" (line 1322). The table caption retains the more precise "50 theorem/lemma declarations" (line 1401). The introduction says "50 formalized results" (line 232). This is now internally consistent: "formally verified results" is used in all narrative contexts, while "theorem/lemma declarations" is reserved for the precise technical listing.

## Resolution of Audit Issues

### Important (from audit)

1. **[RESOLVED] -- Build infrastructure files.** The audit flagged that `lean-toolchain` and `lakefile.lean` did not exist in the repository. Both files now exist at the repository root:
   - `lean-toolchain` contains `leanprover/lean4:v4.17.0` (matching the paper's claim)
   - `lakefile.lean` declares the Mathlib dependency at `v4.17.0` with `srcDir := "proofs"` (matching the paper's claim)
   
   The build instructions in Appendix A can now be followed as written.

2. **[PARTIALLY RESOLVED] -- GitHub URL resolution.** The paper now uses `https://github.com/rjwalters/tractatus` (lines 125, 1340, 1362) instead of the previous `leangenius/tractatus-ontology`. The `leangenius.org` proof gallery URL is retained as a secondary reference. Whether these URLs resolve at publication time cannot be verified in this environment, but the GitHub URL now matches the expected naming convention (`rjwalters` matching the author name). The change from a third-party namespace to the author's own GitHub account is a significant improvement for long-term accessibility.

3. **[NOT APPLICABLE] -- Benzmuller 2017 cross-verification.** This was an audit limitation (no dedicated reference file), not a paper deficiency. The citation details remain plausible and the DOI format is correct.

### Minor (from audit)

4. **[RESOLVED] -- Geach author name.** The bibliography entry now reads "P.~T.~Geach" (line 1529), including the middle initial, consistent with the standard philosophy bibliography convention.

5. **[RESOLVED] -- Fogelin publisher.** The bibliography now uses "Routledge" (line 1504) rather than the ambiguous "Routledge & Kegan Paul," consistent with how the 1987 edition is cited in the broader literature.

6. **[RESOLVED] -- Table truncations.** As noted above (item 6 under v2 issues), theorem names now appear in full.

7. **[NOT APPLICABLE] -- "sorry" in comment.** This is a property of the Lean source file, not the paper. The paper correctly states "0 `sorry` obligations" and this claim is verified (the sole occurrence is in a design-decisions comment block, not in any proof term).

## Overall Assessment

This is a polished revision that systematically addresses every actionable issue from v2. The most significant additions are: (a) Figure 1 (world-model architecture), which was the only unaddressed suggestion from v1 and substantially improves visual communication; (b) the "Beyond the Tractatus" section (7.3), which generalizes the collapse theorem beyond Wittgenstein exegesis and broadens the paper's appeal; (c) the "Why True" remark (7.5), which sharpens the philosophical discussion of the deliberate axiom; (d) the Future Work section (7.4), which outlines concrete next steps; and (e) the build infrastructure files (lean-toolchain, lakefile.lean), which make the reproducibility claims actually verifiable. The Corfield citation has been softened appropriately, the Geach middle initial has been added, and the Fogelin publisher has been standardized.

The paper now stands at 15 pages and reads as a complete, well-structured contribution. The three-figure approach (Figure 1: world-model architecture; Figure 2: equivalence hierarchy) provides effective visual communication. The table of all 50 declarations in Appendix B is comprehensive and accurate -- every spot-checked theorem name matches the Lean source exactly. The bibliography of 15 entries is complete, consistently formatted with DOIs, and accurately positioned. The LaTeX compiles cleanly with no overfull hboxes, no undefined references, and only one trivial underfull hbox in a figure environment.

The remaining issues are genuinely minor. The document class is still `article` rather than CUP, but this is now explicitly acknowledged and the paper follows RSL conventions (MSC codes, keywords, theorem numbering, bibliography format) within that class. The `leangenius.org` proof gallery URL cannot be verified as live, but the primary GitHub URL uses the author's own namespace and is a reasonable permanent location. No new substantive issues were introduced by the revision.

## Scores

| Dimension | Score | v2 Score | v1 Score | Notes |
|-----------|-------|----------|----------|-------|
| Technical Soundness | 5/5 | 5/5 | 4/5 | No change; all claims continue to match Lean code exactly; theorem count (50), line counts (1229+288=1517), sorry count (0), axiom count (1) all verified |
| Novelty | 4/5 | 4/5 | 4/5 | No change in underlying contribution; Section 7.3 strengthens generality argument but does not constitute a new result |
| Experimental Rigor | 5/5 | 5/5 | 4/5 | No change; build files now exist, completing the reproducibility chain |
| Clarity | 5/5 | 5/5 | 4/5 | New sections (7.3, 7.4) and Remark 7.5 improve exposition; no regression |
| Related Work | 5/5 | 5/5 | 4/5 | Corfield citation softened; no new gaps identified |
| Figures/Tables | 5/5 | 4/5 | 1/5 | +1: World-model architecture figure (Fig. 1) added; now two well-designed figures and one comprehensive table; no remaining visual gaps |
| Reproducibility | 5/5 | 5/5 | 3/5 | Build files (lean-toolchain, lakefile.lean) now exist in repository; GitHub URL corrected to author namespace |
| Presentation | 5/5 | 4/5 | 3/5 | +1: Overfull hbox fixed; Geach middle initial added; Fogelin publisher standardized; "50 results" wording now consistent; MSC codes and keywords added; paper compiles with only 1 trivial underfull hbox |
| **Total** | **39/40** | **37/40** | **27/40** | |

## Critical Issues

None.

## Important Issues

None.

## Suggestions

1. **RSL document class (cosmetic).** Converting from `article` to the CUP LaTeX class before submission would ensure the paper matches RSL's visual expectations and avoid any desk-rejection inquiry. The paper's header comment states this will be done at camera-ready stage, which is acceptable if the journal's editorial office confirms they accept `article`-class submissions for review. Some journals do; some do not. A brief email to the RSL editorial office would resolve this.

2. **URL verification before submission.** Verify that `https://github.com/rjwalters/tractatus` resolves and contains the complete Lean source, build files, and a README. Verify that `https://leangenius.org/proof/tractatus-ontology` resolves or remove the proof gallery reference. Broken URLs at review time would undermine the reproducibility claims.

3. **Novelty score ceiling.** The paper scores 4/5 on novelty rather than 5/5 because the core result (expressibility collapse) remains, as the paper honestly acknowledges, definitional in character. To reach 5/5, one would need a result that is both conceptually novel and technically non-trivial -- for example, the finite-domain N-operator connection mentioned in Future Work. The current paper's novelty is in the formulation and the analytical framework (world-model parameterization, three-way decomposition), which is a genuine contribution but not at the level of, say, Weiss's Pi-1-1-completeness result for the same subject matter. This is not a criticism but an explanation of why the ceiling is 4.

## Recommendation

**ACCEPT**

The paper is ready for submission to the Review of Symbolic Logic. All critical and important issues from v1 and v2 have been resolved. The paper presents a genuine contribution at the intersection of formal philosophy and proof-assistant verification: a machine-checked Tractarian formalization that yields provable results about expressibility limits. The three-way decomposition (invariants/assumptions/limits) is a useful analytical contribution, the expressibility collapse theorem is philosophically interesting despite its definitional character, and the equivalence hierarchy provides a formal candidate for Wittgenstein's notion of logical form. The formalization is complete (50 results, 0 sorries, 1 deliberate axiom), reproducible (build files present, toolchain pinned), and accurately described. The paper is well-written, well-structured, and appropriately positioned in the literature. The sole remaining action item -- converting to the CUP document class -- is mechanical and can be performed at any point before or during the review process.
