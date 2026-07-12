# Tractatus

Machine-checked reconstruction of Wittgenstein's *Tractatus Logico-Philosophicus* in Lean 4, with an accompanying research paper.

## Structure

```
proofs/                  # Lean 4 source
  TractatusOntology.lean     # Core formalization (1,345 lines, 45 declarations)
  TractatusQuantifiers.lean  # First-order extension (284 lines, 9 declarations)
research/tractatus-ontology/paper/
  tractatus-ontology.{N}/    # Paper versions (immutable)
```

Proofs were originally developed in `../lean-genius` (`proofs/Proofs/Tractatus*.lean`), which also holds follow-on work (Horn/Equiv/Spectrum world-model files) not yet in the paper.

## Lean build

Toolchain `leanprover/lean4:v4.26.0`, mathlib `v4.26.0` (pinned in `lean-toolchain` / `lakefile.lean`).

```bash
lake update && lake exe cache get && lake build
```

Expected: zero errors, zero warnings (five `#eval` info lines are intentional demos). CI runs `lake build` on every push (`.github/workflows/ci.yml`). Note: v4.17-era Lean binaries do not run on current macOS; if `lake` resolves to the lean-genius wrapper, use `~/.elan/toolchains/leanprover--lean4---v4.26.0/bin/lake`.

## Paper workflow

Uses the pub domain skills (`.claude/skills/pub/`, `.claude/commands/pub/`).
State machine: EMPTY → DRAFTED → REVIEWED → REVISED → ... → READY.
Convergence: review score ≥ 32/40, 0 critical issues.
Current: v5 (REVISED, from the v4 review at 35/40) — needs a fresh pub-review pass. The v3 ACCEPT missed that the repo didn't build and that the old hierarchy theorem was false; verify artifact claims by running them.

## LaTeX build

```bash
cd research/tractatus-ontology/paper/tractatus-ontology.{N}/
mkdir -p .build
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
cp .build/paper.pdf paper.pdf
```

## Key results

- **Expressibility collapse**: nontrivial propositions cannot express world-independent truths (`saying_showing_triviality`; no `Nonempty S` needed)
- **Three-way decomposition**: invariants / assumptions / limits across all 54 results
- **Equivalence separation**: `structEq` strictly refines both `formEq` and `semEq`; `formEq` and `semEq` are provably **incomparable** (they do NOT form a chain), and `structEq ⊊ formEq ∩ semEq` — witnesses hold for arbitrary `S` with two distinct atoms
- **1 deliberate axiom** (`axiom silence : True`), **0 sorries**

## Target venue

*Review of Symbolic Logic* — formal philosophy + logic intersection.
