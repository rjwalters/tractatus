# Tractatus

Machine-checked reconstruction of Wittgenstein's *Tractatus Logico-Philosophicus* in Lean 4, with an accompanying research paper.

## Structure

```
proofs/                  # Lean 4 source
  TractatusOntology.lean     # Core formalization (1,345 lines, 45 declarations)
  TractatusQuantifiers.lean  # First-order extension (284 lines, 9 declarations)
  TractatusNOperator.lean    # N-operator, TLP 5.52 both directions (162 lines, 8; proofs by Harmonic Aristotle)
  TractatusCompleteness.lean # Full functional completeness, TLP 5.101 (142 lines, 9; proofs by Harmonic Aristotle)
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
Current: v7 (REVISED — integrates the Aristotle-proved N-operator + functional-completeness results; needs a fresh pub-review pass). Remaining before submission: review pass, CUP class conversion. Historical note: the v3 ACCEPT missed that the repo didn't build and that the old hierarchy theorem was false; verify artifact claims by running them.

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
- **Three-way decomposition**: invariants / assumptions / limits across all 71 results
- **Equivalence separation**: `structEq` strictly refines both `formEq` and `semEq`; `formEq` and `semEq` are provably **incomparable** (they do NOT form a chain), and `structEq ⊊ formEq ∩ semEq` — witnesses hold for arbitrary `S` with two distinct atoms
- **N-operator settled both ways**: TLP 5.52 proved for finite domains; Geach–Soames critique is a theorem (`no_finite_NOp_for_forall`); full functional completeness (`functional_completeness`, needs `Nonempty S`). Proofs by Harmonic's Aristotle from our statements (see file headers + paper Acknowledgments).
- **1 deliberate axiom** (`axiom silence : True`), **0 sorries**

## Target venue

*Review of Symbolic Logic* — formal philosophy + logic intersection.

<!-- BEGIN LOOM ORCHESTRATION -->
This repository uses [Loom](https://github.com/rjwalters/loom) for AI-powered development orchestration. See `.loom/CLAUDE.md` for the full guide (roles, labels, worktrees, configuration).
<!-- END LOOM ORCHESTRATION -->