import TractatusOntologyHorn
import TractatusOntologySpectrum

/-
# Tractatus T1c: `ExclusionModel` constructor — color exclusion (TLP 6.3751)

Companion to `TractatusOntologyHorn.lean`, `TractatusOntologyEquiv.lean`
and `TractatusOntologySpectrum.lean` addressing the **exclusion tier** of
the world-model spectrum `tractatus-ontology-oq-06`: mutual-exclusion
constrained world models, and the color-exclusion case study of
Wittgenstein's 1929 "Some Remarks on Logical Form" (TLP 6.3751).

Where the Horn tier (`HornModel`) captures *positive implication*
constraints `w a → w b`, this tier captures *mutual exclusion*
constraints `¬(w a ∧ w b)`: a point cannot be both red and green.
TLP 6.3751 identifies color exclusion as the paradigm case that the
Tractatus' independence doctrine (TLP 2.061) cannot accommodate — and
that, crucially, is *not* expressible as any conjunction of positive
implications. This file makes that last claim precise and machine-checked:
the exclusion tier **transcends** the Horn tier.

Contents:

- `ExclusionModel S cs` — subtype of `S → Prop` satisfying every
  exclusion clause `¬(w c.1 ∧ w c.2)` for `c ∈ cs`.
- `ExclusionModel.toWorld`, `ExclusionModel.toWorldModel` — projections
  to `World S` and to `WorldModel S` (constantly-`False` nonemptiness
  witness, mirroring the Horn/Equiv tiers).
- `exclusion_realizable_iff` — the exact exclusion realizability boundary
  (analog of `horn_realizable_iff`): a Boolean valuation `v : S → Bool`
  is realizable as the profile of some `ExclusionModel S cs` world iff
  `v` violates no clause.
- `exclusionModel_independence_fails` — generic exclusion-tier
  independence failure (analog of `hornModel_independence_fails`): a
  nontrivial clause blocks the all-true assignment.
- `hornModel_allTrue_realizable` — the top world (all states obtain) is a
  Horn world for *any* clause list.
- `exclusionModel_allTrue_not_realizable` — the top world is *never* an
  exclusion world once `cs` contains any clause.
- `exclusion_not_horn` — **the headline result**: no Horn model is
  refinement-equivalent to a nonempty exclusion model. The exclusion tier
  is not reducible to positive-implicational structure.
- `RedGreen`, `colorModel` — the concrete two-atom color case study
  ("point p is red" / "point p is green") with the single exclusion
  clause `¬(red ∧ green)`.
- `color_independence_fails`, `color_not_horn` — TLP 6.3751 rendered
  formal: color exclusion is a substantive constraint that no Horn
  (positive-implicational) structure can express.

## Attribution

