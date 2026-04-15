# Tractatus

Machine-checked reconstruction of Wittgenstein's *Tractatus Logico-Philosophicus* in Lean 4, with an accompanying research paper.

## Structure

```
proofs/                  # Lean 4 source
  TractatusOntology.lean     # Core formalization (1,229 lines)
  TractatusQuantifiers.lean  # First-order extension (288 lines)
research/tractatus-ontology/paper/
  tractatus-ontology.{N}/    # Paper versions (immutable)
```

## Paper workflow

Uses the pub domain skills (`.claude/skills/pub/`, `.claude/commands/pub/`).
State machine: EMPTY → DRAFTED → REVIEWED → REVISED → ... → READY.
Convergence: review score ≥ 32/40, 0 critical issues.

## LaTeX build

```bash
cd research/tractatus-ontology/paper/tractatus-ontology.{N}/
mkdir -p .build
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
cp .build/paper.pdf paper.pdf
```

## Key results

- **Expressibility collapse**: nontrivial propositions cannot express world-independent truths (`saying_showing_triviality`)
- **Three-way decomposition**: invariants / assumptions / limits across all 46 theorems
- **Equivalence hierarchy**: structEq ⊊ formEq ⊊ semEq with strict separation witnesses
- **1 deliberate axiom** (`axiom silence : True`), **0 sorries**

## Target venue

*Review of Symbolic Logic* — formal philosophy + logic intersection.
