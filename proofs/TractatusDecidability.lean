import TractatusOntology

/-
# Tractatus: deciding semantic and formal equivalence (TLP 4.0141, 5.7)

The core development (`TractatusOntology`) distinguishes semantic
equivalence `semEq` (agreement of truth value in every `Prop`-valued
world) from logical-form equivalence `formEq` (agreement up to an atom
permutation), and proves them separated: `structEq ⊊ formEq ∩ semEq`,
with `formEq` and `semEq` incomparable (Theorem 5.7 of the paper).

This file adds the complementary *effective* content: both relations
are not merely separated but **decidable** over finite atom types. The
bridge is `semEq_iff_evalBool`, which reduces semantic equivalence over
`Prop`-valued worlds to agreement of the computable `Bool`-valued
evaluators on all `Bool` assignments. That equivalence holds for an
ARBITRARY atom type `S` (classically); finiteness of `S` is used only
afterward, to make the resulting quantifier over `S → Bool` a decidable
`Fintype` search. Logical-form equivalence is likewise decidable: there
are finitely many permutations of a finite atom type, and `Proposition S`
has decidable equality whenever `S` does.

Consequently the separation witnesses of Theorem 5.7 at the running
`TwoFacts` example are checkable by pure computation (the `#eval` demos
below), mirroring the existing `evalBool` demonstrations in
`TractatusOntology`.

## Attribution

The theorem statements in this file were authored by us. The proof of
`semEq_iff_evalBool` and the decision procedures `decideSemEq` /
`decideFormEq` were produced by Harmonic's Aristotle automated theorem
prover (https://aristotle.harmonic.fun), project
`e203a760`, 2026-07-12, from the sorried statements; the statements are
unchanged from submission. All proofs were re-verified against this
repository's pinned toolchain. Axiom footprint: `propext`,
`Classical.choice`, `Quot.sound` only.

The supporting building blocks — `Proposition`, `eval`, `evalBool`,
`evalBool_correct`, `truth_functional_compositionality`, `rename`,
`semEq`, `formEq` — already live in `TractatusOntology`; this file
reuses them rather than reproducing them.
-/

namespace Tractatus

-- ═══════════════════════════════════════════════════════════════
-- Decidable equality of propositions
-- ═══════════════════════════════════════════════════════════════

-- Decidable equality on `Proposition S`, derived from decidable
-- equality on the atom type `S`. This instance is added here rather
-- than on the `Proposition` inductive in `TractatusOntology` so the
-- core file's declarations are left untouched; it is the only
-- ingredient (beyond finiteness) needed to make `formEq` decidable.
deriving instance DecidableEq for Proposition

namespace Proposition

-- ═══════════════════════════════════════════════════════════════
-- The Prop/Bool bridge (any atom type, classical)
-- ═══════════════════════════════════════════════════════════════

/-- Semantic equivalence over `Prop`-valued worlds coincides with
    agreement of the `Bool`-valued evaluators on all `Bool` assignments.

    This holds for an ARBITRARY atom type `S` (classically); no
    finiteness is required. Finiteness enters only in `decideSemEq`,
    where it turns the right-hand quantifier over `S → Bool` into a
    decidable `Fintype` search. Forward: instantiate the world at
    `fun s => v s = true` and transfer along `evalBool_correct`.
    Backward: for a `Prop`-valued world `w`, classically pick the
    `Bool` assignment `fun s => decide (w s)` and transfer along
    `truth_functional_compositionality` and `evalBool_correct`. -/
theorem semEq_iff_evalBool {S : Type} (p q : Proposition S) :
    (∀ w : World S, p.eval w ↔ q.eval w) ↔
    (∀ v : S → Bool, p.evalBool v = q.evalBool v) := by
  classical
  constructor
  · intro h v
    have hw := h (fun s => v s = true)
    rw [← Proposition.evalBool_correct p v, ← Proposition.evalBool_correct q v] at hw
    cases hp : p.evalBool v <;> cases hq : q.evalBool v <;> simp_all
  · intro h w
    set v : S → Bool := fun s => decide (w s) with hv
    have hbridge : ∀ s : S, w s ↔ (v s = true) := by
      intro s; simp [hv]
    rw [truth_functional_compositionality p w (fun s => v s = true) hbridge,
        truth_functional_compositionality q w (fun s => v s = true) hbridge,
        ← Proposition.evalBool_correct p v, ← Proposition.evalBool_correct q v, h v]

-- ═══════════════════════════════════════════════════════════════
-- Decidability over finite atom types
-- ═══════════════════════════════════════════════════════════════

/-- Semantic equivalence is decidable over finite atom types. Via the
    `semEq_iff_evalBool` bridge, the `Prop`-valued world quantifier is
    replaced by a quantifier over `S → Bool`, which is a `Fintype` when
    `S` is; the underlying `Bool` equality is decidable. This is
    definitionally the `semEq` relation of `TractatusOntology`. -/
def decideSemEq {S : Type} [Fintype S] [DecidableEq S]
    (p q : Proposition S) :
    Decidable (∀ w : World S, p.eval w ↔ q.eval w) :=
  decidable_of_iff _ (semEq_iff_evalBool p q).symm

/-- Logical-form equivalence (`formEq`: existence of an atom
    permutation carrying `p` to `q`) is decidable over finite atom
    types. There are finitely many permutations of a finite type, and
    `Proposition S` has decidable equality when `S` does. -/
def decideFormEq {S : Type} [Fintype S] [DecidableEq S]
    (p q : Proposition S) :
    Decidable (∃ e : Equiv.Perm S, p.rename e = q) :=
  Fintype.decidableExistsFintype

end Proposition

-- ═══════════════════════════════════════════════════════════════
-- Deciding the Theorem 5.7 separation witnesses at TwoFacts
-- ═══════════════════════════════════════════════════════════════

/-
The separation of Theorem 5.7 is not just provable but *computable*.
Below we run the decision procedures on the very witnesses proved in
`TractatusOntology`, at the concrete atom type `TwoFacts`:

  - `formEq` but not `semEq`: the atom-swapped elementaries
    `rain` / `snow` share their form but differ in truth value.
  - `semEq` but not `formEq`: double negation preserves truth
    conditions but changes tree depth.

Each `#eval` prints `true` / `false` exactly as the corresponding
theorem asserts.
-/

-- rain and snow have the same logical form (swap permutation): decidably true.
#eval @decide _ (Proposition.decideFormEq
  (Proposition.elementary TwoFacts.rain) (.elementary .snow))          -- true
-- ...but they are NOT semantically equivalent: decidably false.
#eval @decide _ (Proposition.decideSemEq
  (Proposition.elementary TwoFacts.rain) (.elementary .snow))          -- false
-- Double negation of `rain` IS semantically equivalent to `rain`: decidably true.
#eval @decide _ (Proposition.decideSemEq
  (Proposition.neg (.neg (.elementary TwoFacts.rain))) (.elementary .rain))  -- true
-- ...but it is NOT formEq to `rain` (rename preserves tree depth): decidably false.
#eval @decide _ (Proposition.decideFormEq
  (Proposition.neg (.neg (.elementary TwoFacts.rain))) (.elementary .rain))  -- false

end Tractatus
