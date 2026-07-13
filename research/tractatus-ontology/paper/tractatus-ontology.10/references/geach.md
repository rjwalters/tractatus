# Geach 1981 -- Wittgenstein's Operator N

## Full Citation

Geach, P. T. "Wittgenstein's Operator N." *Analysis* 41, no. 4 (October 1981): 168--171.

Follow-up: Geach, P. T. "More on Wittgenstein's Operator 'N'." *Analysis* 42, no. 3 (1982): 127--128.

## DOI / URL

- DOI: [10.1093/analys/41.4.168](https://doi.org/10.1093/analys/41.4.168)
- Oxford Academic: <https://academic.oup.com/analysis/article-abstract/41/4/168/115226>
- PhilPapers: <https://philpapers.org/rec/GEAWON>

## Key Claims

1. **The N-operator cannot handle infinite domains without supplementation.**
   Wittgenstein's Tractatus (TLP 5.52) claims that quantifiers are applications
   of the single N-operator to all values of a propositional function:
   universal quantification is the joint negation of the negations of all
   instances, and existential quantification is the negation of the joint
   negation of all instances. For a finite domain this is unproblematic --
   the N-operator can be applied to a finite list of propositions. For an
   infinite domain, the N-operator would need to be applied to infinitely
   many arguments, and there is no mechanism in the Tractatus for doing so
   in a finite number of steps.

2. **Class-forming operators are needed.** Geach proposes that the gap can be
   bridged by deploying class-forming operators: the N-operator would apply
   not to an enumerated list of propositions but to a *class* of propositions
   specified by a propositional function. For example, the notation
   `[aRb, aSb, aR/Sb]` gives a series of propositions `aRb, aR/Rb,
   aR/(R/R)b`, etc., ad infinitum. This allows quantification over infinite
   domains via a finite specification of the class of operands.

3. **Tension with Tractarian doctrine.** This class-forming solution is in
   tension with fundamental Tractarian commitments. Wittgenstein explicitly
   repudiates classes at TLP 6.031 ("The theory of classes is completely
   superfluous in mathematics"). Introducing class-forming operators to save
   the N-operator's expressive completeness appears to undermine the very
   simplicity and self-sufficiency of the Tractarian logical system.

4. **The Fogelin--Geach dilemma.** Geach's work is part of a broader debate
   with Robert Fogelin (who argued in *Wittgenstein*, 1976, that N is
   expressively incomplete). The dilemma that emerged: either concede that N
   is expressively incomplete (Fogelin), or supplement it with devices like
   class-forming operators that conflict with core Tractarian tenets (Geach).
   Either way, there is a fundamental gap in Wittgenstein's account of how
   quantified logic reduces to truth-functional operations on elementary
   propositions.

## Relevance to the Lean Formalization

In `TractatusQuantifiers.lean`, Section 5 (lines 265--286) explicitly cites
Geach (1981) as identifying "a fundamental gap in the Tractatus." The Lean
formalization sidesteps the problem by:

- **Finite domains:** For `[Fintype D]`, universal quantification *is*
  literally a finite conjunction, and the connection to the N-operator is
  direct. The planned theorem `quantifier_as_nOp_finite` (pending the
  N-operator formalization, issue #10723) will formalize this.

- **Infinite domains:** The formalization uses standard Lean quantifiers
  (`forall` and `exists`) directly, which are not reducible to finitary
  truth-functional operations. This is an honest acknowledgment of the
  Geach/Soames critique: the Lean formalization captures Wittgenstein's
  *intended* semantics for quantifiers without pretending that the
  N-operator mechanism works for infinite domains.

- **Compositionality preserved:** The key theorem
  `truth_functional_compositionality_fo` shows that even with quantifiers
  over arbitrary (possibly infinite) domains, truth-functional
  compositionality holds -- two worlds that agree on all elementary states
  of affairs agree on all FOProp values. This is the *semantic* content
  of TLP 5.52, even though the *syntactic* mechanism (N-operator on
  infinite lists) is problematic.

## Sources

- [Wittgenstein's operator N -- Oxford Academic](https://academic.oup.com/analysis/article-abstract/41/4/168/115226)
- [P. T. Geach, Wittgenstein's operator N -- PhilPapers](https://philpapers.org/rec/GEAWON)
- [On Operator N and Wittgenstein's Logical Philosophy -- Connelly (2023)](https://jhaponline.org/jhap/article/view/2963)
- [The power and the limits of Wittgenstein's N operator -- Jacquette (2006)](https://www.tandfonline.com/doi/abs/10.1080/01445340500420964)
