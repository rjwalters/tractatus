# Literature Review — What Lean Cannot Say

## Positioning

This paper sits at the intersection of three literatures: formal reconstructions of Wittgenstein's *Tractatus*, the philosophy of formal semantics, and proof-assistant-based philosophy. Each has significant prior work, but none combines machine-checked verification with analytical results about the Tractarian system's own limits.

The formal reconstruction literature (Lokhorst, Weiss, Miller) has established that the *Tractatus* can be rigorously formalized as a semantic system. Weiss (2017) is the most technically demanding entry, proving $\Pi^1_1$-completeness results about tautology-hood. However, all prior work is on paper. The proof-assistant-and-philosophy literature (Benzmüller et al.) has formalized ontological arguments and modal logic in Isabelle, but has not touched Tractarian ontology. Our contribution fills the gap: a machine-checked formalization that goes beyond encoding to prove new results about expressibility limits.

The strongest differentiator is the expressibility collapse theorem, which has no direct precedent in the literature. Stokhof (2008) provides the closest philosophical analysis — his argument that saying/showing arises from universalism — but does not formalize it as a theorem.

## Key Related Work

### Formal Reconstructions

- **Lokhorst (1988)**: Most comprehensive prior reconstruction. Set-theoretic framework covering ontology, semantics, propositional attitudes, and doxastic logic. Proves independence, world describability, truth-functionality. Does NOT formalize saying/showing. *Erkenntnis* 29(1): 35–75.

- **Weiss (2017)**: Most technically demanding reconstruction. Analyzes N-operator and form-series, proves tautology is $\Pi^1_1$-complete for countable domains. Reveals tension between structural manifestation and metaphysical neutrality. 50 pages. *Review of Symbolic Logic* 10(1): 1–50.

- **Miller (1995)**: Tractarian semantics for predicate logic, independent of logical-atomism metaphysics. *History and Philosophy of Logic* 16(2): 197–215.

- **Stokhof (2008)**: Traces Tractatus influence on formal semantics via Carnap. Argues saying/showing = consequence of universalism. Philosophical analysis, not formalization. In *Wittgenstein's Enduring Arguments*, Routledge, pp. 211–244.

### Critiques of Tractarian Logic

- **Geach (1981)**: N-operator cannot handle infinite domains (finitary operation). *Analysis* 41(4): 168–171.

- **Soames (1983)**: Tractarian reduction of all logic to truth-functional operations fails for infinite quantification. *Philosophical Review* 92(4): 573–589.

### Proof Assistants and Philosophy

- **Benzmüller & Woltzenlogel Paleo (2017)**: Ontological arguments formalized in Isabelle. *Journal of Applied Logic* 24: 253–265.

- **Blanchette, Böhme & Paulson (2013)**: Automated reasoning in higher-order logic. *Journal of Automated Reasoning* 51(1): 109–128.

- No prior work formalizes Tractarian ontology in any proof assistant.

## Gap Analysis

The existing literature does NOT address:

1. **Machine-checked verification** of Tractarian claims — all prior work is on paper
2. **Parameterized world models** that separate invariants from assumptions — prior work commits to a fixed model (usually the free model)
3. **The expressibility collapse theorem** — the saying/showing distinction formalized as a provable constraint on truth-functional languages
4. **The equivalence hierarchy** (structEq ⊊ formEq ⊊ semEq) with strict separation witnesses — prior work discusses logical form informally
5. **Typed bridge between object and metalanguage** — the `expresses` relation has no precedent

## Search Methodology

- PhilPapers: "Tractatus" + "formal", "Tractatus" + "reconstruction", "Tractatus" + "formalization"
- Google Scholar: "Wittgenstein Tractatus formal semantics", "proof assistant philosophy formalization"
- Cambridge Core (Review of Symbolic Logic archives)
- Springer (Erkenntnis, Journal of Philosophical Logic)
- arXiv cs.LO, math.LO: "Wittgenstein" + "Lean" / "Coq" / "Isabelle"
- ITP and CPP conference proceedings
