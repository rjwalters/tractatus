# Literature Review: Proof Assistants and Philosophy

**Compiled:** 2026-04-14
**Purpose:** Prior art landscape for a paper formalizing Wittgenstein's *Tractatus Logico-Philosophicus* in Lean 4.

---

## 1. Computational Metaphysics with Automated Reasoners

### 1.1 Fitelson & Zalta -- Steps Toward a Computational Metaphysics (2007)

- **Citation:** Fitelson, B. & Zalta, E.N. "Steps Toward a Computational Metaphysics." *Journal of Philosophical Logic*, 36(2), 227--247, 2007.
- **URL:** https://link.springer.com/article/10.1007/s10992-006-9038-7
- **Approach:** Implements Zalta's axiomatic theory of abstract objects in PROVER9 (successor to OTTER), a first-order automated reasoning system. Represents a fragment of second-order object theory in first-order syntax.
- **Key claims:** Demonstrates that automated theorem provers can discover proofs of metaphysical theorems (e.g., every possible world is maximal). Establishes the paradigm of "computational metaphysics" -- using automated reasoning to explore formal metaphysical theories.
- **Relevance:** Founding paper of the computational metaphysics programme. Uses automated (not interactive) theorem proving, and targets abstract-object theory rather than Tractarian ontology. First-order logic only.

### 1.2 Oppenheimer, Alama & Zalta -- Automating Leibniz's Theory of Concepts (2015)

- **Citation:** Oppenheimer, P.E., Alama, J. & Zalta, E.N. "Automating Leibniz's Theory of Concepts." *Proceedings of the 25th International Conference on Automated Deduction (CADE 25)*, 2015.
- **URL:** https://philarchive.org/rec/OPPALT
- **Approach:** Reconstructs Leibniz's concept algebra within Zalta's object theory, then deploys automated theorem provers and finite model builders to derive theorems, including the fundamental theorem of Leibniz's theory.
- **Key claims:** Shows that automated reasoning tools can verify and extend historical philosophical theories. Bridges analytic philosophy and computational methods.
- **Relevance:** Demonstrates formalization of a specific philosopher's system (Leibniz) using computational tools. First-order automated reasoning; no interactive proof assistant or type theory.

### 1.3 Oppenheimer & Zalta -- A Computationally-Discovered Simplification of the Ontological Argument

- **Citation:** Oppenheimer, P.E. & Zalta, E.N. "A Computationally-Discovered Simplification of the Ontological Argument." *Australasian Journal of Philosophy*, 89(2), 333--349.
- **URL:** https://mally.stanford.edu/Papers/ontological-computational.pdf
- **Approach:** Represents the ontological argument's premises in PROVER9 syntax; the automated reasoner discovers a simpler valid argument from a single non-logical premise.
- **Key claims:** Computation can discover novel philosophical results, not merely verify known ones.
- **Relevance:** Pioneering example of machine-discovered philosophical insights. Uses automated reasoning, not proof assistants.

---

## 2. Benzmuller et al. -- Higher-Order Modal Logic Embeddings in Proof Assistants

### 2.1 Benzmuller & Woltzenlogel-Paleo -- Godel's God in Isabelle/HOL (2013)

- **Citation:** Benzmuller, C. & Woltzenlogel Paleo, B. "Godel's God in Isabelle/HOL." *Archive of Formal Proofs*, 2013.
- **URL:** https://www.isa-afp.org/entries/GoedelGod.html
- **Approach:** Formalizes Scott's variant of Godel's ontological proof in quantified modal logic KB (QML KB), modeled as a fragment of classical higher-order logic (HOL) via a shallow semantic embedding, within the Isabelle/HOL proof assistant. Automated gaps filled by Sledgehammer calling LEO-II; consistency checked with Nitpick.
- **Key claims:** Godel's 1970 variant is inconsistent; Scott's variant is consistent but implies modal collapse and monotheism; the argument works already in modal logic KB.
- **Relevance:** **Closest methodological precedent for proof-assistant-based philosophical formalization.** Demonstrates the shallow-embedding technique for non-classical logics in HOL. However, targets a specific argument (ontological proof), not a comprehensive philosophical ontology or system.

### 2.2 Fuenmayor & Benzmuller -- Computational Hermeneutics (2019--2020)

