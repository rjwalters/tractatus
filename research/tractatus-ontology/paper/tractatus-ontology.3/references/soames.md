# Soames 1983 -- Generality, Truth Functions, and Expressive Capacity in the Tractatus

## Full Citation

Soames, Scott. "Generality, Truth Functions, and Expressive Capacity in the
Tractatus." *The Philosophical Review* 92, no. 4 (October 1983): 573--589.

## DOI / URL

- DOI: [10.2307/2184881](https://doi.org/10.2307/2184881)
- JSTOR: <https://www.jstor.org/stable/2184881>
- PhilPapers: <https://philpapers.org/rec/SOAGTF>

## Key Claims

1. **The Tractatus's reduction of all logic to truth-functional operations
   on elementary propositions is undermined by quantification over infinite
   domains.** Wittgenstein claims (TLP 6) that every proposition is a
   truth-functional compound of elementary propositions, and (TLP 5.52)
   that quantifiers are applications of the N-operator. Soames shows that
   this program faces fundamental difficulties when the domain of
   quantification is infinite, because the truth-functional expansion of a
   universally quantified proposition becomes an infinite conjunction that
   cannot be constructed by finitary syntactic means.

2. **Notational extensions are needed for expressive adequacy.** Soames
   proposes modifications to the N-operator notation -- specifically,
   introducing hard brackets `[...]` for scope disambiguation -- to give
   the Tractarian system a chance at expressing mixed multiply-general
   propositions (e.g., formulas with nested quantifiers and multi-place
   predicates). For example, expressions like `N(N(x[N(Fx)]))` are used
   to represent negated universal quantification. These notational devices
   are not found anywhere in Wittgenstein's own writings.

3. **The N-operator cannot emulate second-order quantification.** Even with
   Soames's proposed extensions, the N-operator system cannot express the
   binding of predicate variables or function/operator variables. This is
   a hard limitation: the Tractarian apparatus is restricted to first-order
   expressiveness at best.

4. **Finite domains dissolve the problem.** Soames correctly observes that
   if there are only finitely many Tractarian objects, then no quantifiers
   are strictly required -- universal quantification reduces to finite
   conjunction, existential to finite disjunction. The problem arises only
   when the domain is infinite or its cardinality is unknown, which is the
   philosophically interesting case since Wittgenstein held that the number
   of objects cannot be known a priori.

5. **The "general propositional form" is overstated.** TLP 6 claims that
   the general form of a proposition is `[p-bar, xi-bar, N(xi-bar)]`,
   meaning every proposition can be generated from elementary propositions
   by iterated application of the N-operator. Soames's analysis shows this
   claim is tenable only for finite domains; for infinite domains, the
   generation procedure is not well-defined without additional machinery
   that goes beyond what Wittgenstein provides.

## Relevance to the Lean Formalization

In `TractatusQuantifiers.lean`, Section 5 (lines 265--286) explicitly cites
Soames (1983) as showing that the Tractatus's claim that "all of logic
reduces to truth-functional operations on elementary propositions" is
undermined by the infinite-domain case.

The Lean formalization engages with Soames's critique in several ways:

- **The `FOProp` type is explicitly first-order.** The formalization
  introduces `FOProp S D` with `forall_` and `exists_` constructors that
  use higher-order abstract syntax (HOAS). This directly models what Soames
  shows the Tractatus *needs* but cannot provide through the N-operator
  alone: genuine quantifier binding over a domain `D`.

- **Compositionality holds semantically, not syntactically.** The theorem
  `truth_functional_compositionality_fo` proves that the *semantic* content
  of TLP 5 -- truth-value determination by elementary states of affairs --
  holds for FOProp, including quantified formulas over arbitrary domains.
  This captures what Wittgenstein *wanted* to be true, while the Lean
  formalization honestly acknowledges (via the Geach/Soames citation) that
  the *syntactic* mechanism he proposed (the N-operator) cannot deliver it
  for infinite domains.

- **The finite-domain bridge is deferred.** The planned theorem
  `quantifier_as_nOp_finite` (pending issue #10723) will formalize the
  connection between quantifiers and the N-operator for `[Fintype D]`,
  which is exactly the case Soames identifies as unproblematic.

- **Honest scope limitation.** By not attempting to formalize the N-operator
  connection for infinite domains, the Lean formalization implicitly adopts
  Soames's conclusion: the Tractarian program works for finite domains but
  requires non-Tractarian resources (genuine quantifier binding) for the
  general case.

## Further Reading

Soames returned to the Tractatus extensively in his later work:

- Soames, Scott. *The Analytic Tradition in Philosophy, Volume 1: The
  Founding Giants.* Princeton University Press, 2014. Chapters 9--12
  cover the Tractatus's logical system in depth, building on the 1983
  analysis.

## Sources

- [Generality, truth functions, and expressive capacity in the tractatus -- PhilPapers](https://philpapers.org/rec/SOAGTF)
- [Citations of Soames 1983 -- PhilArchive](https://philarchive.org/citations/SOAGTF)
- [Scott Soames -- Wikipedia](https://en.wikipedia.org/wiki/Scott_Soames)
- [Review of Soames, Analytic Tradition Vol. 2 -- Notre Dame Philosophical Reviews](https://ndpr.nd.edu/reviews/the-analytic-tradition-in-philosophy-volume-2-a-new-vision/)
- [Peter Hanks, "Soames on the Tractatus" -- PhilPapers](https://philpapers.org/rec/HANSOT-8)
