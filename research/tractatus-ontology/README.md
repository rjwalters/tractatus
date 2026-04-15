# tractatus-ontology

**Title:** What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*

**Status:** DRAFTED (v1)

**Target venue:** *Review of Symbolic Logic*

## Thread

Machine-checked reconstruction of the semantic core of *Tractatus Logico-Philosophicus* in Lean 4. The formalization decomposes the Tractatus into structural invariants, model-dependent assumptions, and formal limits of expressibility. The headline result: nontrivial propositions cannot express world-independent truths (the saying/showing distinction as a theorem).

## Artifacts

- `paper/tractatus-ontology.1/paper.tex` — first draft (9 pages)
- `../../proofs/TractatusOntology.lean` — core formalization (1,229 lines, 37 theorems)
- `../../proofs/TractatusQuantifiers.lean` — first-order extension (288 lines, 9 theorems)
