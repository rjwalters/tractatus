# Kai Wehmeier (and Brian Rogers) -- Tractarian First-Order Logic

## Citations

### Rogers & Wehmeier 2012 (the N-operator paper)

Rogers, Brian, and Kai F. Wehmeier. "Tractarian First-Order Logic:
Identity and the N-Operator." *The Review of Symbolic Logic* 5, no. 4
(2012): 538--573.

- **DOI:** [10.1017/S1755020312000032](https://doi.org/10.1017/S1755020312000032)
- **Cambridge Core:** <https://www.cambridge.org/core/journals/review-of-symbolic-logic/article/abs/tractarian-firstorder-logic-identity-and-the-noperator/500C8C420D172A776C815A229A7601A6>
- **Venue note:** published in RSL, our target journal.

### Wehmeier 2004 (the identity/exclusive-interpretation paper)

Wehmeier, Kai F. "Wittgensteinian Predicate Logic." *Notre Dame Journal
of Formal Logic* 45, no. 1 (2004): 1--11.

- **DOI:** [10.1305/ndjfl/1094155275](https://doi.org/10.1305/ndjfl/1094155275)
- **Project Euclid:** <https://projecteuclid.org/journals/notre-dame-journal-of-formal-logic/volume-45/issue-1/Wittgensteinian-Predicate-Logic/10.1305/ndjfl/1094155275.full>

All locators (title, authors, volume/issue, pages, year, DOI) verified
against the publisher pages (Cambridge Core, Project Euclid) on
2026-07-13.

## Author

Kai F. Wehmeier is Professor of Logic and Philosophy of Science at the
University of California, Irvine. Brian Rogers was his co-author on the
2012 RSL paper.

## Key Claims

### Wehmeier 2004 -- Wittgensteinian Predicate Logic

Develops a first-order predicate logic on Wittgenstein's convention that
**identity of object is identity of sign and difference of object is
difference of sign** -- the exact / exclusive ("Wittgensteinian")
interpretation, in which distinct variables are required to denote
distinct objects, dispensing with a primitive identity predicate.
Building on Hintikka's demonstration that predicate logic can be set up
this way, Wehmeier shows it can be done "nicely," giving a perspicuous
cut-free sequent calculus and a Hilbert-type calculus, and proves
**soundness and completeness** for these systems. This paper concerns the
identity side, not the N-operator.

### Rogers & Wehmeier 2012 -- Tractarian First-Order Logic

Addresses Wittgenstein's two notational proposals: (1) identity expressed
by identity of the sign rather than a sign for identity, and (2) the
single operator **N** as the sole logical primitive. Against prior claims
in the literature, they prove that both proposals can be realized --
severally and jointly -- in **expressively complete** first-order
systems, and give **sound and complete tableau calculi**: one based on
the modern notion of logical truth (truth in all structures) and others
capturing the Tractarian notion (truth in all structures over one fixed
universe of a given cardinality). Identity is handled by the exclusive
convention (identity of object = identity of sign).

## Relation to Our Work

Complementary, not competing. Rogers & Wehmeier build a proof-theoretic
**logic** in which N is the sole primitive and settle its completeness on
paper (tableau calculi). We instead fix a propositional and quantifier
development and **mechanize the N-operator's expressive reach** within it:
the finite-domain reduction of the quantifiers (TLP 5.52,
`forall_as_NOpFO` / `exists_as_NOpFO`), the infinite-domain obstruction
(`no_finite_NOp_for_forall`, the Geach--Soames critique as a theorem), and
iterated-generation completeness (`nGen_complete`, TLP 6). Their
completeness result is about a consequence relation for a Tractarian
logic; ours is about the semantic-equivalence closure of the elementaries
under iterated N. Neither work treats identity by the exclusive
convention, so their identity results have no direct analogue in our
development. Engaged in Related Work (formal reconstructions) and in the
N-operator section (5.5).
