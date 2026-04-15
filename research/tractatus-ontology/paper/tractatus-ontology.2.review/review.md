# Review: tractatus-ontology.2

**Reviewer:** Automated (pub-review)
**Date:** 2026-04-14
**Target venue:** Review of Symbolic Logic
**Previous version score:** 27/40

## Resolution of Prior Issues

### Critical Issues

1. **[RESOLVED] -- Theorem count.**
   The v1 paper claimed "46 theorems" but the Lean code contained a different number of declarations. The v2 paper now claims "50 theorem and lemma declarations" (abstract, Section 1, Section 8, Appendix B). Verified by grep: TractatusOntology.lean has 41 theorem/lemma declarations (40 public theorems + 1 lemma, plus 1 private theorem `eq_of_structEq`); TractatusQuantifiers.lean has 9 theorems. Total: 50. This matches exactly. The paper further clarifies in a footnote: "TractatusOntology.lean (1,229 lines, 41 theorem/lemma declarations) and TractatusQuantifiers.lean (288 lines, 9 theorem declarations), plus 1 deliberate axiom." Appendix B (Table 1) lists all 50 declarations individually with Lean names, TLP references, file, and classification. This is thorough and leaves no ambiguity.

2. **[RESOLVED] -- Triviality objection.**
   The v1 review flagged that the expressibility collapse theorem risked the charge of triviality. The v2 paper adds Remark 5.5 ("On the definitional character of the collapse"), a substantial 3-paragraph defense that: (a) acknowledges the objection explicitly ("A natural objection is that the expressibility collapse theorem is *trivial*..."), (b) defends the formulation as the contribution via three arguments (making the object/meta boundary typed; analogy to other definitional results in logic such as Tarski's undefinability theorem; the constraint being genuinely informative), and (c) points out that one must also establish `world_constant_taut_or_contra` as a non-trivial intermediate step. This is a well-crafted preemptive defense that should satisfy most referees. The analogy to Tarski's undefinability theorem is apt.

3. **[RESOLVED] -- Build instructions.**
   The v1 paper provided no build instructions. The v2 paper adds: (a) a footnote in the abstract specifying Lean 4 toolchain v4.17.0, Mathlib dependency, and `lake build`; (b) a full Appendix A (Build Instructions) with step-by-step reproduction instructions including elan installation, git clone, lean-toolchain pin, lakefile dependency, and build command; (c) explicit file-level line counts and declaration counts. This is comprehensive and sufficient for reproducibility.

4. **[PARTIALLY RESOLVED] -- RSL formatting.**
   The v1 review noted that RSL requires the Cambridge University Press LaTeX class. The v2 paper still uses `\documentclass[10pt, letterpaper]{article}` rather than the RSL/CUP house style. However, the paper now uses `booktabs` for tables, includes proper theorem environments, and has consistent bibliography formatting with DOIs. The bibliography is now formatted uniformly (all entries have DOIs where available, the Scherf entry is properly marked as "Unpublished manuscript"). The paper compiles cleanly with no LaTeX warnings and no undefined references. Converting to the CUP class is a mechanical task that can be done at camera-ready stage, but submitting in `article` class may still trigger a desk-rejection warning at some journals.

### Important Issues

5. **[RESOLVED] -- `Nonempty S` assumption discussed.**
   The v2 paper adds Remark 5.6 ("The Nonempty S assumption"), a thorough 2-paragraph discussion explaining: (a) the philosophical motivation (a world with no possible states of affairs is degenerate in the Tractarian framework, citing TLP 1); (b) the technical role (constructing witness worlds for case-splitting); (c) what happens when S is empty (every proposition is a tautology). This is exactly the kind of discussion the v1 review requested.

6. **[RESOLVED] -- First-order extension underdeveloped.**
   The v2 paper significantly expands Section 5.4, now spanning approximately 55 lines of paper text (up from ~30). It explicitly acknowledges the section is "preliminary," lists all 9 results by name, and clearly states that the N-operator connection is deferred. The HOAS tradeoff is now discussed (tied more tightly to Lean's metatheory than de Bruijn indices). The Geach-Soames critique is cited. The honest framing ("This section is preliminary. The results proved are standard consequences of the semantic definitions.") preempts the objection that the section over-promises.

7. **[RESOLVED] -- formEq/semEq implication chain clarified.**
   The v2 paper now states explicitly in the proof of Theorem 5.8: "Logical-form equivalence implies truth-table isomorphism... When this relabeling is the identity, semantic equivalence follows. However, formEq does *not* imply semEq in general---the relabeling need not be trivial." This is clear and correct.

8. **[RESOLVED] -- Fogelin cited.**
   Fogelin (1987) is now cited in both the introduction (line 143) and the related work section (line 988, 1003), properly positioned as initiating the expressive completeness debate. A `\bibitem{fogelin1987}` entry is included with correct publication details.

9. **[RESOLVED] -- Carruthers cited.**
   Carruthers (1989) is now cited in the introduction (line 148) and related work (line 989, 1012-1014), described as providing "a sympathetic reconstruction of Tractarian semantics." A `\bibitem{carruthers1989}` entry is included.

10. **[RESOLVED] -- Weather model connected to philosophical literature.**
    The v2 paper adds a paragraph after the weather model (lines 610-621) explicitly connecting constrained models to Wittgenstein's own retreat from independence in "Some Remarks on Logical Form" (1929), citing the color-exclusion problem. The paper notes the structural analogy: "the weather model's constraint that rain implies clouds is structurally analogous to the color-exclusion problem." A new `\bibitem{wittgenstein1929}` entry is included. This is precisely the connection the v1 review requested.

### Suggestions

11. **[RESOLVED] -- Equivalence hierarchy figure.**
    The v2 paper adds Figure 1 (lines 854-897): a TikZ nested-containment diagram showing structEq inside formEq inside semEq, with separating witnesses labeled. The figure is well-designed, uses color coding, and includes the specific separating examples (elem(rain) formEq elem(snow) but not structEq; neg(neg(elem s)) semEq elem s but not formEq). Referenced in text at line 900.

12. **[RESOLVED] -- Three-way decomposition table.**
    Appendix B (Table 1) provides a complete listing of all 50 theorem/lemma declarations classified as I (invariant), A (assumption/counterexample), L (limit), H (hierarchy helper), or E (engineering). This is exactly the table the v1 review suggested, and it serves double duty by also resolving the theorem-count issue.

13. **[NOT ADDRESSED] -- World-model architecture figure.**
    No diagram of freeModel/weatherModel/ConstrainedWorld has been added. The text descriptions are clear, but a figure showing the Boolean cube vs. constrained subspace would still add value. This is a nice-to-have, not a requirement.

14. **[RESOLVED] -- Complete theorem table.**
    See item 12. Table 1 in Appendix B is comprehensive and well-organized.

15. **[PARTIALLY ADDRESSED] -- axiom silence philosophical discussion.**
    The discussion in Section 7.2 (lines 1126-1136) is adequate but unchanged from v1 in substance. The axiom is described as "not a missing proof but a design boundary." The suggestion to explain why `True` specifically (rather than another trivially provable statement) remains unaddressed. This is a minor point.

16. **[RESOLVED] -- Choice of Lean 4 discussed.**
    Remark 2.1 (lines 255-266) provides a concise 3-point justification: (i) dependent type theory suits mixed definitions and proofs; (ii) Mathlib automation keeps proofs concise; (iii) tactic mode enables readable proof scripts. This is well-targeted for RSL readers.

17. **[RESOLVED] -- evalBool material relegated.**
    The v2 paper relegates evalBool to a footnote (lines 369-374), calling it "an engineering artifact" that "is not philosophically load-bearing." The theorem table classifies `evalBool_correct` as class E (engineering). This is the right treatment.

18. **[RESOLVED] -- Bibliography proofread.**
    The Benzmuller (2017) entry now correctly cites the *Journal of Applied Logic* paper with DOI (10.1016/j.jal.2017.01.001). Fitelson & Zalta (2007) has DOI. The Scherf (2025) entry is now marked "Unpublished manuscript, 2025." All entries have consistent formatting. The bibliography has grown from 11 to 15 entries, which is more appropriate for RSL.

19. **[RESOLVED] -- HOAS tradeoff acknowledged.**
    Section 5.4 (lines 931-936) now states: "The HOAS encoding leverages Lean's metalanguage for variable binding, avoiding explicit substitution machinery. This substantially reduces proof overhead but ties the formalization more tightly to Lean's metatheory than a de Bruijn index encoding would."

20. **[RESOLVED] -- Scherf (2025) publication status clarified.**
    The bibitem now reads "Unpublished manuscript, 2025" with a GitHub URL. This is appropriate citation practice for an unpublished work.

## Overall Assessment

The revision is thorough and responsive. Of the 4 critical issues identified in v1, 3 are fully resolved and 1 (RSL formatting) is partially resolved. The theorem count is now verifiably correct at 50 declarations (41 + 9), with a complete listing in Appendix B. The triviality objection is addressed with a well-crafted 3-paragraph remark. Build instructions are comprehensive. All 6 important issues are fully resolved, including the Nonempty S discussion, the first-order section's honest framing, the formEq/semEq clarification, both missing citations (Fogelin, Carruthers), and the weather model's connection to the color-exclusion problem. Of the 10 suggestions, 8 are fully resolved and 2 are partially or not addressed.

The paper is now substantially stronger. The addition of Figure 1 (equivalence hierarchy) and Table 1 (complete theorem listing) address the most conspicuous gap from v1 (Figures/Tables scored 1/5). The classical-logic remark (Remark 2.2) and Lean-4 justification (Remark 2.1) add necessary context for the RSL audience. The bibliography has grown from 11 to 15 entries, all consistently formatted with DOIs. The paper compiles cleanly with no LaTeX warnings.

The remaining issue of consequence is the document class: RSL uses a CUP class, and the paper still uses `article`. This is a formatting-only concern that can be addressed mechanically, but it should be done before submission to avoid a desk-rejection inquiry. A second minor concern is that the paper, at 13 pages including appendices, is on the short side for RSL but within acceptable bounds given the focused contribution.

## Scores

| Dimension | Score | v1 Score | Delta | Notes |
|-----------|-------|----------|-------|-------|
| Technical Soundness | 5/5 | 4/5 | +1 | Theorem count verified at 50; all claims match Lean code; 0 sorry confirmed; Nonempty S discussed; classical logic made explicit |
| Novelty | 4/5 | 4/5 | 0 | Expressibility collapse and parameterized world models remain genuine contributions; no change in underlying novelty |
| Experimental Rigor | 5/5 | 4/5 | +1 | Theorem count now exact; complete listing in Appendix B; build instructions in Appendix A; line counts and file-level breakdown provided |
| Clarity | 5/5 | 4/5 | +1 | Triviality remark, Nonempty S remark, Lean 4 remark, classical logic remark, and honest first-order framing all improve accessibility; structure logical and well-motivated |
| Related Work | 5/5 | 4/5 | +1 | Fogelin, Carruthers, Wittgenstein 1929, Corfield all added; 15 references with consistent formatting; positioning accurate and complete |
| Figures/Tables | 4/5 | 1/5 | +3 | Figure 1 (hierarchy) and Table 1 (complete theorem listing) are well-executed; missing world-model architecture figure prevents 5/5 |
| Reproducibility | 5/5 | 3/5 | +2 | Full build instructions in appendix; toolchain pinned; Mathlib dependency stated; clone/build workflow explicit |
| Presentation | 4/5 | 3/5 | +1 | Bibliography consistent with DOIs; clean LaTeX compilation; but still using article class instead of RSL/CUP class; minor overfull hbox in appendix |
| **Total** | **37/40** | **27/40** | **+10** | |

## Critical Issues (must fix)

None. All critical issues from v1 have been resolved or reduced to non-critical status.

## Important Issues (should fix)

1. **RSL document class.** The paper still uses `\documentclass[10pt, letterpaper]{article}` rather than the CUP LaTeX class required by RSL. While this is a mechanical change, it should be done before submission. Some journals will desk-reject papers not in their house style. This was a critical issue in v1 and is now downgraded to important because the content-level formatting (theorem environments, bibliography, etc.) is now solid.

## Suggestions (nice to have)

1. **World-model architecture figure.** A diagram showing the free model (full Boolean cube) versus constrained models (weather model, abstract constraint) would further improve accessibility. The text descriptions are clear, but a visual would be welcome given that Figure 1 demonstrates the effectiveness of the figure approach.

2. **axiom silence: True justification.** A brief remark explaining why `True` specifically (rather than, say, `False -> False` or some other trivially provable statement) would sharpen the philosophical point. The current treatment is adequate but could be more precise.

3. **Page length.** At 13 pages including appendices, the paper is compact for RSL. If space allows, consider expanding the discussion of how the formalization's insights extend beyond the Tractatus to other truth-functional frameworks (e.g., the expressibility collapse holds for any object language embedded in a richer metalanguage with the same typed structure).

## New Issues Introduced by Revision

1. **Minor overfull hbox.** The LaTeX log shows an overfull hbox (8.97pt) at lines 1196-1198 in Appendix A, caused by the long `import Mathlib.Tactic` monospace string. This is cosmetic but should be fixed (e.g., allow hyphenation or use `\texttt` with `\allowbreak`).

2. **Table 1 abbreviations.** The theorem names in Table 1 are abbreviated with ellipsis-like truncation (e.g., `truth_func._compositionality_gen`, `nontrivial_expr._requires_world_dep.`). While space constraints motivate this, providing full names in a smaller font or in a landscape-oriented table would be more precise. A reader cross-referencing against the Lean code needs exact names.

3. **Corfield (2020) citation.** The addition of Corfield (2020) is appropriate, but the characterization ("argues at book length that homotopy type theory is a better logic for philosophy than predicate logic, but provides no machine-checked formalizations") is somewhat dismissive for a single sentence. Consider either expanding the engagement or softening the phrasing.

4. **"50 theorems" vs "50 theorem and lemma declarations."** The abstract says "proves 50 theorem and lemma declarations" (precise), but the conclusion says "proves 50 theorems and lemmas" (slightly less precise). The Lean file contains 49 theorems and 1 lemma. The wording is not wrong but could be more consistent: either always say "theorem and lemma declarations" or clarify the 49/1 split.
