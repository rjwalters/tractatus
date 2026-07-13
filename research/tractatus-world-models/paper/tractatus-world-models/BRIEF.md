---
title: "Independence as a Modeling Choice: The Geometry of Tractarian World Models"
author: "Robb Walters"
venue: "Synthese"
anonymous: false
claim: "Treating the Tractatus's independence thesis as a modeling choice places the free model at the top of a refinement lattice of world models, and color exclusion becomes a machine-checked separation theorem: no Horn constraint set is refinement-equivalent to any nontrivial exclusion model."
keywords:
  - Tractatus
  - independence thesis
  - color exclusion
  - world models
  - refinement lattice
  - Horn constraints
  - Lean 4
  - machine-checked philosophy
documentclass: article
---

# Brief: Independence as a Modeling Choice — The Geometry of Tractarian World Models

Follow-up to the RSL submission (`research/tractatus-ontology/`), which supplies the
semantic core (saying/showing, expressibility) but does not overlap: this paper is about
the *model theory of the independence thesis itself*. Target venue **Synthese**
(methodological framing; venue precedent: Spinney 2022).

## Motivation

The *Tractatus* asserts that states of affairs are mutually independent (TLP 1.21,
2.061–2.062). The color-exclusion problem (TLP 6.3751; "Some Remarks on Logical Form",
1929) is standardly told as this thesis's refutation and the proximate cause of the
book's collapse (Hacker). Rather than asking whether independence is *true*, we treat it
as a *modeling choice* and study the space of alternatives to it.

## Claim

Treating independence as a modeling choice places the free model as a distinguished
maximum in a refinement-ordered lattice of world models. Constraint classes carve this
lattice into tiers: Horn constraints admit an exact realizability boundary (rendering
TLP 2.061 precise), and exclusion constraints ¬(a ∧ b) — the formal shape of color
exclusion — provably transcend the Horn tier. Wittgenstein's 1929 crisis becomes a
machine-checked separation theorem about the geometry of logical space.

## Method (sketch)

A *world model* over a type S of states of affairs is a nonempty family of worlds with a
relation saying which states obtain where; its *image profiles* are the truth-value
patterns it realizes. A *refinement* M ⊑ M′ is a profile-preserving map. The free model
(every profile occurs) is the maximum; refinement is captured extensionally by
image-profile inclusion, giving the powerset lattice of 2^S with joins, meets, and
infinitary joins. Horn and exclusion tiers each admit exact realizability
characterizations; the top world (all states obtain) separates them.

## Experiments (evidence inventory)

All results are formalized in Lean 4 and checked by its kernel: 64 declarations, no
`sorry`s, axiom footprint limited to `propext`, `Classical.choice`, `Quot.sound`.
Evidence is the four Lean modules in the `tractatus` repository:

- `proofs/TractatusOntologySpectrum.lean` — refinement preorder, free model as maximum,
  uniqueness, image-profile lattice (join/meet/infinitary join).
- `proofs/TractatusOntologyHorn.lean` — Horn tier, `horn_realizable_iff` (the TLP 2.061
  boundary).
- `proofs/TractatusOntologyEquiv.lean` — equivalence tier as symmetric closure of Horn.
- `proofs/TractatusOntologyExclusion.lean` — exclusion tier; `exclusion_not_horn`
  separation theorem; color-exclusion corollary (this paper's new contribution).

The spectrum/Horn/equivalence modules are ported from the companion project (several
theorems proved by Harmonic's Aristotle from our statements); the exclusion module
(statements and proofs) was developed with Claude (Anthropic) for this paper. Theorem
statements are cross-referenced to Lean declarations in the paper's Appendix.

## Related work

- **Button 2017** (cardinality of logical space) — closest formal neighbor; global and
  cardinality-theoretic where ours is local and structural.
- **Moss 2012** (solving color incompatibility) — the standing objection; re-atomization
  is a move *within* the spectrum, engaged directly.
- **Armstrong 1989 / Skyrms 1981** (combinatorialism) — modeling possibility by the free
  model; the spectrum is the principled fallback under exclusion pressure.
- **Evans & Berger 2014** (cathoristic logic) — proof-theoretic dual of the exclusion
  tier.
- **McKinsey 1943 / Horn 1951** — the closure-under-intersection substrate that makes
  the top-world separation work.
- **Benzmüller & Woltzenlogel Paleo** (Gödel's ontological argument) — the mechanized-
  philosophy methodology precedent.

Full annotated positioning in the v1 thread's `literature.md` (superseded by this
BRIEF for anvil purposes).