- **Citation:** Fuenmayor, D. & Benzmuller, C. "Computational Hermeneutics: An Integrated Approach for the Logical Analysis of Natural-Language Arguments." In *Handbook of Formal Argumentation, Volume 2*, Springer, 2021.
- **URL:** https://link.springer.com/chapter/10.1007/978-981-13-7791-4_9
- **Approach:** Uses interactive-automated proof assistants (Isabelle/HOL) to iteratively formalize natural-language philosophical arguments, achieving "reflective equilibrium" through cycles of formalization, verification, and revision. Applied to E.J. Lowe's modal ontological argument.
- **Key claims:** Proof assistants enable a new hermeneutic methodology for philosophical argument analysis, reducing testing time by orders of magnitude. Inspired by Davidson's radical interpretation.
- **Relevance:** Directly addresses the methodology of formalizing philosophical arguments in proof assistants. Focus is on argument analysis rather than ontological system-building.

### 2.3 Benzmuller -- Universal (Meta-)Logical Reasoning (2019)

- **Citation:** Benzmuller, C. "Universal (Meta-)Logical Reasoning: Recent Successes." *Science of Computer Programming*, 172, 48--62, 2019.
- **URL:** https://www.sciencedirect.com/science/article/pii/S0167642318301461
- **Approach:** Classical HOL as a unifying meta-logic in which various non-classical logics (modal, many-valued, deontic, etc.) are shallowly embedded. Off-the-shelf ITPs and ATPs for HOL then reason within the embedded logics.
- **Key claims:** A single meta-logical framework suffices for embedding and combining diverse logics. Demonstrated through philosophical, mathematical, and AI applications.
- **Relevance:** Provides the theoretical foundation for using HOL-based proof assistants to reason about non-classical logics relevant to philosophy. Our Lean 4 work uses dependent type theory directly rather than the embedding approach.

### 2.4 Benzmuller et al. -- LogiKEy: Deontic Logics and Ethical Reasoning (2020)

- **Citation:** Benzmuller, C. et al. "Designing Normative Theories for Ethical and Legal Reasoning: LogiKEy Framework, Methodology, and Tool Support." *Artificial Intelligence*, 287, 103348, 2020.
- **URL:** https://arxiv.org/abs/1903.10187
- **Approach:** Isabelle/HOL-based workbench for formalizing and experimenting with deontic logics, their combinations, and normative theories for ethical and legal reasoning.
- **Key claims:** HOL embedding approach enables flexible experimentation with ethical frameworks. Applied to deontic paradoxes and normative theory design.
- **Relevance:** Extends proof-assistant philosophy formalization to ethics and normative reasoning. Uses Isabelle/HOL embedding method throughout.

---

## 3. Philosophy Formalized in Lean 4 and Isabelle/HOL

### 3.1 Scherf -- The Formal Logic of Advaita Vedanta (2025)

- **Citation:** Scherf, M. "The Formal Logic of Advaita Vedanta: A Complete Axiomatization and Consistency Proof." PhilPapers, 2025.
- **URL:** https://github.com/matthew-scherf/Advaita
- **Approach:** First-order axiomatization of Advaita Vedanta metaphysics, formalized and machine-verified in **Lean 4**. 69 primitive axioms across 10 modules, covering the identity of Atman and Brahman, three levels of reality, superimposition theory, and the three-state analysis. Four basic sorts: objects, levels, time, events. Consistency established via Lean's type-checker.
- **Key claims:** First formal axiomatization of a non-Western philosophical system in a proof assistant. Proves 40+ theorems including the central identity Brahman = Atman and a master theorem synthesizing all major doctrines. Demonstrates that Advaita's non-dual metaphysics is logically coherent.
- **Relevance:** **Most directly comparable prior work.** Same proof assistant (Lean 4), same ambition (formalizing a comprehensive philosophical system). However, targets Vedantic metaphysics, not analytic/early-modern Western philosophy. Uses first-order axiomatization encoded in Lean rather than exploiting dependent type theory's native expressiveness.

### 3.2 Scherf -- Uncarved Block: Formal Axiomatization of Daoism (2025)

- **Citation:** Scherf, M. "Uncarved Block: Formal Machine Verified Axiomatisation of Daoism." GitHub, 2025.
- **URL:** https://github.com/matthew-scherf/Uncarved-Block
- **Approach:** 20 axioms in **Isabelle/HOL 2025** formalizing classical Daoist philosophy (Daodejing). Organized as core metaphysics (10 axioms) plus three extensions: spontaneity (3), original nature (3), and emptiness (4).
- **Key claims:** Proves 13 major theorems, culminating in "Complete_Daoist_NonDuality" master theorem. Zero failed goals -- full internal consistency.
- **Relevance:** Another philosophical system formalized in a proof assistant (Isabelle, not Lean). Confirms the emerging research programme of formalizing non-Western metaphysics computationally.

