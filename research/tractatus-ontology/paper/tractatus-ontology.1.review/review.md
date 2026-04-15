# Review: tractatus-ontology.1

**Reviewer:** Automated (pub-review)
**Date:** 2026-04-14
**Target venue:** Review of Symbolic Logic

## Overall Assessment

This paper presents a machine-checked formalization of the semantic core of Wittgenstein's *Tractatus Logico-Philosophicus* in Lean 4. The central contribution is threefold: (1) a parameterized world-model abstraction that separates structural invariants from modeling assumptions, (2) an `expresses` relation that formalizes the object/meta boundary and yields a provable "expressibility collapse" theorem (the saying/showing distinction rendered as a theorem), and (3) an equivalence hierarchy (structEq, formEq, semEq) with strict separation witnesses. The formalization is accompanied by a first-order extension handling quantifiers via HOAS.

The paper is well-structured and clearly written, with a genuine contribution that goes beyond mechanical encoding of known results. The expressibility collapse theorem is the headline result and is philosophically interesting: it transforms a notoriously elusive Wittgensteinian thesis into a two-line proof that exploits the typed structure of the formalization. The parameterized world-model abstraction is a sound design decision that enables the invariant/assumption/limit trichotomy, which is itself a useful analytical contribution. The related work coverage is solid for the target venue.

However, several issues require attention before submission to RSL. The theorem count claim (46) does not precisely match the Lean code (I count 48 theorem/lemma declarations across both files, or different numbers depending on counting conventions). The expressibility collapse theorem, while correct, is arguably a straightforward consequence of the definition of `expresses` -- the philosophical significance needs stronger justification against the objection that the result is baked into the definition. The paper lacks figures entirely, which is a missed opportunity given the hierarchical and structural nature of the results. The first-order extension (Section 5.4) feels underdeveloped relative to its billing -- it proves standard results but the promised N-operator connection is deferred. Finally, several RSL formatting conventions are not followed.

## Scores

| Dimension | Score | Notes |
|-----------|-------|-------|
| Technical Soundness | 4/5 | Lean code compiles; claims match formalization with minor discrepancies in theorem count |
| Novelty | 4/5 | Expressibility collapse and parameterized world models are genuine contributions; equivalence hierarchy is useful but less novel |
| Experimental Rigor | 4/5 | 0 sorries confirmed; 1 deliberate axiom; theorem count claim (46) slightly off from code (48 declarations) |
| Clarity | 4/5 | Well-organized; code listings well-chosen; some sections (Section 5.4) feel rushed |
| Related Work | 4/5 | Strong coverage of formal reconstructions and proof-assistant philosophy; missing some relevant work |
| Figures/Tables | 1/5 | No figures or tables whatsoever; significant missed opportunities |
| Reproducibility | 3/5 | Code URL provided but no build instructions, no Lean version/toolchain pinned, no lakefile shown |
| Presentation | 3/5 | Good prose quality; LaTeX formatting issues; not in RSL house style; bibliography formatting inconsistent |
| **Total** | **27/40** | |

## Critical Issues (must fix)

1. **Theorem count discrepancy.** The paper claims "46 theorems" (abstract, Section 1, Section 7). Counting all `theorem` and `lemma` declarations across both Lean files yields 48 (37 public theorems + 1 lemma + 1 private theorem in `TractatusOntology.lean`, plus 9 theorems in `TractatusQuantifiers.lean`). The axiom `silence` adds 1 more declaration. The paper needs to either reconcile the count (e.g., by clarifying what is excluded -- perhaps the private helper and `evalBool_correct`?) or fix the number. RSL reviewers will check this.