New tier, authored for the follow-up paper on constrained world models
(issue #5). Both the statements *and* the proofs in this file are by
Claude (this session); nothing here is ported from lean-genius or proved
by Aristotle. Axiom footprint: `propext`, `Classical.choice`, `Quot.sound`
only.

No new axioms.  No sorries.
-/

namespace Tractatus

/-- An `ExclusionModel S cs`: world functions satisfying every exclusion
    clause `¬(w c.1 ∧ w c.2)` for `(c.1, c.2) ∈ cs`. Each pair `(a, b)`
    is read as "`a` and `b` cannot both obtain".

    This is the **exclusion-tier** spectrum representative. Unlike the
    Horn tier (positive implications `w a → w b`), no Horn clause list
    captures a nontrivial exclusion (see `exclusion_not_horn`): color
    exclusion (TLP 6.3751) is the paradigm instance. -/
def ExclusionModel (S : Type) (cs : List (S × S)) : Type :=
  { w : S → Prop // ∀ c ∈ cs, ¬(w c.1 ∧ w c.2) }

/-- Project an `ExclusionModel` element to its underlying bare world. -/
def ExclusionModel.toWorld {S : Type} {cs : List (S × S)}
    (w : ExclusionModel S cs) : World S :=
  w.val

/-- Package the `ExclusionModel S cs` worlds as a `WorldModel S`. The
    constantly-`False` world satisfies every exclusion clause vacuously
    (`¬(False ∧ False)`). -/
def ExclusionModel.toWorldModel (S : Type) (cs : List (S × S)) : WorldModel S where
  W        := ExclusionModel S cs
  holds    := fun w s => w.val s
  nonempty := ⟨⟨fun _ => False, fun _ _ h => h.1⟩⟩

/-- **Exact exclusion realizability boundary.** A Boolean valuation
    `v : S → Bool` is realizable as the profile of some `ExclusionModel
    S cs` world iff `v` violates no exclusion clause — i.e., no clause
    `(a, b)` has both `v a = true` and `v b = true`.

    This is the exclusion-tier analog of `horn_realizable_iff`. Its
    realizability notion mirrors that file: a world `w : ExclusionModel
    S cs` whose Boolean profile `fun s => w.val s ↔ (v s = true)`
    matches `v` pointwise. Right-to-left, the profile of `v` (read as a
    `Prop`-valued assignment) is itself an exclusion world; left-to-right,
    the realizer's constraint transfers back to `v`. -/
theorem exclusion_realizable_iff {S : Type} (cs : List (S × S))
    (v : S → Bool) :
    (∃ w : ExclusionModel S cs, ∀ s, w.val s ↔ (v s = true)) ↔
    (∀ c ∈ cs, ¬(v c.1 = true ∧ v c.2 = true)) := by
  constructor
  · rintro ⟨⟨w, hw⟩, hmatch⟩ c hc ⟨hv1, hv2⟩
    exact hw c hc ⟨(hmatch c.1).mpr hv1, (hmatch c.2).mpr hv2⟩
  · intro hv
    exact ⟨⟨fun s => v s = true, fun c hc h => hv c hc ⟨h.1, h.2⟩⟩,
           fun _ => Iff.rfl⟩

/-- **Generic exclusion-tier independence failure.** If `cs` is nonempty,
    the exclusion-constrained model cannot realise every Boolean
    assignment — i.e., `HasIndependentProfiles` fails.

    The bad assignment is the *all-true* profile `fun _ => True`: the head
    clause `(a, b)` forbids `w a ∧ w b`, yet the all-true realizer would
    satisfy both. Analog of `hornModel_independence_fails` /
    `equivModel_independence_fails`, but even sharper: no `a ≠ b`
    hypothesis is needed, since a self-clause `(a, a)` already forbids
    `w a ∧ w a`, i.e. `w a`. -/
theorem exclusionModel_independence_fails
    {S : Type} {cs : List (S × S)}
    (hne : cs ≠ []) :
    ¬ HasIndependentProfiles (ExclusionModel.toWorldModel S cs) := by
  intro h
  obtain ⟨head, rest, hcs⟩ := List.exists_cons_of_ne_nil hne
  subst hcs
  obtain ⟨a, b⟩ := head
  let bad : S → Prop := fun _ => True
  obtain ⟨⟨w, hw⟩, hmatch⟩ := h bad
  have ha : w a := (hmatch a).mpr trivial
  have hb : w b := (hmatch b).mpr trivial
  exact hw (a, b) List.mem_cons_self ⟨ha, hb⟩

/-! ## The exclusion tier transcends the Horn tier -/

/-- **The all-true world is always a Horn world.** For any Horn clause
    list `cs`, the profile `fun _ => True` (every state of affairs
    obtains — the "top" world) lies in `ImageProfiles (HornModel.toWorldModel
    S cs)`: every positive implication `w a → w b` is satisfied because its
    conclusion is `True`.

    Together with `exclusionModel_allTrue_not_realizable`, this is the
    lever separating the two tiers. -/
theorem hornModel_allTrue_realizable {S : Type} (cs : List (S × S)) :
    (fun _ => True) ∈ ImageProfiles (HornModel.toWorldModel S cs) :=
  ⟨⟨fun _ => True, fun _ _ _ => trivial⟩, fun _ => Iff.rfl⟩

/-- **The all-true world is never an exclusion world (for a nonempty
    clause list).** If `cs` contains any clause, the profile `fun _ => True`
    is *not* in `ImageProfiles (ExclusionModel.toWorldModel S cs)`: the head
    clause `(a, b)` forbids `w a ∧ w b`, which the all-true world violates.

    Holds even for a self-clause `(a, a)`, where `¬(w a ∧ w a)` reduces to
    `¬ w a`. -/
theorem exclusionModel_allTrue_not_realizable
    {S : Type} {cs : List (S × S)} (hne : cs ≠ []) :
    (fun _ => True) ∉ ImageProfiles (ExclusionModel.toWorldModel S cs) := by
  rintro ⟨⟨w, hw⟩, hmatch⟩
  obtain ⟨head, rest, hcs⟩ := List.exists_cons_of_ne_nil hne
  subst hcs
  obtain ⟨a, b⟩ := head
  have ha : w a := (hmatch a).mp trivial
  have hb : w b := (hmatch b).mp trivial
  exact hw (a, b) List.mem_cons_self ⟨ha, hb⟩

/-- **Headline result: the exclusion tier is not the Horn tier.** For any
    *nonempty* clause list `cs`, there is no Horn constraint list `ds` whose
    model is refinement-equivalent to `ExclusionModel.toWorldModel S cs`.

    Phrased via `refinesEquiv_iff_image_eq`, refinement-equivalence is
    equality of image-profile sets, so it suffices to exhibit a profile
    separating the two: the all-true world `fun _ => True` is realizable in
    every Horn model (`hornModel_allTrue_realizable`) but in no nonempty
    exclusion model (`exclusionModel_allTrue_not_realizable`). Hence no Horn
    model can share the exclusion model's image-profile set.

    This is the formal core of TLP 6.3751: mutual exclusion is a genuine
    constraint that positive-implicational (Horn) structure cannot
    reproduce. -/
theorem exclusion_not_horn
    {S : Type} {cs : List (S × S)} (hne : cs ≠ []) :
    ¬ ∃ ds : List (S × S),
      Refines (ExclusionModel.toWorldModel S cs) (HornModel.toWorldModel S ds) ∧
      Refines (HornModel.toWorldModel S ds) (ExclusionModel.toWorldModel S cs) := by
  rintro ⟨ds, hrefines⟩
  rw [refinesEquiv_iff_image_eq] at hrefines
  have htop_horn : (fun _ => True) ∈ ImageProfiles (HornModel.toWorldModel S ds) :=
    hornModel_allTrue_realizable ds
  rw [← hrefines] at htop_horn
  exact exclusionModel_allTrue_not_realizable hne htop_horn

/-! ## Concrete case study: color exclusion (TLP 6.3751)

Wittgenstein 1929, "Some Remarks on Logical Form": a single point in the
visual field cannot be both red and green. In the Tractatus this is the
crux that breaks the independence doctrine (TLP 2.061) — and, as the
theorems above show, it cannot be recast as any positive-implicational
(Horn) constraint. -/

/-- The two states of affairs of the color case study: a fixed visual
    point `p` is red, or `p` is green. TLP 6.3751 asserts these mutually
    exclude. -/
inductive RedGreen where
  | red
  | green
  deriving DecidableEq, Repr

/-- The **color-exclusion model**: worlds over `RedGreen` in which the
    single exclusion clause `¬(red ∧ green)` holds — the point `p` is not
    simultaneously red and green. The exclusion-tier instance of TLP
    6.3751. -/
def colorModel : WorldModel RedGreen :=
  ExclusionModel.toWorldModel RedGreen [(RedGreen.red, RedGreen.green)]

/-- **Color independence fails.** There is no world of `colorModel`
    realising the all-true assignment (`p` both red and green): the
    exclusion clause forbids it. Instance of
    `exclusionModel_independence_fails`; the Tractarian independence
    doctrine (TLP 2.061) breaks exactly here. -/
theorem color_independence_fails :
    ¬ HasIndependentProfiles colorModel :=
  exclusionModel_independence_fails (List.cons_ne_nil _ _)

/-- **Color exclusion is not Horn-expressible (TLP 6.3751).** No Horn
    constraint list `ds` yields a model refinement-equivalent to
    `colorModel`. Color exclusion is a substantive constraint that no
    positive-implicational structure can express — the formal upshot of
    Wittgenstein's 1929 color-exclusion argument. Instance of
    `exclusion_not_horn`. -/
theorem color_not_horn :
    ¬ ∃ ds : List (RedGreen × RedGreen),
      Refines colorModel (HornModel.toWorldModel RedGreen ds) ∧
      Refines (HornModel.toWorldModel RedGreen ds) colorModel :=
  exclusion_not_horn (List.cons_ne_nil _ _)

end Tractatus
