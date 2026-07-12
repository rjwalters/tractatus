# Review: tractatus-ontology.4

**Reviewer:** Claude (automated paper review)
**Date:** 2026-07-12
**Paper reviewed:** `research/tractatus-ontology/paper/tractatus-ontology.4/paper.tex`
**Version history:** v1 (27/40) → v2 (37/40) → v3 (39/40, ACCEPT — later found unsound) → v4 (this review)

---

## Overall Assessment: STRONG (one must-fix)

**Score: 35/40**

| Dimension | Score | Key Issue |
|-----------|-------|-----------|
| Technical Soundness | 4/5 | Separation theorem stated more generally than the machine-checked witnesses support |
| Novelty & Contribution | 4/5 | Core collapse result remains definitional; incomparability strengthens but does not lift the ceiling |
| Experimental Rigor | 5/5 | Build verified locally (zero errors/warnings) and by green CI; all counts re-verified against source |
| Clarity & Writing | 4/5 | Stale intro footnote contradicts Appendix A; "hierarchy" naming survives the de-hierarchization |
| Related Work Coverage | 4/5 | Missing the Tarski permutation-invariance line, which is adjacent to formEq at this venue |
| Figures & Tables | 5/5 | Figure 2 now correct (overlapping regions, witnesses placed); 53-row table matches source exactly |
| Reproducibility | 5/5 | Pinned toolchain + lake-manifest + CI on every push; Appendix A steps succeed as written |
| Presentation & Structure | 4/5 | `\date{April 2026}` stale; section overview still says "equivalence hierarchy" |

### Context: why this review is stricter than v3's

The v3 review scored 39/40 with "Technical Soundness 5/5 — all claims match Lean code exactly" while the repo failed `lake build` instantly and the headline hierarchy theorem was false. This review was conducted with that failure mode in mind: the build was actually executed (local + CI), every listing was diffed against the ported source, and every theorem statement was checked against what the cited Lean names actually prove.

### Verification performed

- `lake build` on the shipped config (Lean v4.26.0, mathlib v4.26.0): **zero errors, zero warnings**, confirmed locally and by the repository's GitHub Actions run.
- Counts: 1,592 lines (1,308 + 284), 53 theorem/lemma declarations (44 + 9), 0 sorries, 1 axiom — all match the abstract, conclusion, and Appendices A–B. **Exception: the introduction's footnote (important issue 1).**
- All 15 Lean listings in the paper compared line-by-line against source: all match.
- The corrected Theorem 5.7 (Separation): parts verified against `structEq_implies_formEq`, `structEq_implies_semEq`, `formEq_not_semEq_witness`, `semEq_not_formEq_witness`, `formEq_semEq_not_structEq_witness` — the cited lemmas prove what the proof text says they prove **at the concrete type `TwoFacts`** (see critical issue 1).
- Web searches confirm no competing Tractatus formalization has appeared (novelty claim at line 1175 stands).

---

## Critical Issues (must fix)

1. **Separation theorem stated at a generality the Lean artifact does not check** (Dimension: 1)
   - Problem: Theorem 5.7 is stated "As relations on Proposition S (for S with at least two atoms)", but the machine-checked witnesses for parts (2) and (3) — `formEq_not_semEq_witness`, `semEq_not_formEq_witness` (in part), `formEq_semEq_not_structEq_witness` — are proved only at the concrete two-element type `TwoFacts`. Nothing in the development proves the incomparability for an arbitrary `S` with two distinct atoms. Remark 5.6 (rem:nonempty) half-acknowledges this ("witnesses ... name specific atoms of the concrete type TwoFacts"), but the theorem statement itself claims more than what is verified. In a paper whose thesis is that machine-checking keeps philosophical claims honest — and after v3's separation theorem was found false — the statement/artifact gap is the one thing this paper cannot afford.
   - Impact: A referee who opens the repository will observe that the theorem, as stated, is not among the 53 verified results; only its TwoFacts instance is.
   - Recommendation: Generalize the witnesses in Lean — this is genuinely easy. Parameterize by `(a b : S) (hab : a ≠ b)`: the swap permutation `Equiv.swap a b`, the witness world `fun s => s = a`, and `and_comm` all work verbatim at that generality; keep the `TwoFacts` versions as instantiations or drop them. Then the theorem as stated is exactly what is machine-checked. Alternative (weaker): scope the theorem statement to `TwoFacts` and add a remark that the constructions generalize — acceptable but second-best.

---

## Important Issues (should fix)