2. **The `expresses` relation risks the charge of triviality.** The definition `expresses p P := forall w, p.eval w <-> P` is elegant but invites a serious objection: since `P : Prop` is world-independent by construction (it is a closed term in Lean's metalanguage), the collapse to tautology/contradiction follows almost definitionally. A referee may argue that the theorem merely restates the definition in different words. The paper needs a preemptive defense: (a) explicitly acknowledge the objection, (b) argue that the *formulation* is the contribution (making the object/meta boundary typed), and (c) compare to analogous results in formal semantics where definitional consequences are nonetheless philosophically illuminating (e.g., Tarski's undefinability theorem is also "definitional" in a sense). Currently the paper gestures at this in Section 6.1 ("The philosophical content lies not in the proof's difficulty but in the *formulation*") but does not adequately address the triviality objection head-on.

3. **No build instructions or toolchain specification.** The paper provides a URL (`leangenius.org/proof/tractatus-ontology`) but no information about which Lean 4 version, which Mathlib version, or how to build the project. There is no `lakefile.lean` or `lean-toolchain` file mentioned. An RSL reviewer interested in verifying the claims cannot do so without this information. At minimum, add a footnote or appendix specifying: Lean 4 version, Mathlib dependency (the code imports `Mathlib.Tactic`), and build command.

4. **RSL requires a specific submission format.** The paper uses `\documentclass[10pt, letterpaper]{article}` but RSL uses the Cambridge University Press style (`\documentclass{jsl}` or their specific LaTeX class). The bibliography should use BibTeX with the RSL `.bst` file. These are formatting requirements that will cause desk rejection if not addressed.

## Important Issues (should fix)

5. **The `Nonempty S` assumption should be discussed.** Several key theorems (`saying_showing_triviality`, `world_constant_taut_or_contra`, `structEq_ne_semEq`) require `[Nonempty S]`. This means the expressibility collapse theorem does not apply when the type of states of affairs is empty. The paper should discuss this assumption explicitly: is it philosophically motivated (a world with no possible states of affairs is degenerate)? Is it necessary or could it be weakened? Currently it appears silently in code listings without comment.

6. **The first-order extension (Section 5.4) is underdeveloped.** This section describes 9 theorems from `TractatusQuantifiers.lean` but devotes only about 30 lines of paper text to them. The results proved (compositionality, duality, distribution, vacuous quantifier elimination) are standard. The interesting promised result -- connecting quantifiers to the N-operator for finite domains -- is explicitly deferred. Either expand this section to justify its inclusion or acknowledge more forthrightly that the first-order extension is preliminary.

7. **The equivalence hierarchy's "formEq does not imply semEq" direction is not fully stated.** The paper and code prove `formEq_implies_truth_table_iso` and then `truth_table_iso_id_implies_semEq`, but the implication chain from `formEq` to `semEq` requires the relabeling to be the identity. The text should be clearer that `formEq` does NOT imply `semEq` in general -- which is actually the point of the strict separation -- because the current prose in Section 5.3 could be misread as claiming `formEq => semEq`.

8. **Missing related work: Fogelin.** Robert Fogelin's *Wittgenstein* (1976/1987) is the origin of the expressive completeness debate that Geach and Soames respond to. Miller's paper explicitly rebuts Fogelin. Fogelin should be cited as the initiator of this critical thread.

9. **Missing related work: Carruthers.** Peter Carruthers' *Tractarian Semantics* (1989, Blackwell) is a book-length treatment of Tractarian semantics that Miller engages with. It deserves at least a mention in Section 6.

10. **The weather model example is charming but under-motivated.** The paper presents it as showing that independence fails in constrained models, but does not connect it back to the philosophical literature. Are there Tractatus commentators who have discussed physical constraints on atomic facts? The example would be stronger if tied to a specific interpretive debate (e.g., the color-exclusion problem that Wittgenstein himself later acknowledged as problematic in "Some Remarks on Logical Form" (1929)).

## Suggestions (nice to have)

11. **Add a figure for the equivalence hierarchy.** A simple diagram showing `structEq` contained in `formEq` contained in `semEq` with the separating witnesses labeled would greatly aid comprehension. This could be a Hasse diagram or a Venn-style containment diagram.

