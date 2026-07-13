# Citation audit — tractatus-ontology.9

Legacy-grammar adaptations (this thread predates the anvil install): the entry
point is `paper.tex` (not `main.tex`); the bibliography is a hand-rolled
`thebibliography` environment inside `paper.tex` (no `refs.bib`), so the
resolution check is `\cite` key → `\bibitem` key. Claim-support ground truth is
`tractatus-ontology.9/references/*.md` and `tractatus-ontology.9/literature.md`
(the thread's citation notes; there is no `<thread>/refs/` dir). No
`\input`/`\include` children exist — `paper.tex` is a single-file paper.

## Resolution

21 unique `\cite` keys enumerated from `paper.tex`; 21 `\bibitem` entries in the
`thebibliography` block. `comm -3` of the sorted key sets is empty: **every
cite key resolves to a bibitem, and every bibitem is cited** (no orphans).
The final pdflatex pass reports zero undefined citations and the rendered text
contains no `??`.

## Claim-support spot-check

| Key | Resolved | Surrounding claim (abridged) | Verdict | Notes |
|---|---|---|---|---|
| wittgenstein1921 | yes | Primary text; TLP quotations (e.g. TLP 1 "the world is everything that is the case") | unverified — source not on disk | Primary source; quoted TLP wording is the standard Ogden translation. Author responsible off-disk. |
| wittgenstein1929 | yes | In "Some Remarks on Logical Form" Wittgenstein retreats from independence via color-exclusion (paper.tex:779–790) | unverified — source not on disk | Standard reading of the 1929 paper; no note file on disk. |
| lokhorst1988 | yes | "most comprehensive prior formal reconstruction, covering ontology, semantics, and propositional attitudes in a set-theoretic framework" (paper.tex:1541–1547) | supports | references/lokhorst.md: set-theoretic reconstruction unifying ontology, semantics, philosophy of mind; Erkenntnis 29(1):35–75. |
| weiss2017 | yes | "50-page reconstruction ... tautology-hood is Π¹₁-complete for countable domains" (paper.tex:1548–1552) | supports | references/weiss.md + literature.md: RSL 10(1):1–50 (50 pages), Π¹₁-completeness claim confirmed in notes. |
| miller1995 | yes | "Tractarian semantics for predicate logic independent of the metaphysics of logical atomism" (paper.tex:1553–1558) | supports | references/miller.md: exactly this thesis (three purposes; rebuts Fogelin). |
| fogelin1987 | yes | "initiates the modern debate over ... expressive completeness" (paper.tex:1575–1577) | partial | No dedicated note file; supported indirectly by references/miller.md ("Fogelin had argued that the Tractarian system is expressively incomplete") and geach/soames notes. |
| geach1981 | yes | "the N-operator cannot ground quantification over infinite domains, since it is a finitary operation" (paper.tex:1577–1579) | supports | references/geach.md key claim 1 states precisely this. |
| soames1983 | yes | "the claim that all of logic reduces to truth-functional operations ... is undermined when the domain is infinite" (paper.tex:1580–1583) | supports | references/soames.md key claim 1 states precisely this (Phil. Review 92(4):573–589). |
| carruthers1989 | yes | "sympathetic reconstruction of Tractarian semantics"; "book-length treatment" (paper.tex:1584–1586, 1556–1558) | unverified — source not on disk | No note file; miller.md/literature.md do not cover Carruthers. |
| stokhof2008 | yes | "reads the Tractatus as a proto-formal semantics ... saying/showing arises from the universalism of the framework" (paper.tex:1559–1564) | supports | references/stokhof.md + literature.md: unacknowledged-ancestor thesis; saying/showing-from-universalism claim confirmed. |
| spinney2022 | yes | "examines the relation between logical form and logical space" (paper.tex:1564–1569) | supports | literature.md entry, Synthese 200: article 16, DOI Crossref-verified 2026-07-12. |
| lampert2025 | yes | "classical undecidability proofs do not refute early Wittgenstein on his own terms ... purely logical refutation" (paper.tex:1587–1593) | supports | literature.md entry, HPL 2025, DOI Crossref-verified 2026-07-12. |
| tarski1986 | yes | "Tarski's criterion of logicality: invariance under permutations of the domain" (paper.tex:1353–1356) | supports | literature.md entry: "What are logical notions?" (ed. Corcoran), HPL 7(2):143–154, Crossref-verified. |
| sher1991 | yes | overgeneration objection to permutation invariance (paper.tex:1364) | supports | literature.md: Sher, The Bounds of Logic, MIT Press; overgeneration parallel stated. |
| bonnay2008 | yes | same context as sher1991 | supports | literature.md: BSL 14(1):29–68, DOI Crossref-verified. |
| benzmuller2017 | yes | "used Isabelle to formalize ontological arguments and modal logic ... shallow semantic embeddings" (paper.tex:1604–1611) | supports | references/proof_assistants_philosophy.md §2 documents the HOL-embedding programme. |
| fitelson2007 | yes | "pioneer computational metaphysics, using automated reasoners to verify theorems in abstract-object theory" (paper.tex:1612–1614) | supports | references/proof_assistants_philosophy.md §1.1: PROVER9, object theory, founding paper. |
| scherf2025 | yes | "machine-checked axiomatization of Advaita Vedānta in Lean 4 (69 axioms, 40+ theorems)" (paper.tex:1615–1619) | supports | references/proof_assistants_philosophy.md §3.1: Lean 4, 69 axioms, 40+ theorems — numbers match exactly. |
| corfield2020 | yes | "sustained case for homotopy type theory as a foundation for philosophical reasoning" (paper.tex:1620–1623) | supports | references/proof_assistants_philosophy.md §6.1: Modal Homotopy Type Theory, OUP 2020. |
| moura2021 | yes | Lean 4 system citation (paper.tex:256, 375) | unverified — source not on disk | Standard tool citation (de Moura & Ullrich, CADE-28); no note file. |
| harmonic2026 | yes | "Aristotle automated theorem prover from Harmonic" produced proofs from our sorried statements (paper.tex:1876–1884) | supports | literature.md Tools entry: projects c15df233/212b28eb, 2026-07-12, statements unchanged, standard axioms — matches the paper's Acknowledgments. |

**Totals**: 21/21 resolved; 16 supports, 1 partial, 4 unverified (sources not on
disk), 0 does-not-support.

The repository URL in the abstract footnote
(`https://github.com/rjwalters/tractatus`) matches the worktree's `origin`
remote (`git@github.com:rjwalters/tractatus.git`).