---

## 4. Formal Ontology in Proof Assistants

### 4.1 On the Role of Automated Proof-Assistants in the Formalization of Upper Ontologies (2021)

- **Citation:** "On the Role of Automated Proof-Assistants in the Formalization of Upper Ontologies." *CEUR Workshop Proceedings*, Vol. 2969 (FOUST Workshop), 2021.
- **URL:** https://ceur-ws.org/Vol-2969/paper55-FOUST.pdf
- **Approach:** Uses **Isabelle/HOL** to formalize a simplified version of the UFO-A ontology of endurants. Verifies and corrects the original axiomatization, optimizes the specification theory.
- **Key claims:** Proof assistants can identify and correct gaps in upper ontology axiomatizations (e.g., found missing axioms about ultimate bearers, characterized inherence as a Noetherian relation). Reduced axiom count while maintaining full interpretation.
- **Relevance:** Demonstrates that proof assistants strengthen formal ontology development. Methodological parallel: we similarly use Lean 4 to refine and verify an ontological framework (Tractarian ontology).

### 4.2 Barlatier & Dapoigny -- Dependent Type Theory for Ontologies (2012)

- **Citation:** Barlatier, P. & Dapoigny, R. "A Type-Theoretical Approach for Ontologies: The Case of Roles." *Applied Ontology*, 7(3), 311--356, 2012.
- **URL:** https://journals.sagepub.com/doi/10.3233/AO-2012-0113
- **Approach:** Represents ontologies in a dependently-typed framework using the **Coq** proof assistant. Two-layered language: Calculus of Inductive Constructions as a lower layer, ontological upper layer for type-level semantics.
- **Key claims:** Dependent types can model non-trivial ontological features (generalization hierarchies, identity criteria for roles, context-sensitivity). Demonstrates the expressiveness of type theory for ontological representation.
- **Relevance:** **Key theoretical precursor.** Shows that dependent type theory (the foundation of both Coq and Lean 4) is naturally suited to formal ontology. Our work extends this intuition to a specific philosophical ontology (Wittgenstein's).

### 4.3 Dapoigny & Barlatier -- Modeling Ontological Structures with Type Classes in Coq (2012)

- **Citation:** Dapoigny, R. & Barlatier, P. "Modeling Ontological Structures with Type Classes in Coq." *LNCS*, Springer, 2012.
- **URL:** https://link.springer.com/chapter/10.1007/978-3-642-35786-2_11
- **Approach:** Uses Coq's type classes to model ontological structures, providing formal specification of ontological primitives (classes, relations, properties, meta-properties).
- **Key claims:** Type classes enable modular, extensible ontological modeling in proof assistants.
- **Relevance:** Technical methodology for encoding ontological structures in a dependently-typed proof assistant.

### 4.4 Brucker et al. -- Isabelle/DOF: Document Ontology Framework

- **Citation:** Brucker, A.D., Merig, N. et al. "Isabelle/DOF: Design and Implementation." *LNCS*, Springer, 2019. Also in Archive of Formal Proofs.
- **URL:** https://www.isa-afp.org/entries/Isabelle_DOF.html
- **Approach:** Ontology framework on top of Isabelle allowing formal ontology development and continuous conformity-checking of integrated documents annotated with ontological data.
- **Key claims:** First ontology language supporting machine-checked links between formal and informal parts in an LCF-style interactive theorem proving environment.
- **Relevance:** Tangential -- focuses on document ontologies for software engineering, not philosophical ontology.

---

## 5. Formalization of Historical Philosophical Logic

### 5.1 Aristotle's Assertoric Syllogistic in Isabelle/HOL (2025)

- **Citation:** [Authors TBD]. "A Formalisation of Aristotle's Assertoric Syllogistic in Isabelle/HOL." *Topoi*, 2025.
- **URL:** https://link.springer.com/article/10.1007/s11245-025-10184-6
- **Approach:** Formalizes Aristotle's assertoric syllogistic (based on Robin Smith's SEP article) in **Isabelle/HOL**. Proves three main conversion rules and all deductions (moods) in the three figures.
- **Key claims:** Sledgehammer finds one-line proofs for statements ancient philosophers argued at length. Formal proofs and automation enhance understanding and facilitate metatheoretical explorations.
- **Relevance:** Demonstrates proof-assistant formalization of a canonical philosophical logical system. Aristotle's syllogistic is historical logic rather than ontology, but the project shares our motivation: bringing machine-checked rigor to philosophical foundations.