12. **Add a figure for the three-way decomposition.** The invariants/assumptions/limits trichotomy is a key organizational contribution. A table or figure listing each theorem and its classification (possibly color-coded) would be extremely useful for the reader and would strengthen the paper's analytical contribution.

13. **Add a figure for the world-model architecture.** A diagram showing `freeModel` (full Boolean cube), `weatherModel` (constrained subspace), and `ConstrainedWorld` (abstract constraint) would make the parameterized world-model design more accessible.

14. **Consider adding a table of all formalized theorems.** An appendix with a complete table (theorem name, Lean name, TLP reference, classification as invariant/assumption/limit) would be valuable for both philosophers and logicians. This would also resolve the theorem-count issue definitively.

15. **Strengthen the philosophical discussion of `axiom silence : True`.** The paper explains that this is a deliberate boundary marker, not a missing proof. This is a nice conceit, but the philosophical argument could be sharpened: explain *why* `True` (rather than, say, `axiom silence : False -> False`) and connect more explicitly to TLP 7's injunction to silence. The current treatment is adequate but could be more compelling.

16. **Discuss the choice of Lean 4 vs. alternatives.** A brief remark on why Lean 4 (rather than Coq, Isabelle, or Agda) would be appropriate for RSL readers who may not be familiar with the proof-assistant landscape. The Mathlib ecosystem, dependent type theory, and tactic mode are relevant considerations.

17. **The `evalBool` / `evalBool_correct` material could be cut.** The Bool-valued evaluator is a nice engineering feature but adds little to the paper's philosophical or logical contribution. Cutting it would free space for more important material (e.g., expanding the first-order section or adding figures).

18. **Proofread bibliography entries.** The Benzmüller & Woltzenlogel Paleo (2017) entry describes an "object-logic explanation of the inconsistency in Gödel's ontological theory" which is the 2017 *Journal of Applied Logic* paper, but the literature review references their 2013 Isabelle Archive of Formal Proofs entry. These are distinct works; verify the correct one is cited. Also, the Fitelson & Zalta (2007) entry should verify page numbers and DOI.

19. **Consider acknowledging the limits of HOAS more prominently.** The paper notes that HOAS "ties the formalization to Lean's metatheory more tightly than de Bruijn indices would" (in the Lean comments) but the paper text says only that HOAS "leverages Lean's metalanguage for variable binding." A sentence acknowledging the tradeoff would be appropriate for the RSL audience.

20. **The Scherf (2025) citation is to PhilPapers/GitHub -- confirm publication status.** If this is a preprint or unpublished manuscript, it should be cited as such. RSL reviewers may question citing unpublished work as a primary comparator.

## Detailed Comments by Section

### Section 1 (Introduction)

- The framing is effective: the paper positions itself at the intersection of formal reconstructions of the Tractatus, proof-assistant philosophy, and formal semantics. The three-class decomposition (invariants/assumptions/limits) is stated clearly and serves as an effective organizing principle.
- Line 178-181: "proves 46 theorems with 0 sorry obligations and 1 deliberate axiom" -- as noted above, the theorem count needs verification. The "0 sorry" claim is confirmed by grep (the only occurrence of "sorry" in TractatusOntology.lean is in a comment referencing an earlier version).
- The paper could benefit from a brief "roadmap" paragraph at the end of the introduction listing the paper's specific claims as numbered contributions, which is standard for RSL submissions.

### Section 2 (The Formalization)

- Well-structured subsections covering objects, worlds, propositions, evaluation, and world models.
- The choice to present `World S = S -> Prop` and then immediately introduce `WorldModel` as a generalization is well-motivated.
- Section 2.4 (evaluation): The `evalBool` material is mentioned but adds little. Consider cutting or relegating to a footnote.
- Section 2.6 (general world models): The `nonempty` field in `WorldModel` is a good design choice but should be motivated: why require at least one world?

### Section 3 (Structural Invariants)

