# Tractatus

Machine-checked reconstruction of Wittgenstein's *Tractatus Logico-Philosophicus* in Lean 4, with an accompanying research paper.

## Structure

```
proofs/                  # Lean 4 source
  TractatusOntology.lean     # Core formalization (1,345 lines, 45 declarations)
  TractatusQuantifiers.lean  # First-order extension (284 lines, 9 declarations)
  TractatusNOperator.lean    # N-operator, TLP 5.52 both directions + N-generation completeness toward TLP 6 (239 lines, 11; proofs by Harmonic Aristotle)
  TractatusCompleteness.lean # Full functional completeness, TLP 5.101 (142 lines, 9; proofs by Harmonic Aristotle)
  TractatusExpressibility.lean # Exact expressibility characterization + inexpressibility of totality, TLP 1/5 (138 lines, 3; proofs by Harmonic Aristotle)
  TractatusDecidability.lean # Decidability of semEq/formEq over finite atoms, TLP 4.0141 (148 lines, 3; proofs by Harmonic Aristotle)
  TractatusOntologyHorn.lean # Generic HornModel constructor + exact independence boundary horn_realizable_iff, TLP 2.061 (174 lines, 8; ported from lean-genius, horn_realizable_iff proof by Harmonic Aristotle)
  TractatusOntologySpectrum.lean # Refinement preorder on WorldModel, freeModel as maximum + uniqueness, oq-06 (472 lines, 37; ported from lean-genius)
  TractatusOntologyEquiv.lean # EquivModel via symmetric Horn closure (T1b ⊆ T1a-symmetric) (145 lines, 6; ported from lean-genius)
research/tractatus-ontology/paper/
  tractatus-ontology.{N}/    # Paper versions (immutable)
```

Proofs were originally developed in `../lean-genius` (`proofs/Proofs/Tractatus*.lean`), the source of truth. The Horn/Equiv/Spectrum world-model files are now ported into this repo's `proofs/` (Lean-only integration; not yet in the paper — reserved for a follow-up model-theory paper).

## Lean build

Toolchain `leanprover/lean4:v4.26.0`, mathlib `v4.26.0` (pinned in `lean-toolchain` / `lakefile.lean`).

```bash
lake update && lake exe cache get && lake build
```

Expected: zero errors, zero warnings (nine `#eval` info lines are intentional demos: five from `TractatusOntology`, four from `TractatusDecidability`). CI runs `lake build` on every push (`.github/workflows/ci.yml`). Note: v4.17-era Lean binaries do not run on current macOS; if `lake` resolves to the lean-genius wrapper, use `~/.elan/toolchains/leanprover--lean4---v4.26.0/bin/lake`.

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
- **Three-way decomposition**: invariants / assumptions / limits across all 131 results
- **Equivalence separation**: `structEq` strictly refines both `formEq` and `semEq`; `formEq` and `semEq` are provably **incomparable** (they do NOT form a chain), and `structEq ⊊ formEq ∩ semEq` — witnesses hold for arbitrary `S` with two distinct atoms
- **Decidability of separation**: over finite atoms both `semEq` and `formEq` are decidable (`decideSemEq`, `decideFormEq`), via the any-atom-type bridge `semEq_iff_evalBool`; the Theorem 5.7 witnesses are checkable by `#eval` at `TwoFacts`. Proofs by Harmonic's Aristotle from our statements.
- **N-operator settled both ways**: TLP 5.52 proved for finite domains; Geach–Soames critique is a theorem (`no_finite_NOp_for_forall`); full functional completeness (`functional_completeness`, needs `Nonempty S`). N-generation completeness toward TLP 6 (`nGen_complete`): every propositional-fragment proposition is semantically equivalent to one built from the elementaries by iterated N-application. Proofs by Harmonic's Aristotle from our statements (see file headers + paper Acknowledgments).
- **Exact expressibility + inexpressibility of totality**: over finite atoms a world-property is expressible iff invariant under pointwise-iff agreement (`expressible_iff_iff_invariant`, needs `Nonempty S`); over infinite atoms the TLP 1 totality property `fun w => ∀ s, w s` is invariant yet expressed by no proposition (`totality_not_expressible`), via finite support (`eval_depends_only_on_atoms`). Proofs by Harmonic's Aristotle from our statements.
- **Constrained world-model spectrum (TLP 2.061; oq-06)**: generic `HornModel S cs` constructor with the exact independence boundary `horn_realizable_iff` — every truth-value assignment is realizable iff every Horn clause is trivial (`horn_realizable_iff` proof by Harmonic's Aristotle from our statement); a refinement preorder on `WorldModel S` with `freeModel S` as its maximum and unique up to refinement-iso among models with independent profiles (`freeModel_unique_refines_iso`); the biconditional tier `EquivModel` shown to be the symmetric-closure subclass of the Horn tier (`equivModel_iso_hornModel_symm`). Ported from lean-genius; reserved for a follow-up model-theory paper (not in the RSL paper).
- **1 deliberate axiom** (`axiom silence : True`), **0 sorries**

## Target venue

*Review of Symbolic Logic* — formal philosophy + logic intersection.

<!-- BEGIN LOOM ORCHESTRATION -->
This repository uses [Loom](https://github.com/rjwalters/loom) for AI-powered development orchestration. See `.loom/CLAUDE.md` for the full guide (roles, labels, worktrees, configuration).
<!-- END LOOM ORCHESTRATION -->