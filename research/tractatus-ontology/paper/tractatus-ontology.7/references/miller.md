# Hugh Miller -- Tractarian Semantics for Predicate Logic

## Citation

Miller, Hugh. "Tractarian Semantics for Predicate Logic." *History and Philosophy of Logic* 16, no. 2 (1995): 197--215.

- **DOI:** [10.1080/01445349508837249](https://doi.org/10.1080/01445349508837249)
- **Semantic Scholar:** <https://www.semanticscholar.org/paper/Tractarian-semantics-for-predicate-logic-Miller/7540397f23771c2bf96307b885e3e0ad3e93056c>
- **PhilPapers:** <https://philpapers.org/rec/HUGTSF>

## Abstract and Key Claims

Miller argues that the system of formal logic presented in Wittgenstein's *Tractatus Logico-Philosophicus* provides the basis for an alternative general semantics for predicate calculus that is:

- **Consistent and coherent** as a formal system
- **Essentially independent** of the metaphysics of logical atomism
- **Philosophically illuminating** in its own right

### Three Purposes of the Paper

1. **Describe Tractarian-style semantics.** Miller characterizes the general features of a semantics derived from the Tractatus, showing how it differs structurally from standard model-theoretic semantics.

2. **Defend against Fogelin's charge of expressive incompleteness.** Robert Fogelin had argued that the Tractarian logical system is expressively incomplete -- that it cannot capture all the logical distinctions needed for a full predicate calculus. Miller directly rebuts this, showing that the system has adequate expressive resources.

3. **Construct a Tractarian first-order predicate calculus.** Miller gives an explicit semantics for a formal language that is the Tractarian equivalent of a first-order predicate calculus, demonstrating that such a system is fully workable.

### Key Innovation: Truth Without Satisfaction

The most striking technical contribution is Miller's demonstration that a Tractatus-style truth-definition makes no appeal to Tarski's technical device of defining truth in terms of the satisfaction of predicates by infinite sequences of objects. Instead, truth is defined directly in terms of the pictorial relationship between propositions and states of affairs. Despite this fundamentally different approach, the resulting truth-definition is materially equivalent to standard Tarski-style truth-definitions.

This is philosophically significant because it shows that the Tarskian apparatus -- which has dominated formal semantics since the 1930s -- is not the only viable foundation for a rigorous semantics of predicate logic. The Tractarian alternative achieves the same extensional results through different conceptual machinery.

## Approach and Method

Miller works within the framework of Wittgenstein's picture theory of propositions. Elementary propositions are conceived as pictures of possible states of affairs (Sachverhalte). Complex propositions are truth-functions of elementary propositions. Quantification is handled not through variable-binding and satisfaction (as in Tarski) but through truth-functional operations over the totality of elementary propositions involving given objects.

The paper is both philosophical and formal: Miller provides careful exegesis of the relevant Tractatus passages alongside a rigorous construction of the formal semantics.

## Relation to Our Work

Our project formalizes the Tractatus in Lean 4 with machine-checked proofs, parameterized world models, and an expressibility collapse theorem for the saying/showing distinction. Miller's work connects in several important ways:

1. **Alternative semantic foundation.** Miller demonstrates that Tractarian semantics can stand on its own as a coherent formal system, independent of Wittgenstein's broader metaphysical commitments. This supports our project's viability: if a Tractarian semantics can be made rigorous informally, it can be made rigorous in Lean 4.

2. **Predicate logic encoding.** Miller's explicit construction of a Tractarian first-order predicate calculus provides a concrete target for formalization. His treatment of quantification without Tarskian satisfaction is particularly relevant to how we encode quantification in our Lean system -- we may want to follow his approach of treating quantifiers as truth-functional operations over object domains.

3. **Picture theory formalized.** Miller's work on the pictorial relationship between propositions and states of affairs (Sachverhalte) provides a bridge between Wittgenstein's ontology (objects, states of affairs, facts) and the logical formalism. This is directly relevant to our ontological layer (World, Object, Sachverhalt types).

4. **Expressive completeness.** Miller's defense against Fogelin's incompleteness charge is important for our project: it provides evidence that the Tractarian system we are formalizing is not inherently limited in ways that would undermine its interest. If Miller is right that the system is expressively complete for first-order logic, then our formalization captures a genuinely powerful logical system.

5. **Saying/showing and truth-definitions.** Miller's demonstration that truth can be defined without Tarskian satisfaction -- directly through the picture relation -- is relevant to our expressibility collapse theorem. The picture relation is precisely the kind of "showing" that Wittgenstein contrasts with "saying." Miller shows this showing-based approach can ground a complete truth theory, which raises the question of exactly where and why the saying/showing distinction breaks down -- the question our collapse theorem addresses.

6. **Historical priority.** As a 1995 paper, Miller's work is the earliest rigorous formal reconstruction of Tractarian semantics for predicate logic. Weiss (2017) builds on and extends this tradition. Citing Miller establishes the lineage of our formalization project within a recognized research program.

## Related Work

Miller's paper should be read alongside:

- Weiss, Max. "Logic in the Tractatus." *Review of Symbolic Logic* 10, no. 1 (2017): 1--50. [Extends the formal analysis with deeper complexity results]
- Fogelin, Robert. *Wittgenstein*. 2nd ed. London: Routledge, 1987. [The incompleteness charge Miller rebuts]
- Carruthers, Peter. *Tractarian Semantics*. Oxford: Blackwell, 1989. [Earlier work on Tractarian semantics that Miller engages with]
