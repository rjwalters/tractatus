# AI-Use Disclosure — RSL submission (tractatus-ontology, v11)

**Paper:** *What Lean Cannot Say* (working title; see PR #30 for the title decision) — a machine-checked reconstruction of Wittgenstein's *Tractatus Logico-Philosophicus*.
**Target venue:** *Review of Symbolic Logic* (Cambridge University Press).
**Artifact:** <https://github.com/rjwalters/tractatus>, pinned at commit `34db8e19d05dde28d1130a0e061a61bf1020f930` (short `34db8e1`); at that commit `lake build` is warning-free under Lean 4.26.0 with no `sorry`s.

This is a standalone operator-review document. At upload time the "published record" paragraph below folds into the paper's `\section*{Acknowledgments}` and the "cover letter" paragraph goes into the submission system / cover letter.

---

## 1. For the published record (Acknowledgments — drop-in text)

> **Acknowledgments.** The proofs in `TractatusNOperator.lean`, `TractatusCompleteness.lean`, `TractatusExpressibility.lean`, and `TractatusDecidability.lean` were produced by Harmonic's Aristotle automated theorem prover from theorem statements authored by us (submitted with `sorry` placeholders; statements unchanged), and were re-verified by the Lean kernel against the repository's pinned toolchain. Their axiom footprint is `propext`, `Classical.choice`, `Quot.sound` only. The remaining declarations — the core ontology (`TractatusOntology.lean`) and the first-order extension (`TractatusQuantifiers.lean`), including all definitions, theorem statements, and the supporting evaluation and compositionality lemmas the Aristotle problem files reused — are human-authored. For `TractatusExpressibility.lean` and `TractatusDecidability.lean` the support the Aristotle problem files inlined (re-declared syntax and semantics, the Bool-valued evaluator, truth-functional compositionality, and the disjunctive-normal-form construction) is de-duplicated against the built development; only the headline statements — `expressible_iff_iff_invariant`, `eval_depends_only_on_atoms`, `totality_not_expressible`, `semEq_iff_evalBool`, `decideSemEq`, `decideFormEq` — together with a derived `DecidableEq` instance and their finite-support scaffolding remain. Every proof, whatever its origin, is checked by the Lean 4 kernel; regardless of how a proof was found, its validity rests on that check and on the stated axiom footprint. The sole axiom of the development is the deliberate `axiom silence : True` (TLP 7), a design boundary discussed in §6, not a missing proof.
>
> Manuscript preparation — drafting, revision, literature search, and the paper's internal review cycles — was carried out with Claude (Anthropic) under the direction of the human author. All citations were resolver-verified (Crossref/DOI), and every quantitative claim in the paper (declaration counts, line counts, axiom footprint, the three-way decomposition tallies) was checked against the machine-checked artifact at the pinned commit. The human author takes full responsibility for all claims in this paper.

## 2. For the cover letter / submission system (drop-in paragraph)

> **Disclosure of AI use.** In accordance with the journal's AI policy, we declare the following. The formal artifact accompanying this paper is a Lean 4 development (<https://github.com/rjwalters/tractatus>, commit `34db8e1`); every theorem in it is checked by the Lean 4 kernel with axiom footprint `propext`, `Classical.choice`, `Quot.sound` and the single deliberate axiom `silence : True`, with no `sorry`s. A subset of the proofs (the N-operator, functional-completeness, expressibility, and decidability modules) was produced by Harmonic's Aristotle automated theorem prover from theorem statements we authored; the core ontology and first-order modules are human-authored. Because every proof is kernel-checked, the origin of a proof does not affect its correctness. Manuscript drafting, revision, literature search, and internal review used Claude (Anthropic) under the direction of the human author; all citations were resolver-verified and all quantitative claims were checked against the artifact. No AI system is an author of this work, and the human author takes full responsibility for all claims herein.

## 3. Provenance table (file-level)

Modules formalized/cited in this paper (the six-module RSL lineage; declaration and line counts as reported in the paper's build appendix):

| File | Decls | Statements by | Proofs by | Verification (kernel + axiom footprint) |
|---|---|---|---|---|
| `TractatusOntology.lean` | 45 (1,345 ln) | Human author | Human author | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` + deliberate `axiom silence : True` (TLP 7) |
| `TractatusQuantifiers.lean` | 9 (284 ln) | Human author | Human author | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusNOperator.lean` | 11 (239 ln) | Human author | Aristotle (Harmonic) — projects `c15df233`, `5d77873e` (batch-2), from sorried statements, unchanged | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusCompleteness.lean` | 9 (142 ln) | Human author | Aristotle (Harmonic) — project `212b28eb`, from sorried statement, unchanged | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusExpressibility.lean` | 3 (138 ln) | Human author | Aristotle (Harmonic) — projects `298662ff`, `57df7541`, from sorried statements, unchanged | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |
| `TractatusDecidability.lean` | 3 (148 ln) | Human author | Aristotle (Harmonic) — project `e203a760`, from sorried statements, unchanged | Lean 4 kernel; footprint `propext`, `Classical.choice`, `Quot.sound` |

Notes. "Statements by" records who authored the theorem statement (the mathematical content submitted with `sorry`); "Proofs by" records who discharged the `sorry`. In every Aristotle case the statement is unchanged from submission and the proof was re-verified against the pinned toolchain. The one axiom in the entire development is `axiom silence : True` (in `TractatusOntology.lean`), a deliberate TLP 7 design boundary, not a gap.

## 4. Policy fit

- **Cambridge / RSL — "AI use must be declared and clearly explained in the published record; AI cannot be an author; authors are accountable."**
  Item 1 places the full declaration in the Acknowledgments (the published record), explaining both proof provenance and manuscript-preparation use; item 2 restates it for the editor. No AI is listed as an author, and both paragraphs state that the human author takes full responsibility for all claims.
