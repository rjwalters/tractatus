# AI-Use Disclosure — Synthese submission (tractatus-world-models, v4)

**Paper:** *Independence as a Modeling Choice* — the constrained world-model spectrum for the *Tractatus* (Horn / equivalence / exclusion tiers, color exclusion TLP 6.3751).
**Target venue:** *Synthese* (Springer).
**Artifact:** <https://github.com/rjwalters/tractatus>, pinned at commit `34db8e19d05dde28d1130a0e061a61bf1020f930` (short `34db8e1`); at that commit `lake build` is warning-free under Lean 4.26.0 with no `sorry`s. (The v4 manuscript currently pins the earlier commit `0852c5b`; update the pin to the submission commit at upload time.)

This is a standalone operator-review document. At upload time the "published record" paragraph below folds into the paper's `\subsubsection*{Acknowledgments}` (complementing the existing §7.5 "What the kernel settles" methodological disclosure), and the "cover letter" paragraph goes into the Springer submission system's AI-declaration field and the cover letter.

---

## 1. For the published record (Acknowledgments — drop-in text)

> **Acknowledgments.** The base formalization of worlds, propositions, and evaluation, together with the spectrum, Horn-tier, and equivalence-tier modules, was developed in the companion project (`TractatusOntologySpectrum.lean`, `TractatusOntologyHorn.lean`, `TractatusOntologyEquiv.lean`); those modules were ported unchanged from that project's source of truth, and several of their theorems — including the exact Horn independence boundary `horn_realizable_iff` — were proved by Harmonic's Aristotle automated theorem prover from statements we authored, as acknowledged in the companion paper. The exclusion-tier module `TractatusOntologyExclusion.lean` (all statements and proofs, including the headline `exclusion_not_horn`) and the per-valuation Horn realizability lemma `horn_valuation_realizable_iff` were developed with Claude (Anthropic) in the course of preparing this paper. The remaining ported statements and the spectrum's own proofs (`freeModel_unique_refines_iso` and the refinement-preorder lemmas) are human-authored. Every proof, whatever its origin, is checked by the Lean 4 kernel; the correctness of a result does not depend on how it was found. The axiom footprint of every theorem cited here is `propext`, `Classical.choice`, `Quot.sound` only, with no `sorry`s.
>
> Manuscript preparation — drafting, revision, literature search, and the paper's internal review cycles — was carried out with Claude (Anthropic) under the direction of the human author. All citations were resolver-verified (Crossref/DOI), and every quantitative claim in the paper (declaration counts, line counts, axiom footprint) was checked against the machine-checked artifact at the pinned commit. The human author takes full responsibility for all claims in this paper.

## 2. For the cover letter / submission system (drop-in paragraph)

> **Disclosure of AI use.** In accordance with Springer's AI policy, we document the following. The formal artifact accompanying this paper is a Lean 4 development (<https://github.com/rjwalters/tractatus>, commit `34db8e1`); every theorem in it is checked by the Lean 4 kernel with axiom footprint `propext`, `Classical.choice`, `Quot.sound` and no `sorry`s. The exclusion-tier module and the per-valuation Horn lemma (statements and proofs) were developed with Claude (Anthropic); the ported spectrum/Horn/equivalence modules originate in the companion project, where several theorems were proved by Harmonic's Aristotle prover from statements we authored, and the remainder are human-authored. Because every proof is kernel-checked, the origin of a proof does not affect its correctness. Manuscript drafting, revision, literature search, and internal review used Claude (Anthropic) under the direction of the human author; all citations were resolver-verified and all quantitative claims were checked against the artifact. AI-assisted copy editing aside, this documents the substantive AI use. No AI system is an author of this work, and the human author takes full responsibility for all claims herein.

## 3. Provenance table (file-level)

Modules formalized/cited in this paper (the four constrained-model modules; 64 declarations, 1,064 lines total as reported in the manuscript):

| File | Decls | Statements by | Proofs by | Verification (kernel + axiom footprint) |
|---|---|---|---|---|
| `TractatusOntologySpectrum.lean` | 37 (472 ln) | Human author (ported, companion project) | Human author (ported, companion project) | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusOntologyHorn.lean` | 9 (212 ln) | Human author; `horn_realizable_iff` by us, `horn_valuation_realizable_iff` by Claude | `horn_realizable_iff` by Aristotle (Harmonic, project `1efa3c7d`); `horn_valuation_realizable_iff` by Claude; rest ported | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusOntologyEquiv.lean` | 6 (145 ln) | Human author (ported, companion project) | Human author (ported, companion project) | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusOntologyExclusion.lean` | 12 (235 ln) | Claude (Anthropic) — new tier for this paper | Claude (Anthropic) — new tier for this paper | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |

Notes. "Statements by" records who authored the theorem statement; "Proofs by" records who discharged it. Aristotle proofs (in the Horn module and the companion project) were produced from statements we authored, submitted with `sorry`, unchanged from submission, and re-verified against the pinned toolchain. The exclusion tier is entirely new for this paper (nothing ported, nothing Aristotle-proved). None of these modules introduces an axiom of its own; the only axiom in the wider repository is the companion paper's deliberate `axiom silence : True` (TLP 7), which none of these four modules invokes.

## 4. Policy fit

- **Springer / Synthese — "LLM use must be documented in the manuscript; AI-assisted copy editing is exempt from disclosure; no AI authors."**
  Item 1 documents both proof provenance and manuscript-preparation LLM use in the Acknowledgments, complementing the existing §7.5 methodological disclosure ("What the kernel settles"), so the LLM use is documented in the manuscript itself; item 2 restates it for the editor and the submission system's declaration field. No AI is listed as an author, and both paragraphs state that the human author takes full responsibility for all claims.
