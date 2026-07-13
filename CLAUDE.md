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
  TractatusOntologyHorn.lean # Generic HornModel constructor + exact independence boundary horn_realizable_iff + per-valuation boundary horn_valuation_realizable_iff, TLP 2.061 (212 lines, 9; ported from lean-genius, horn_realizable_iff proof by Harmonic Aristotle, horn_valuation_realizable_iff by Claude for issue #5)
  TractatusOntologySpectrum.lean # Refinement preorder on WorldModel, freeModel as maximum + uniqueness, oq-06 (472 lines, 37; ported from lean-genius)
  TractatusOntologyEquiv.lean # EquivModel via symmetric Horn closure (T1b ⊆ T1a-symmetric) (145 lines, 6; ported from lean-genius)
  TractatusOntologyExclusion.lean # Exclusion tier: exclusion_realizable_iff + exclusion_not_horn, color exclusion TLP 6.3751 (236 lines, 12; new for the follow-up paper)
research/tractatus-world-models/paper/
  tractatus-world-models.{N}/ # Follow-up paper versions (immutable): Independence as a Modeling Choice, target Synthese (issue #5)
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
Current: v10 (REVISED — needs a review pass). v10 is the RSL/CUP camera-ready lineage (ASL class, black-only, 3-pass build, PDF committed): v8 (READY, article class) → v9 (issue #14, ASL/CUP class conversion) → v10 (issue #23, pre-submission fixes). v10 engages Rogers & Wehmeier (RSL 2012) and Wehmeier (NDJFL 2004) on Tractarian first-order logic / the N-operator in Related Work and §5.5, compresses the abstract (~380→~290 words, all headline claims retained), tightens the conclusion's result-by-result re-narration, and corrects the literature.md Gap Analysis item on the equivalence separation (incomparability, not a chain). Still 80 results / 2,296 lines / six files (prose/bibliography only — no Lean changes). Build re-verified from scratch: 25-page 3-pass pdflatex, zero errors, zero overfull hboxes, zero undefined refs/cites. Remaining before submission: review pass on v10, then the title decision (see PR #? for candidates). Historical note: the v3 ACCEPT missed that the repo didn't build and that the old hierarchy theorem was false; verify artifact claims by running them.

## LaTeX build

Versions up to v8 use the generic `article` class and build with two
`pdflatex` passes:

```bash
cd research/tractatus-ontology/paper/tractatus-ontology.{N}/   # N <= 8
mkdir -p .build
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
cp .build/paper.pdf paper.pdf
```

**v9 onward** is the RSL/CUP camera-ready conversion (issue #14). It uses
the ASL author document class `asl.cls` (with `asl.bst`, `bussproofs.sty`),
which is vendored in the version directory because it is not on CTAN — the
class ships in the ASL Author Resources bundle
(<https://aslonline.org/journals/author-resources/>). It needs **three**
`pdflatex` passes (for `lastpage`/refs to converge) and the vendored class
files must be visible to `pdflatex` (run from inside the version directory,
or copy `asl.cls asl.bst bussproofs.sty` into `.build/`):

```bash
cd research/tractatus-ontology/paper/tractatus-ontology.9/
mkdir -p .build
for i in 1 2 3; do
  pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
done
cp .build/paper.pdf paper.pdf
```

Expected: zero errors, zero overfull hboxes, zero undefined refs/cites,
no colour (ASL/RSL is printed black-only). The RSL production class
`rsl.cls` (also in the bundle) is typesetter-only — it `\input`s
CUP-internal files not distributed to authors — so it cannot be used at
author-submission stage; `asl.cls[jsl]` with a masthead-name override is
the author-facing class.

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

<!-- BEGIN ANVIL -->
This repository uses [Anvil](https://github.com/rjwalters/anvil) for AI-powered artifact creation. See `.anvil/CLAUDE.md` for the full guide (skills, rubric, state machine). To upgrade Anvil, re-run `install-anvil.sh .` from the anvil checkout without `--skills=` to pick up newly-shipped skills; pass `--skills=...` only to install a strict subset.
<!-- END ANVIL -->
