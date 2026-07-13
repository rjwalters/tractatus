# Aristotle batch 2 — verified results, staged for integration

Five problem files submitted to Harmonic's Aristotle prover on
2026-07-12 (statements authored by us and hand-verified before
submission; all proofs returned within ~24 minutes). **Staged here,
deliberately outside the lake build**: the built development and the
paper (v7) do not yet include these results. Integration is tracked in
the repository issues.

## Verification status (all five)

- Statements character-identical to what we submitted (only proofs and
  disclosed supporting lemmas added).
- Re-verified against the pinned toolchain (`leanprover/lean4:v4.26.0`,
  mathlib v4.26.0): zero errors, zero warnings, zero sorries.
  (`sorry` appearing in these files is in documentation comments only.)
- Axiom footprint: `propext`, `Classical.choice`, `Quot.sound`.

## Contents

| File | Aristotle project | Result |
|---|---|---|
| `TractatusExpressibilityAristotle.lean` | `298662ff-c6b5-44bf-94f3-cd9f28eae1cd` | `expressible_iff_iff_invariant`: over finite, decidable, nonempty atoms, `P : World S → Prop` is expressible iff invariant under pointwise-iff agreement of worlds |
| `TractatusTotalityAristotle.lean` | `57df7541-8676-43af-8353-2052e589a822` | `eval_depends_only_on_atoms` (finite support) and `totality_not_expressible`: over infinite atoms, TLP 1's "everything is the case" is invariant yet expressible by no proposition |
| `TractatusNGenerationAristotle.lean` | `5d77873e-c1ae-4b54-906a-44a23d8b108e` | `nGen_complete` (+ semEq congruences): every proposition is semantically equivalent to one generated from elementaries by iterated N-application (TLP 6, propositional fragment) |
| `TractatusDecidabilityAristotle.lean` | `e203a760-90f0-42a9-a6c1-3e77d147fa9f` | `semEq_iff_evalBool` (any atom type, classical) + `decideSemEq` / `decideFormEq` (finite atoms) |
| `TractatusHornAristotle.lean` | `1efa3c7d-c807-4d00-b320-049ea0583d24` | `horn_realizable_iff`: Horn-model realizability iff every clause is trivial (exact TLP 2.061 boundary) |

`SUMMARY-*.md` are Aristotle's own run summaries.

Note: the expressibility and totality results together give a
dichotomy: over finite atom spaces, invariance under worldly
indiscernibility coincides with expressibility; over infinite ones it
does not — the totality property witnesses the gap.