### 5.2 Schlichtkrull -- Formalization of Logic in Isabelle (PhD Thesis)

- **Citation:** Schlichtkrull, A. "Formalization of Logic in the Isabelle Proof Assistant." PhD Thesis, Technical University of Denmark, Matryoshka Project.
- **URL:** https://matryoshka-project.github.io/pubs/schlichtkrull_phd_thesis.pdf
- **Approach:** Formalizes various logical calculi (first-order logic, resolution, etc.) within Isabelle.
- **Key claims:** Systematic formalization of logical metatheory in a proof assistant.
- **Relevance:** Background methodology for formalizing logical systems in proof assistants, though focused on mathematical logic rather than philosophical ontology.

---

## 6. Homotopy Type Theory and Philosophy

### 6.1 Corfield -- Modal Homotopy Type Theory: The Prospect of a New Logic for Philosophy (2020)

- **Citation:** Corfield, D. *Modal Homotopy Type Theory: The Prospect of a New Logic for Philosophy.* Oxford University Press, 2020. ISBN 978-0-19-885340-4.
- **URL:** https://global.oup.com/academic/product/modal-homotopy-type-theory-9780198853404
- **Approach:** Book-length argument that homotopy type theory (HoTT), extended with modalities, provides a new foundational language for philosophy comparable to the revolution of predicate logic. Covers applications to language, metaphysics, and mathematics.
- **Key claims:** HoTT treats identity in a philosophically rich way (identity = equivalence via univalence). Many perceived limits of formalization stem from limits of first-order logic and set theory, not formalization per se. Modal HoTT offers expressive resources for distinctions between objects/events, intrinsic structure, and modality as general variation.
- **Relevance:** **Major theoretical influence.** Argues that type theory is philosophically superior to first-order logic for formal philosophy. Our work validates this thesis by showing that dependent type theory (in Lean 4) naturally captures Tractarian ontological distinctions that resist first-order formalization.

### 6.2 Identity in HoTT (Philosophical Analysis)

- **Citation:** Various authors. "Identity in Homotopy Type Theory, Part I: The Justification of Path Induction." *PhilSci Archive*, 2014.
- **URL:** https://philsci-archive.pitt.edu/11079/
- **Approach:** Philosophical investigation of the conceptual status of identity in HoTT, examining path induction and the rich groupoid structure arising from intensional identity types.
- **Key claims:** HoTT's treatment of identity has genuine philosophical (not merely technical) significance.
- **Relevance:** Connects type-theoretic identity to philosophical questions about identity and individuation -- themes central to the Tractatus's ontology of objects.

### 6.3 Lis -- HoTT-RO v2: A Mathematical Instrument for Relational Ontology (2026)

- **Citation:** Lis, W. "HoTT-RO v2: A Mathematical Instrument for Relational Ontology." *PhilArchive*, 2026.
- **URL:** https://philarchive.org/rec/LISHVA
- **Approach:** Extends HoTT (MLTT + Univalence Axiom) with the Axiom of Flat Mutuality for relational ontology. Defines primitive objects, axioms, inference rules, and 12 derived definitions spanning relational configuration, consciousness capacity, and contextuality.
- **Key claims:** Produces a testable prediction (cuttlefish metacognitive behavior at ~0.836). Acknowledges formal limitations: Relational Potential resists formalization without circularity.
- **Relevance:** Demonstrates extending type theory with novel axioms for philosophical ontology. However, uses HoTT rather than plain dependent type theory, and targets relational/process ontology rather than Tractarian logical atomism.

---

## 7. Wittgenstein and Formal Semantics (Non-Computational)

### 7.1 Stokhof -- The Architecture of Meaning (2008)

- **Citation:** Stokhof, M. "The Architecture of Meaning: Wittgenstein's Tractatus and Formal Semantics." In *Wittgenstein's Enduring Arguments*, ed. Levy & Zamuner, 2008.
- **URL:** https://stokhof.org/wp-content/uploads/2017/06/stokhof_amwtfs.pdf
- **Approach:** Scholarly analysis comparing the Tractatus's picture theory with modern formal semantics (Montague, Davidson, Cresswell, Lewis). Identifies Wittgenstein as a forerunner of formal semantics despite not being acknowledged as such.
- **Key claims:** Wittgenstein's approach features "universalism" (account of meaning in general) and "intensional referentialism" (intensional ontology of possible situations from a substance of objects, combined with extensional truth-functional semantics).
- **Relevance:** Provides the philosophical ground truth for what a formalization of Tractarian ontology should capture. Not itself a computational formalization.

