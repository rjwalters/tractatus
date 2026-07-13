# Literature Review — Independence as a Modeling Choice: The Geometry of Tractarian World Models

Target venue: **Synthese** (methodological framing). Companion to the RSL submission
(`research/tractatus-ontology/`, v9), which it cites for the semantic core but does not
overlap: that paper is about saying/showing and expressibility; this one is about the
*model theory of the independence thesis itself*.

## Positioning

The Tractatus asserts (TLP 1.21, 2.061–2.062) that states of affairs are mutually
independent: "Each item can be the case or not the case while everything else remains
the same." The color-exclusion problem — raised by Ramsey's 1923 review, confronted by
Wittgenstein himself in TLP 6.3751 and then fatally in "Some Remarks on Logical Form"
(1929) — is standardly told as the thesis's refutation and the proximate cause of the
Tractatus's collapse (Hacker's "Wittgenstein's first philosophy collapsed over its
inability to solve one problem — colour exclusion").

This paper retells the story model-theoretically, on a machine-checked foundation.
Instead of asking whether independence is *true*, we treat it as a *modeling choice*:
a distinguished point (the free model) in an ordered space of world models, organized
by a refinement preorder with lattice structure. Constraint classes carve tiers into
this space: equivalence constraints refine into Horn constraints, and Horn constraints
admit an exact realizability characterization (`horn_realizable_iff`) that renders TLP
2.061's boundary precise. The new contribution beyond the ported development is the
**exclusion tier**: exclusion constraints ¬(a ∧ b) — the formal shape of color
exclusion — provably transcend the Horn tier (no Horn constraint set is
refinement-equivalent to any nontrivial exclusion model). Wittgenstein's 1929 crisis
thus becomes a *theorem about the geometry of logical space*: the constraint his
phenomenology forced on him is structurally unreachable from the constraint class
within which independence-relaxation is well-behaved.

All results are formalized in Lean 4 and machine-checked (proof artifact: the
`tractatus` repository; ~130 verified declarations of which this paper uses the
Horn/Equiv/Spectrum/Exclusion modules). The methodological through-line for the
Synthese audience: proof assistants let philosophy-of-logic disputes about *what
follows from what* be settled by the kernel, moving the debate to where it belongs —
which formal explication is faithful.

## Key Related Work

### The color-exclusion problem
- **Wittgenstein 1921/1922** (TLP; Ogden tr.): 1.21, 2.061–2.062 (independence),
  4.211 (a sign of an elementary proposition: no elementary proposition contradicts
  it), 6.3751 (color exclusion as *logical* impossibility). Primary text; already
  `\bibitem{wittgenstein1921}` in the RSL paper.
- **Wittgenstein 1929**, "Some Remarks on Logical Form", *PAS* Suppl. 9: 162–171.
  Abandons independence: attributions of degree exclude one another, and the exclusion
  is not truth-functional. Already `\bibitem{wittgenstein1929}`.
- **Ramsey 1923**, Critical Notice of the *Tractatus*, *Mind* 32(128): 465–478. First
  statement of the problem in print ("necessarily red excludes blue…").
- **Moss 2012**, "Solving the Color Incompatibility Problem", *JPL* 41(5): 841–851,
  doi:10.1007/s10992-011-9193-3. Argues the Tractarian program survives: constructs
  elementary propositions (vector-valued, degree-theoretic) for which exclusions come
  out logical. Relation: *complementary-opposed* — Moss rescues independence by
  re-choosing the atoms; we make the space of such choices itself the object of study.
  Her solution lives at a different point of our spectrum (re-atomization = moving to
  a different `WorldModel`), which our framework makes explicit.
- **Button 2017**, "Exclusion Problems and the Cardinality of Logical Space",
  *JPL* 46(6): 611–623, doi:10.1007/s10992-016-9412-z. Necessary and sufficient
  condition for tenability of the atomist picture: logical space has cardinality a
  power of two. Relation: *closest formal neighbor*. Button's condition is
  cardinality-global; our `horn_realizable_iff` / exclusion-boundary results are
  structural and constraint-local, and machine-checked. We refine his dialectic: the
  question is not only *how big* logical space is but *which subsets of the free
  model's profile set are carved by which constraint classes*.