- Compositionality (Theorem 3.1): The proof is clean and the code listing is well-chosen. The generalization from `truth_functional_compositionality` to `truth_functional_compositionality_gen` is the key step.
- Bivalence (Section 3.2): The connection to classical logic is correctly noted. A constructivist reviewer might note that many of these results depend on `Classical.em` -- the paper acknowledges this only in the Lean comments (line 43-47 of TractatusOntology.lean), not in the paper text. Add a sentence.
- NAND completeness (Section 3.3): Correct and well-presented. The claim "NAND alone is functionally complete" follows from the code but is stated informally -- could be sharpened with a precise statement about what "functionally complete" means in this context.

### Section 4 (Model-Dependent Assumptions)

- The constrained-model counterexamples are the strongest part of this section. The abstract countermodel is clean; the weather model is vivid.
- The philosophical point -- that independence is a modeling choice, not a logical law -- is well-made and important. This is a genuine contribution to Tractatus scholarship.
- Missing: the paper does not mention Wittgenstein's own later retreat from independence (the color-exclusion problem, "Some Remarks on Logical Form" (1929)). This would strengthen the philosophical motivation.

### Section 5 (Formal Limits)

- Section 5.1 (expresses relation): The definition is clear. The type-level analysis of the object/meta boundary is the paper's most original philosophical contribution.
- Section 5.2 (expressibility collapse): The theorem and its proof are correct and match the Lean code. The contrapositive corollary is well-stated. The philosophical interpretation ("genuine content requires variation across possible worlds") is sound. However, see Critical Issue #2 regarding the triviality objection.
- Section 5.3 (equivalence hierarchy): The hierarchy is well-defined and the strict separation witnesses are correct. The interpretation of `formEq` as a formal candidate for Wittgenstein's "logical form" is interesting. The proof that renaming preserves tree structure (and hence `neg (neg (elementary s))` cannot be `formEq` to `elementary s`) is clean.
- Section 5.4 (first-order extension): As noted, this section is thin. The HOAS design is mentioned but its implications are not fully discussed.

### Section 6 (Related Work)

- Good coverage of Lokhorst, Weiss, Miller, Stokhof, Geach, and Soames. The positioning is accurate: prior work is on paper; no prior proof-assistant formalization of the Tractatus exists.
- The Benzmüller paragraph is adequate but could note the methodological difference more sharply: Benzmüller uses shallow semantic embeddings of modal logic, while this paper uses a direct encoding in dependent type theory.
- The Scherf citation is appropriate but its unpublished status should be noted.
- Missing: Fogelin, Carruthers (see Important Issues #8, #9).

### Section 7 (Discussion)

- Section 7.1 (What the Formalization Shows): The three insights are well-articulated. The claim about `expresses` making the object/meta boundary typed is the strongest contribution.
- Section 7.2 (Limitations): Honest and well-chosen. The four limitations (object structure, N-operator, picture theory, self-reference) are the right ones to flag.
- The discussion of `axiom silence : True` is philosophically interesting but could be expanded (see Suggestion #15).
- The paper does not discuss potential extensions or future work in a systematic way. A brief "Future Work" paragraph would be appropriate.

### Section 8 (Conclusion)

- Concise and appropriate. Restates the main contributions without over-claiming.

### Bibliography

- 11 entries. For RSL, this is on the lean side. The literature review identifies several additional works (Fogelin, Carruthers, Connelly 2023 on the N-operator) that would strengthen the bibliography.
- Formatting is inconsistent: some entries have DOIs, some have URLs, some have neither. RSL will require uniform formatting.
- The `scherf2025` entry cites "PhilPapers, 2025" which is not a venue. Clarify publication status.
- The `benzmuller2017` entry should verify it matches the work actually discussed (the 2017 *Journal of Applied Logic* paper vs. the 2013 Isabelle AFP entry vs. the 2014 ECAI paper -- these are distinct works with different results).
