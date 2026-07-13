# Martin Stokhof -- Tractatus and Formal Semantics

## Citations

### Primary paper

Stokhof, Martin. "The Architecture of Meaning: Wittgenstein's Tractatus and Formal Semantics."
In *Wittgenstein's Enduring Arguments*, edited by David Levy and Eduardo Zamuner, 211--244.
London: Routledge, 2008.

- Chapter DOI: [10.4324/9780203882573-19](https://doi.org/10.4324/9780203882573-19)
- Book DOI: [10.4324/9780203882573](https://doi.org/10.4324/9780203882573)
- Open-access preprint (author's site): <https://stokhof.org/wp-content/uploads/2017/06/stokhof_amwtfs.pdf>
- PhilArchive: <https://philarchive.org/rec/STOTAO>

### Secondary paper (later Wittgenstein as counterpoint)

Stokhof, Martin. "Formal Semantics and Wittgenstein: An Alternative?"
*The Monist* 96, no. 2 (2013): 205--231.

- DOI: [10.5840/monist20139629](https://doi.org/10.5840/monist20139629)
- Open-access preprint (author's site): <https://stokhof.org/wp-content/uploads/2020/10/stokhof_fswa.pdf>
- PhilArchive: <https://philarchive.org/rec/STOFSA-2>

### Author affiliation

Martin Stokhof is Professor Emeritus at the University of Amsterdam, affiliated with
the Institute for Logic, Language and Computation (ILLC) and the Department of Philosophy.
Author page: <https://stokhof.org/papers/>

---

## Key Claims and Approach

### "The Architecture of Meaning" (2008) -- core arguments

1. **The Tractatus as unacknowledged ancestor of formal semantics.**
   Formal semantics (Montague, Davidson, Cresswell, Lewis) acknowledges Frege, Tarski, and
   Carnap as intellectual forebears, but conspicuously ignores Wittgenstein. Stokhof argues this
   is "an oversight": the Tractatus established fundamental principles and philosophical
   assumptions that shaped formal semantics, transmitted partly through Carnap's linguistic
   re-analysis of possible states of affairs into "state descriptions and ranges" in *Meaning and
   Necessity* (1947), which Carnap explicitly credited to Wittgenstein.

2. **Three structural features shared with formal semantics.**
   Stokhof isolates three characteristics of the Tractatus's "architecture of meaning" and traces
   each into formal semantics:

   - **Universalism.** The TLP aims to characterize "language as such" -- all logically possible
     forms of symbolic expression -- not any particular language. Formal semantics frameworks
     (Montague's Universal Grammar, Davidson's truth-conditional semantics) similarly claim to
     capture meaning *in general*, embedding universalistic assumptions in the framework itself,
     even when the applications are language-specific. This universalism entails that the
     framework's own principles cannot be stated within the framework -- Wittgenstein's
     "ineffability" -- and Stokhof argues formal semantics faces an analogous circularity when
     it uses formal metalanguages to specify the semantics of natural languages whose
     understanding is presupposed.

   - **Intensional referentialism.** The TLP ontology is intensional (possible states of affairs,
     logical space) while the semantics is extensional (truth-functional operations). Formal
     semantics inherits this split: Montague and Cresswell use full intensional type theory
     (possible worlds), while Davidson insists on extensional truth-conditions -- but both sides
     presuppose a referential base linking names to objects. Stokhof notes that Thomason's
     introduction to Montague's collected papers explicitly connects the TLP framework to
     possible-worlds semantics: "Montague's framework is a generalisation of the Tractatus
     framework. The type of entities and the type of truth values are retained as basic semantic
     units, but another type is added, that of possible worlds."

   - **Compositionality.** In the TLP, compositionality is not merely a methodological
     convenience but a constitutive principle of the realm of the meaningful: elementary
     sentences are purely compositional combinations of names, and truth-functional logic
     secures compositionality for complex sentences. Formal semantics imports compositionality
     from the formal languages of logic, justified by the need to give a finite account of an
     infinite language (learnability, creativity). Both share a view of language as "an infinite
     object" with "non-contextual, determinate meaning."

3. **The saying/showing distinction and ineffability in formal semantics.**
   The TLP's saying/showing distinction arises from the absolute distinction between the
   contingent (= the meaningful) and the necessary. Logical form, being necessary, "cannot be
   said" but is "shown" by every meaningful expression (TLP 4.121). Stokhof argues that
   formal semantics faces an analogous problem: if the framework claims universality (all
   meaning can be described within it), then the principles of the framework itself cannot be
   stated within it without circularity. The object-language/metalanguage distinction
   (Tarski) appears to solve this but actually "flies in the face of universalism" -- Montague
   himself claimed "no important theoretical difference between natural languages and the
   artificial languages of logicians." Stokhof concludes that "formal semanticists and
   Wittgenstein (of TLP-days) are in the same boat, the difference being that the latter is
   aware of the consequences of his universalism and embraces ineffability wholeheartedly,
   whereas the former in general seem oblivious to the conundrum."

4. **Carnap as transmission channel.**
   Wittgenstein's concept of "state of affairs" (Sachverhalt) was linguistified by Carnap into
   "state descriptions," which seeded possible-worlds semantics. When Kripke and others
   re-ontologized state descriptions into possible worlds with accessibility relations, the link
   to the TLP was broken, and Frege/Carnap/Tarski replaced Wittgenstein in the genealogy.

5. **Absolute vs. relative interpretation.**
   Both the TLP and Davidson aim for "absolute" interpretation (not parametrized by models),
   whereas Montague works with "relative" interpretation (parametrized by possible worlds).
   Stokhof notes this gives reference a different semantic role in each case -- a point directly
   relevant to how one formalizes "the world" in a semantic framework.

### "Formal Semantics and Wittgenstein: An Alternative?" (2013)

This companion paper takes the later Wittgenstein as its starting point and asks whether
his views on meaning-as-use can serve as an alternative to formal semantics. Stokhof
argues:

- Formal semantics rests on three questionable "Standard Model" features: methodological
  individualism (compositionality as constraint on individual competence), the grammatical
  form / logical form distinction, and methodological psychologism (reliance on native
  speaker intuitions).
- These lead to meaning being constructed as a homogeneous, idealized entity, when in
  fact meaning is heterogeneous (individual and social, internal and external, natural and
  cultural).
- Wittgenstein's later work does *not* provide a rival theory but suggests a different
  self-image for formal semantics: formal semantics as a "perspicuous representation" --
  a systematic description of certain referential aspects of meaning within particular language
  games, rather than a universal theory of meaning as such.
- The Tractatus is not "wrong as an account of how things actually are" but "wrong as a
  general theory" -- its universalism is what the later Wittgenstein rejects.

---

## Relevance to Our Work

We are formalizing the Tractatus in Lean 4 with machine-checked proofs, parameterized world
models, and an expressibility collapse theorem for the saying/showing distinction. Stokhof's
work is directly relevant in the following ways:

1. **Validation of the project's premise.** Stokhof demonstrates that the TLP *is* a
   proto-formal semantics -- it has the same structural backbone (compositionality, intensional
   ontology, referential base) as Montague-style model-theoretic semantics. This validates
   our approach of treating the TLP as amenable to rigorous formalization, not merely as
   aphoristic philosophy.

2. **Saying/showing as a formal phenomenon.** Stokhof's analysis shows that the
   saying/showing distinction is not a mystical add-on but a structural consequence of
   universalism: any framework that claims to characterize all meaning "from within" must
   treat its own principles as inexpressible within itself. Our expressibility collapse theorem
   -- showing that propositions about logical form collapse to triviality or unprovability in
   the object language -- is the Lean 4 formalization of exactly this phenomenon. Stokhof
   provides the philosophical justification; we provide the machine-checked proof.

3. **Parameterized world models and the absolute/relative distinction.** Stokhof's
   discussion of "absolute" (TLP, Davidson) vs. "relative" (Montague) interpretation maps
   directly onto our design choice of *parameterized* world models. Our formalization
   allows both: a fixed "substance" of objects (TLP's absolute interpretation) combined with
   parametric variation over possible configurations (states of affairs). This is precisely the
   "intensional referentialism" that Stokhof identifies as the TLP's distinctive contribution.

4. **Compositionality as constitutive principle.** Stokhof emphasizes that TLP
   compositionality is not merely a constraint on grammar but a constitutive feature of
   "the realm of the meaningful." Our Lean 4 formalization enforces this: the type system
   itself guarantees that only compositionally well-formed expressions can be constructed,
   making compositionality a theorem of the framework rather than an assumption.

5. **The Carnap transmission channel and possible-worlds semantics.** Stokhof traces
   the historical path from TLP states of affairs through Carnap's state descriptions to
   Kripke semantics. Our formalization can be seen as reconnecting this lineage: going back
   to the TLP's original ontological framework (states of affairs, logical space, substance)
   and providing the formal precision that Wittgenstein himself could not, given the
   logical tools available in 1921.

6. **Potential criticism from the later Wittgenstein.** Stokhof's second paper warns that
   the later Wittgenstein would reject any formalization that claims to capture the *essence*
   of meaning. Our work should be framed carefully: we formalize the *Tractarian system*
   as a specific formal framework (a "perspicuous representation" in Stokhof's terms), not
   as a universal theory of meaning. The expressibility collapse theorem itself demonstrates
   the system's self-aware limitation -- it proves that the system cannot say what it shows.