### 7.2 Wittgenstein and Formal Semantics: Truth-Conditions and Compositionality (2021)

- **Citation:** [Author]. "Wittgenstein and Formal Semantics: A Case Study on the Tractarian Notions of Truth-Conditions and Compositionality." *History and Philosophy of Logic*, 43(1), 2022.
- **URL:** https://www.tandfonline.com/doi/abs/10.1080/01445340.2021.1907139
- **Approach:** Scholarly analysis of how Tractarian truth-conditions and compositionality relate to modern formal-semantic notions.
- **Relevance:** Background literature on the philosophical content we formalize, but not a computational formalization.

---

## 8. Autoformalization and the Frontier

### 8.1 LLM-Assisted Autoformalization (2024--2025)

- **Key works:** Multiple papers at NeurIPS 2025, ICLR 2025, and ACL 2025 on translating natural-language mathematics into formal proof-assistant syntax (Lean, Isabelle) using LLMs.
- **Key challenge:** Lack of paired informal-formal corpora; current methods focus overwhelmingly on mathematics, not philosophy.
- **Relevance:** Future direction: LLM-assisted autoformalization of philosophical texts could accelerate projects like ours. Currently no work applies autoformalization to philosophical ontology or to the Tractatus specifically.

---

## 9. Assessment: Does Any Prior Work Formalize the Tractatus in a Proof Assistant?

**No.** After comprehensive search of:
- PhilPapers and PhilArchive
- arXiv (cs.LO, math.LO, cs.AI)
- Archive of Formal Proofs (Isabelle)
- Lean 4 Mathlib and community projects
- CPP and ITP conference proceedings
- Google Scholar and Semantic Scholar

**No prior work formalizes any part of Wittgenstein's *Tractatus Logico-Philosophicus* in any proof assistant (Lean, Coq, Isabelle, Agda, or otherwise).** The Tractatus has been extensively studied in the formal semantics literature (Stokhof 2008; the 2021 *History and Philosophy of Logic* paper), and its logical structure has been analyzed philosophically (SEP entries on Wittgenstein's logical atomism), but these analyses remain on paper. No machine-checked formalization exists.

The closest work in adjacent areas:
- **Benzmuller et al.** formalize specific philosophical *arguments* (ontological proofs) in Isabelle/HOL using modal logic embeddings, but do not formalize philosophical *ontologies* or *systems*.
- **Scherf (2025)** formalizes complete philosophical *systems* (Advaita Vedanta, Daoism) in Lean 4 / Isabelle, but targets non-Western traditions with very different ontological commitments.
- **Barlatier & Dapoigny (2012)** use dependent type theory in Coq for formal ontology, but target applied ontology (roles, part-whole relations) rather than philosophical ontology.
- **Corfield (2020)** argues that HoTT is a better logic for philosophy, but provides no machine-checked formalizations.

---

## 10. Assessment: The Gap Our Paper Fills

Our paper -- formalizing the ontology of Wittgenstein's *Tractatus* in Lean 4 -- fills a unique gap at the intersection of several research lines:

1. **First machine-checked formalization of Tractarian ontology.** No prior work brings any part of the Tractatus into a proof assistant. The philosophical content (objects, facts, states of affairs, logical space, the picture theory) has never been subjected to machine-checked verification.

2. **First formalization of a canonical Western philosophical ontology in dependent type theory.** Benzmuller's work uses HOL embeddings of modal logic; Zalta/Fitelson use first-order automated provers. Scherf's Lean 4 work targets non-Western systems. Barlatier/Dapoigny use Coq for applied ontology. No one has used dependent type theory's native expressiveness -- dependent types, inductive families, universe polymorphism -- to formalize a major Western philosophical ontological framework.

