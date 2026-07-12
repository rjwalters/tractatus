# Lokhorst (1988) -- Formal Reconstruction of the Tractatus

## Full Citation

Lokhorst, Gert-Jan C. "Ontology, Semantics and Philosophy of Mind in
Wittgenstein's *Tractatus*: A Formal Reconstruction." *Erkenntnis* 29,
no. 1 (1988): 35--75.

- **DOI:** `10.1007/BF00166365`
- **URL (Springer):** https://link.springer.com/article/10.1007/BF00166365
- **URL (open access PDF via Academia.edu):** https://www.academia.edu/45360158/Ontology_semantics_and_philosophy_of_mind_in_Wittgensteins_Tractatus_A_formal_reconstruction
- **Based on:** Lokhorst's 1985 doctoral dissertation, *Ontologie, Semantiek
  en Filosofie van de Geest in Wittgensteins Tractatus*, Erasmus University
  Rotterdam.

---

## Summary of Approach

Lokhorst provides the first rigorous, set-theoretic formalization of the
*Tractatus* that covers three domains simultaneously: ontology, semantics
(picture theory of meaning), and philosophy of mind (propositional
attitudes). Earlier formal reconstructions (Stenius, Copi, etc.) addressed
ontology and semantics but left Wittgenstein's remarks on belief, thought,
and the subject untouched. Lokhorst unifies all three.

---

## Key Claims and Formal Apparatus

### 1. Ontology

- **Objects** (*Gegenstande*): a set G with 1 <= Card(G) <= aleph_0.
- **States of affairs** (*Sachverhalte*): SA is a subset of G* (finite
  concatenations of objects), with Card(SA) = aleph_0.
- **Situations and worlds**: The set of situations S forms a complete
  atomic Boolean algebra S = <S, join, meet, complement, 1, 0>. Dual
  atoms of this algebra are possible worlds W.
- **Independence axiom**: All states of affairs are logically independent
  of one another (Condition 1).

### 2. Syntax -- Language and Thought

- **Elementary sentences** (EL): concatenations of names, with
  Card(EL) = aleph_0.
- **Full language L** built by closure under:
  (a) elementary sentences,
  (b) joint negation NP over countable sets P (the Sheffer stroke
      generalized),
  (c) necessity operator box,
  (d) universal quantification (x)p_x.
- **Language of thought** constructed in parallel using thought-elements
  (TE) and elementary thoughts (ET), mirroring the sentence structure.

### 3. Semantics -- Picture Theory

- **Sense function** sigma: B -> S maps pictures (sentences/thoughts) to
  situations:
  - sigma(e_0 * ... * e_n) = delta(e_0) * ... * delta(e_n)
    (denotation of names composed into the depicted state of affairs)
  - sigma(NP) = meet{complement(sigma(b)) : b in P}
  - sigma(box b) = 0 if sigma(b) = 0, else 1
- **Truth**: TV(b, s) = T iff sigma(b) is a part of s (i.e., the
  depicted situation obtains in s).

### 4. Central Theorems

- **Theorem 1** (Independence): All state-descriptions are jointly
  possible.
- **Theorem 2** (World describability): Distinct possible worlds differ
  on the truth-value of some elementary sentence.
- **Theorem 3** (Bijection): There is a 1-1 correspondence between
  worlds, complete state-descriptions, and maximal-consistent sets of
  states of affairs.
- **Theorems 4--5** (Recursive validity): Validity is recursively
  definable; the set of valid sentences is the same across all Tractarian
  interpretations.
- **Theorem 6** (Truth-functionality): Every sentence is a
  truth-function of elementary sentences.

### 5. Propositional Attitudes and Doxastic Logic

- Wittgenstein's "A thinks that p" is analyzed as analogous to "'p' says
  that p" -- a sense-specification involving mental pictures.
- The subject A is not a simple object but an "incomplete symbol"
  referring to situation-classes (facts).
- **Doxastic operator** D_a is added to the language; its semantics use
  a mapping psi_a that assigns to each situation the set of thoughts
  occurring "in" the subject A at that situation.
- **Theorem 8** (Supervenience): The truth-value of thought-ascriptions
  is fully determined by the denotation function delta and psi_a. That
  is, propositional attitudes supervene on elementary facts.
- **Theorem 9** (Completeness): The resulting doxastic modal logic DML
  is complete with respect to all Tractarian interpretations.

### 6. DML Axioms (selected)

1. Finitary propositional logic axioms
2. Conjunction introduction: (and P) implies p
3. Necessity: box p implies p
4. State-description possibility: diamond(and SD)
5. Bivalence/truth-functionality: (and SD implies p) or (and SD implies not p)
6. Attitude congruence: (p iff q) implies (D_a p iff D_a q)

---

## Relation to Our Work

We are formalizing the *Tractatus* in Lean 4 with machine-checked proofs,
parameterized world models, and an expressibility collapse theorem for
the saying/showing distinction. Lokhorst's paper is directly relevant in
the following ways:

### Direct overlaps

1. **Ontological foundation is nearly identical to ours.** Lokhorst's
   set-theoretic apparatus (objects, states of affairs as concatenations,
   situations as a Boolean algebra, worlds as dual atoms) corresponds
   closely to what we are encoding in Lean. His axioms can serve as a
   validation target: our Lean definitions should be able to derive his
   Theorems 1--3.

2. **Truth-functionality theorem (Theorem 6).** Lokhorst proves that
   every sentence is a truth-function of elementary sentences. This is
   structurally related to our expressibility collapse: the space of
   "sayable" things collapses to truth-functional combinations of
   elementary propositions. In our framework, anything that escapes
   this collapse belongs to the "showing" side of the distinction.

3. **Parameterized models.** Lokhorst already parameterizes his
   construction over the cardinality of G and SA and the denotation
   function delta. Our Lean 4 approach generalizes this further with
   universe-polymorphic type parameters, but his parameter choices
   (countable objects, countable states of affairs, independence) are
   a natural specialization of our setup.

4. **Independence of states of affairs.** His Condition 1 (logical
   independence of Sachverhalte) is a key axiom we also adopt.
   Lokhorst's proof that independence implies the bijection in
   Theorem 3 is a result we should reproduce in Lean.

### Where we go beyond Lokhorst

5. **Saying/showing distinction.** Lokhorst does not formalize the
   saying/showing distinction itself. He works entirely within the
   "sayable" domain. Our expressibility collapse theorem -- showing
   that the meta-theoretic properties of the formalism (e.g., the
   picture-fact isomorphism, logical form) cannot be expressed as
   propositions within the object language -- is a contribution that
   goes beyond his reconstruction.

6. **Machine-checked proofs.** Lokhorst's proofs are pen-and-paper
   (standard for 1988). Our Lean 4 formalization provides machine-
   checked guarantees and makes the entire development reproducible
   and extensible.

7. **Doxastic extension.** Lokhorst's doxastic modal logic (DML) for
   propositional attitudes is a natural extension we could potentially
   encode in Lean as a second layer, though it is not our current
   focus. His completeness theorem (Theorem 9) would be an interesting
   future formalization target.

### Use in our paper

Lokhorst (1988) should be cited as the most comprehensive prior formal
reconstruction of the *Tractatus*. We should position our work as:
(a) mechanizing and extending Lokhorst's ontological and semantic core
in a proof assistant, and (b) adding the saying/showing collapse theorem,
which his framework leaves implicit.