### Tractarian modal metaphysics / combinatorialism
- **Skyrms 1981**, "Tractarian Nominalism", *Phil. Studies* 40: 199–206. Possible
  worlds as recombinations over a fixed stock — the free model in metaphysical dress.
- **Armstrong 1989**, *A Combinatorial Theory of Possibility*, CUP. Explicitly adopts
  the "Tractarian thesis of Independence" for first-order states of affairs; our
  spectrum formalizes what dropping it costs (which tautologies/contradictions are
  gained, `tautology_pullback` / `contradiction_pullback`).
- **Spinney 2022**, "Logical form and logical space in Wittgenstein's Tractatus",
  *Synthese* 200(1), doi:10.1007/s11229-022-03470-y. Venue precedent; places in
  logical space reduce to forms of objects/names. Already `\bibitem{spinney2022}`.

### Formal reconstructions of the Tractatus
- **Lokhorst 1988**, *Erkenntnis* 29: 35–75 (formal reconstruction; already cited in
  RSL paper).
- **Weiss 2017**, "Logic in the Tractatus", *RSL* 10(1): 1–50 (already cited).
- **Companion paper** (under review, RSL): the semantic core (`WorldModel`,
  `Proposition`, expressibility collapse, N-operator, exact expressibility). This
  paper cites it as the source of the base formalization and deliberately does not
  restate its philosophy-of-language results.
- **Evans & Berger 2014**, "Cathoristic logic: A modal logic of incompatible
  propositions", arXiv:1411.7158. A logic where incompatibility (not negation) is
  primitive — the proof-theoretic dual of our model-theoretic exclusion tier.
  Relation: orthogonal machinery, same target phenomenon; worth one paragraph.

### Horn theory (the mathematical substrate)
- **McKinsey 1943**, "The decision problem for some classes of sentences without
  quantifiers", *JSL* 8(3): 61–76. Origin of the clause class.
- **Horn 1951**, "On sentences which are true of direct unions of algebras",
  *JSL* 16(1): 14–21. Closure of Horn classes under products/intersections — the
  classical explanation for *why* our Horn tier is well-behaved (the top world's
  membership, load-bearing in `exclusion_not_horn`, is the nullary instance of
  closure under intersection: positive implications are satisfied by the all-true
  valuation; exclusions are not).

### Machine-checked philosophy (methodology precedent)
- **Benzmüller & Woltzenlogel Paleo** (Gödel's ontological argument; already
  `\bibitem{benzmuller2017}` in the RSL paper) — the flagship precedent for
  settling interpretive disputes by mechanization.
- **de Moura & Ullrich 2021** (Lean 4 system description; already
  `\bibitem{moura2021}`).

## Gap Analysis

No prior work: (1) treats the independence thesis as a *parameter* ranging over an
ordered space of models rather than a thesis to be defended or refuted; (2) gives an
exact, machine-checked realizability boundary for a constraint class (TLP 2.061 as a
biconditional, `horn_realizable_iff`); (3) *proves* that color-exclusion-shaped
constraints are structurally outside the well-behaved (Horn) class — turning the
historical "collapse" narrative into a separation theorem; (4) exhibits the lattice
structure (join/meet/infinitary join via image profiles) of Tractarian logical space.
Button 2017 comes closest to (2)/(3) but works with cardinality, not structure, and
without mechanization. Moss 2012 is the standing objection to the framing (choose
better atoms and independence survives) — the paper must engage her directly:
re-atomization is itself a move *within* the spectrum, not an escape from it.

## Search Methodology

Web searches (July 2026): color exclusion + TLP 6.3751 + 1929 paper; Moss color
incompatibility; Button exclusion problems / cardinality of logical space
(UCL Discovery OA copy confirmed); Armstrong/Skyrms combinatorialism; Horn/McKinsey
1951/1943 closure properties; cathoristic logic arXiv:1411.7158; Synthese
formalization precedents (Spinney 2022; Benzmüller). Internal: reused verified
citations from `research/tractatus-ontology/paper/tractatus-ontology.9/`
(`references/*.md`, `paper.tex` bibliography); Lean sources
`proofs/TractatusOntology{Horn,Equiv,Spectrum}.lean` (merged PR #9) and the new
`TractatusOntologyExclusion.lean` (this branch).