3. **Exploiting the structural affinity between type theory and Tractarian ontology.** The Tractatus's ontology features:
   - Objects with essential combinatorial possibilities (cf. dependent types)
   - States of affairs as structured configurations of objects (cf. dependent product/sum types)
   - Facts as obtaining states of affairs (cf. propositions-as-types)
   - Logical space as the totality of possible states of affairs (cf. type-theoretic universes)

   This structural affinity has been noted informally (Corfield 2020 gestures at type theory's philosophical potential) but never cashed out in a concrete formalization. Our paper demonstrates that dependent type theory is not merely adequate but *naturally suited* to Tractarian ontology.

4. **Bridge between the Benzmuller "computational philosophy" programme and the type-theoretic formalization tradition.** Benzmuller et al. show that proof assistants illuminate philosophical arguments; our work extends this to philosophical *ontologies*. Scherf shows that complete metaphysical systems can be formalized; our work brings this approach to the Western analytic tradition and to the most influential work of early analytic philosophy.

5. **Methodology contribution.** We demonstrate a methodology for formalizing philosophical texts that is:
   - Rooted in a specific proof assistant (Lean 4) with an active ecosystem
   - Based on dependent type theory rather than first-order or higher-order classical logic
   - Applicable to ontological (not merely logical) content
   - Capable of revealing structural insights invisible to paper-and-pencil analysis

---

## References (Alphabetical)

- Barlatier, P. & Dapoigny, R. (2012). "A Type-Theoretical Approach for Ontologies: The Case of Roles." *Applied Ontology*, 7(3), 311--356.
- Benzmuller, C. (2019). "Universal (Meta-)Logical Reasoning: Recent Successes." *Science of Computer Programming*, 172, 48--62.
- Benzmuller, C. et al. (2020). "Designing Normative Theories for Ethical and Legal Reasoning: LogiKEy Framework, Methodology, and Tool Support." *Artificial Intelligence*, 287, 103348.
- Benzmuller, C. & Woltzenlogel Paleo, B. (2013). "Godel's God in Isabelle/HOL." *Archive of Formal Proofs*.
- Benzmuller, C. & Woltzenlogel Paleo, B. (2014). "Automating Godel's Ontological Proof of God's Existence with Higher-order Automated Theorem Provers." *ECAI 2014*, 93--98.
- Brucker, A.D. et al. (2019). "Isabelle/DOF: Design and Implementation." *LNCS*, Springer.
- Corfield, D. (2020). *Modal Homotopy Type Theory: The Prospect of a New Logic for Philosophy.* Oxford University Press.
- Dapoigny, R. & Barlatier, P. (2012). "Modeling Ontological Structures with Type Classes in Coq." *LNCS*, Springer.
- Fitelson, B. & Zalta, E.N. (2007). "Steps Toward a Computational Metaphysics." *Journal of Philosophical Logic*, 36(2), 227--247.
- Fuenmayor, D. & Benzmuller, C. (2021). "Computational Hermeneutics: An Integrated Approach for the Logical Analysis of Natural-Language Arguments." In *Handbook of Formal Argumentation, Volume 2*, Springer.
- [Authors]. (2021). "On the Role of Automated Proof-Assistants in the Formalization of Upper Ontologies." *CEUR Workshop Proceedings*, Vol. 2969.
- Lis, W. (2026). "HoTT-RO v2: A Mathematical Instrument for Relational Ontology." *PhilArchive*.
- Oppenheimer, P.E., Alama, J. & Zalta, E.N. (2015). "Automating Leibniz's Theory of Concepts." *CADE 25*.
- Oppenheimer, P.E. & Zalta, E.N. "A Computationally-Discovered Simplification of the Ontological Argument." *Australasian Journal of Philosophy*, 89(2), 333--349.
- Scherf, M. (2025). "The Formal Logic of Advaita Vedanta: A Complete Axiomatization and Consistency Proof." *PhilPapers*.
- Scherf, M. (2025). "Uncarved Block: Formal Machine Verified Axiomatisation of Daoism." GitHub.
- Schlichtkrull, A. "Formalization of Logic in the Isabelle Proof Assistant." PhD Thesis, Technical University of Denmark.
- Stokhof, M. (2008). "The Architecture of Meaning: Wittgenstein's Tractatus and Formal Semantics." In *Wittgenstein's Enduring Arguments*, ed. Levy & Zamuner.
- [Author]. (2022). "Wittgenstein and Formal Semantics: A Case Study on the Tractarian Notions of Truth-Conditions and Compositionality." *History and Philosophy of Logic*, 43(1).
- [Authors]. (2025). "A Formalisation of Aristotle's Assertoric Syllogistic in Isabelle/HOL." *Topoi*.
