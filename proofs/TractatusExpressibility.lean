import TractatusCompleteness

/-
# Tractatus: what can be said, exactly (TLP 1, TLP 4.023, TLP 5)

The core development's collapse theorem (`saying_showing_triviality`)
says which meta-level contents a proposition CANNOT express: no
nontrivial proposition expresses a world-independent `P : Prop`. This
file states the positive complement and its sharp boundary.

Over a finite, decidable, nonempty atom type, a world-property
`P : World S → Prop` is expressible by some proposition IFF `P` is
invariant under pointwise-iff agreement of worlds
(`expressible_iff_iff_invariant`). Invariance is exactly
truth-functionality (TLP 5): a proposition sees a world only through the
truth-values of its elementaries, so any expressible property must
respect pointwise-iff agreement; conversely, over finitely many atoms
functional completeness (TLP 5.101) realizes every invariant property.

The finiteness hypothesis is essential. `Proposition.atoms` collects the
(finitely many) elementaries occurring in a proposition, and
`eval_depends_only_on_atoms` shows a proposition's truth-value depends
only on them — a finite-support property. Over an INFINITE atom type
this defeats the totality property `fun w => ∀ s, w s` — the paper's own
rendering of TLP 1, "the world is everything that is the case." That
property is invariant under pointwise-iff agreement, yet
`totality_not_expressible` shows no proposition expresses it: comparing
the all-true world with the world true exactly on a proposition's atoms
(they agree on those atoms, but an infinite type has an atom outside the
finite list) forces any candidate to disagree with totality.

Together these give the dichotomy: for finitely many atoms invariance
and expressibility coincide; for infinitely many atoms TLP 1 witnesses
the gap. This is a result about THIS object language over infinite
atoms — the totality of facts is sayable in the metalanguage that states
the theorem, not in the language whose propositions the theorem ranges
over.

## Attribution

The theorem statements in this file were authored by us. The proofs
were produced by Harmonic's Aristotle automated theorem prover
(https://aristotle.harmonic.fun), projects
`298662ff` (`expressible_iff_iff_invariant`) and
`57df7541` (`eval_depends_only_on_atoms`, `totality_not_expressible`),
2026-07-12, from the sorried statements; the statements are unchanged
from submission. The inlined support the Aristotle problem files carried
(the `Proposition`/`World`/`eval`/`evalBool` re-declarations,
`evalBool_correct`, truth-functional compositionality, and the DNF
construction culminating in `functional_completeness`) is de-duplicated
here against the built development in `TractatusOntology` and
`TractatusCompleteness`. All proofs were re-verified against this
repository's pinned toolchain. Axiom footprint: `propext`,
`Classical.choice`, `Quot.sound` only.
-/

namespace Tractatus

-- ═══════════════════════════════════════════════════════════════
-- SECTION 1: Exact characterization of the expressible (finite atoms)
-- ═══════════════════════════════════════════════════════════════

-- [MAIN RESULT] --------------------------------------------------
-- expressible_iff_iff_invariant
-- Over a finite, decidable, nonempty atom type, a world-property is
-- expressible by a proposition iff it is invariant under pointwise-iff
-- agreement of worlds. Forward: truth-functional compositionality.
-- Backward: functional completeness realizes every invariant property.
-- ----------------------------------------------------------------

/-- Exact characterization of the sayable (TLP 5, TLP 5.101). Over a
    finite, decidable, nonempty atom type `S`, a world-property
    `P : World S → Prop` is expressible by some proposition iff `P` is
    invariant under pointwise-iff agreement of worlds. -/
theorem expressible_iff_iff_invariant {S : Type} [Fintype S] [DecidableEq S]
    [Nonempty S] (P : World S → Prop) :
    (∃ p : Proposition S, ∀ w : World S, p.eval w ↔ P w) ↔
    (∀ w₁ w₂ : World S, (∀ s, w₁ s ↔ w₂ s) → (P w₁ ↔ P w₂)) := by
  constructor
  · grind +suggestions
  · intro h_invariant
    obtain ⟨p, hp⟩ : ∃ p : Proposition S,
        ∀ w : S → Bool, p.evalBool w = (P (fun s => w s = true)) := by
      convert functional_completeness (fun w => decide (P fun s => w s = true)) using 1
      grind
      exact fun w => Classical.propDecidable _
    use p
    intro w
    convert hp (fun s => decide (w s)) using 1
    grind
    convert Proposition.evalBool_correct p (fun s => decide (w s)) |> Iff.symm
    grind
    exact fun s => Classical.propDecidable _
    grind +suggestions

-- ═══════════════════════════════════════════════════════════════
-- SECTION 2: Finite support and the inexpressibility of totality
-- ═══════════════════════════════════════════════════════════════

/-- The (finitely many) atoms occurring in a proposition. -/
def Proposition.atoms {S : Type} : Proposition S → List S
  | .elementary s => [s]
  | .neg q        => q.atoms
  | .conj q r     => q.atoms ++ r.atoms

/-- Finite support: a proposition's truth-value depends only on its
    atoms. Worlds agreeing on `p.atoms` agree on `p`. -/
theorem eval_depends_only_on_atoms {S : Type} (p : Proposition S)
    (w₁ w₂ : World S) (h : ∀ s ∈ p.atoms, w₁ s ↔ w₂ s) :
    p.eval w₁ ↔ p.eval w₂ := by
  induction' p with s p₁ p₂ ih₁ ih₂
  · exact h s (by tauto)
  · exact not_iff_not.mpr (p₂ h)
  · simp_all +decide [Proposition.eval, Proposition.atoms]

-- [MAIN RESULT] --------------------------------------------------
-- totality_not_expressible (TLP 1, over infinite atoms)
-- "The world is everything that is the case" is invariant under
-- pointwise-iff agreement of worlds, yet no proposition expresses it:
-- finite support defeats the universal over an infinite atom type.
-- ----------------------------------------------------------------

/-- TLP 1 cannot be said: over an infinite atom type, no proposition
    expresses the totality property "everything is the case" — even
    though that property is invariant under pointwise-iff agreement of
    worlds. Over a FINITE atom type it would be expressible
    (`expressible_iff_iff_invariant`); the obstruction is finite
    support. -/
theorem totality_not_expressible {S : Type} [Infinite S] :
    ¬ ∃ p : Proposition S, ∀ w : World S, p.eval w ↔ (∀ s, w s) := by
  by_contra! h_contra
  obtain ⟨p, hp⟩ := h_contra
  have h_support : ∀ s, s ∈ p.atoms := by
    convert eval_depends_only_on_atoms p (fun _ => True) (fun s => s ∈ p.atoms) _ using 1
    all_goals aesop
  exact absurd (List.finite_toSet p.atoms) (Set.infinite_univ.mono fun x _ => h_support x)

end Tractatus
