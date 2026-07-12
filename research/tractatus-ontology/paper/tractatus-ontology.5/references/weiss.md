# Max Weiss -- Logic in the Tractatus

## Citation

Weiss, Max. "Logic in the Tractatus." *The Review of Symbolic Logic* 10, no. 1 (2017): 1--50.

- **DOI:** [10.1017/S1755020316000472](https://doi.org/10.1017/S1755020316000472)
- **Cambridge Core:** <https://www.cambridge.org/core/journals/review-of-symbolic-logic/article/logic-in-the-tractatus/1BD52A27066FDB750369041A10F9496A>
- **PhilArchive (open access):** <https://philarchive.org/archive/MAXLIT-2>
- **PhilPapers:** <https://philpapers.org/rec/MAXLIT-2>

### Dissertation (prior version)

Weiss, Max. "Logic in the Tractatus." PhD diss., University of British Columbia, 2013.

- **DOI:** [10.14288/1.0165595](https://doi.org/10.14288/1.0165595)
- **UBC Open Collections:** <https://open.library.ubc.ca/soa/cIRcle/collections/ubctheses/24/items/1.0165595>
- **License:** CC BY-NC-ND 4.0

## Author

Max Weiss is a faculty member in the Department of Philosophy at the University of British Columbia. His research spans logic, metaphysics, and the history of analytic philosophy.

- **Faculty page:** <https://philosophy.ubc.ca/max_weiss-2/>
- **PhilPeople:** <https://philpeople.org/profiles/max-weiss>

## Abstract and Key Claims

Weiss presents a formal reconstruction of the logical system implicit in Wittgenstein's *Tractatus Logico-Philosophicus*. The reconstructed system differs from classical logic in two principal ways:

1. **Form-series device.** Weiss gives a precise account of Wittgenstein's "form-series" operator (the N-operator and its iterates), which suffices to express certain effectively generated countably infinite disjunctions. This goes beyond finite propositional logic but falls short of full infinitary logic.

2. **Relativized structure.** The attendant notion of logical structure is relativized to a fixed underlying universe of named objects, rather than being absolute.

### Three Main Results

1. **Closure under finitary induction.** The class of concepts definable in the Tractarian system is closed under finitary induction. This means the system has significant expressive power -- enough to define arithmetic-like concepts.

2. **Complexity of tautology (upper bound).** If the universe of objects is countably infinite, then the property of being a tautology is Pi-1-1-complete (i.e., at the level of co-analytic sets in the analytic hierarchy). This is far beyond the decidability of propositional logic and even beyond the Sigma-0-1-completeness of first-order validity.

3. **Definability conditioned on countability.** It is only under the assumption that the universe is countable that the class of tautologies becomes Sigma-1-definable in set theory.

### The Core Tension

Weiss's results reveal a deep tension in the Tractatus. Wittgenstein simultaneously holds:

- **Structural manifestation:** Logical relationships must show themselves in the structure of signs alone.
- **Metaphysical neutrality:** Logic must not prejudge the number of objects in the world.

Weiss demonstrates that these two commitments are in tension: there is no single way in which logical relationships can be held to manifest themselves in signs that does not presuppose something about the cardinality of the object domain. If the universe is uncountable, the tautology property may not even be definable in set theory in the same way. The system's behavior is sensitive to the size of the universe in ways that Wittgenstein's philosophical remarks seem to deny.

## Approach and Method

Weiss proceeds by close textual reading of the Tractatus combined with rigorous mathematical logic. He constructs a formal language and a formal semantics based on Wittgenstein's remarks about elementary propositions, truth-functions, the N-operator, and form-series. He then uses techniques from descriptive set theory and computability theory to analyze the resulting logical system. The 50-page paper is mathematically dense, with full proofs of the three main results.

## Relation to Our Work

Our project formalizes the Tractatus in Lean 4 with machine-checked proofs, parameterized world models, and an expressibility collapse theorem for the saying/showing distinction. Weiss's work is directly relevant in several ways:

1. **Formal semantics baseline.** Weiss provides the most mathematically rigorous existing reconstruction of Tractarian logic. His formal language and semantics can serve as a reference point (and potential comparison target) for our Lean 4 formalization. We should verify that our system captures at least the expressive power Weiss identifies.

2. **Form-series / N-operator.** Weiss's treatment of the N-operator and form-series is the state of the art. Our Lean encoding of Tractarian propositions should be checked against his characterization, especially the handling of countably infinite disjunctions.

3. **Parameterized world models.** Weiss's key insight -- that the logical system's properties depend critically on the cardinality of the object domain -- directly supports our decision to parameterize over world models. His result that tautology-hood is Pi-1-1-complete for countable universes provides concrete complexity benchmarks we may want to prove or reference.

4. **Expressibility collapse.** Weiss's tension between structural manifestation and metaphysical neutrality is intimately related to our expressibility collapse theorem. His result shows that "showing" (structural manifestation in signs) cannot fully capture "saying" (logical truth) without presupposing facts about the world -- a version of the saying/showing collapse. We should cite Weiss as providing independent mathematical evidence for the phenomenon our theorem captures.

5. **Limits of Tractarian logic.** Weiss's complexity results (Pi-1-1-completeness) set upper bounds on what any formalization of Tractarian logic can decide, which may inform the design of our proof strategies and what we can expect to be decidable within Lean.