1. **Introduction footnote has pre-port counts, contradicting Appendix A** (Dimensions: 4, 8)
   - Problem: The footnote at lines 247–251 says "TractatusOntology.lean (1,229 lines, 41 theorem/lemma declarations) and TractatusQuantifiers.lean (288 lines, 9 theorem declarations)" — these are v3-era numbers. The abstract says 1,592/53 and Appendix A says 1,308/44 and 284/9. Internal inconsistency in the very numbers the paper stakes its rigor on.
   - Recommendation: Update the footnote to 1,308/44 and 284/9.

2. **Unformalized mathematical claim in Remark 5.8 (truth-table isomorphism)** (Dimension: 1)
   - Problem: The remark asserts "with classical choice, *any* two nontrivial propositions are related by some such f." This claim is true (choose `f w` to be a q-satisfying or q-refuting world according to `p.eval w`), but it is neither proved in the paper nor formalized in Lean — an unverified claim in the one paper that advertises full verification.
   - Recommendation: Formalize it (a short lemma, e.g. `truth_table_iso_of_nontrivial`, ~10 lines with `Classical.choice`) and cite the Lean name; or weaken the prose to "one can show" with a footnote sketching the choice construction.

3. **"Hierarchy" vocabulary survives the de-hierarchization** (Dimensions: 4, 8)
   - Problem: The paper now proves the three relations do *not* form a hierarchy, yet: §5.3 is still titled "The Equivalence Hierarchy" (line 904); the section overview (line 265) says "the expressibility results and the equivalence hierarchy"; the intro decomposition item (iii) (line 213) says "strict separation of syntactic, logical-form, and semantic equivalence" (fine) but Appendix B's legend says "H = hierarchy helper" and the `rename`/`formEq` helper rows carry that class. Residual naming invites the very misreading v4 fixed.
   - Recommendation: Retitle §5.3 "Three Equivalence Relations" (matching Definition 5.5's new name), update line 265, and rename the legend class to "helper (equivalence relations)" or simply "helper." The internal LaTeX labels (`sec:hierarchy`, `thm:hierarchy`) can stay.

4. **Stale date** (Dimension: 8)
   - Problem: `\date{April 2026}` (line 84) predates this revision.
   - Recommendation: Update to July 2026 (or `\date{\today}` policy).

5. **`TractObject` still described as modeled without noting its inertness** (Dimension: 4)
   - Problem: §2.1 says "We model them as an abstract type TractObject with no internal structure" — accurate, but the paper never says that `TractObject` plays no role in any subsequent definition (the development begins at Sachverhalte). The Lean source now carries an honest design note; the paper should match it, since a source-reading referee will notice the dead variable.
   - Recommendation: One sentence in §2.1: "TractObject is declared for conceptual completeness but plays no role in later definitions; the formal development begins at the level of states of affairs (see §7.2, Object structure)."

---

## Suggestions (nice to have)

1. **CUP document class** (carried over from v2/v3): still `article`; the header comment defers to camera-ready. Unchanged advice: confirm with the RSL editorial office that article-class submissions are acceptable for review.
2. **Mention the follow-on world-model work as future work.** The companion development (generic Horn-clause models, biconditional models, a refinement preorder on `WorldModel` with the free model as maximum) directly extends §4 and §7.4's second item and would strengthen the novelty story in a future version.
3. Consider `actions/checkout@v5` in CI to silence the Node-20 deprecation annotation (repository hygiene, not paper content).

---

## Missing Related Work

- **Tarski, "What Are Logical Notions?" (1966 lecture; ed. Corcoran, *History and Philosophy of Logic* 7:143–154, 1986)**
  - Relevance: The paper's `formEq` — invariance of logical form under atom permutation — is a proposition-level cousin of Tarski's permutation-invariance criterion for logicality (and the ensuing Tarski–Sher thesis literature: Sher 1991, Bonnay 2008, Dutilh Novaes 2014). RSL is precisely the venue where a referee will ask how permutation-based "form" relates to permutation-based "logicality."
  - Recommendation: Cite and add 2–4 sentences in §5.3 or Related Work distinguishing the two: Tarski permutes the *domain of individuals* to characterize logical *notions*; formEq permutes *atoms* to characterize shared *form* between propositions. The incomparability result then says something Tarskian invariance does not: form-invariance and truth-conditional identity cut across each other.
- **"Logical form and logical space in Wittgenstein's Tractatus," *Synthese* 200:106 (2022)**
  - Relevance: Recent, directly on the paper's central exegetical target (TLP logical form); the related-work paragraph on formal reconstructions cites nothing after 2017 on this specific notion.
  - Recommendation: Cite in §5.3's closing paragraph or Related Work; verify bibliographic details against the publisher page before adding.

---

## Next Step

Run `/pub-revise tractatus-ontology.4` to create version 5 incorporating this review. The critical issue requires a small Lean change (generalize the three separation witnesses to arbitrary `a ≠ b`), a rebuild, and a re-sync of the paper's listings and counts.
