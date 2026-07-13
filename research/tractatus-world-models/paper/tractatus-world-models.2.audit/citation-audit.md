# Citation audit — tractatus-world-models.2

Auditor: pub-audit (claude-fable-5), 2026-07-13.

Scope: all cite commands in `main.tex` (no `\input`/`\include` children — single-file
paper, confirmed by grep). 14 distinct keys cited, 17 entries in `refs.bib`.
Bibliographic data cross-checked against the verified citation ground truth in
`../tractatus-world-models.1/literature.md` (DOIs, volumes, pages). There is no
`<thread>/refs/` directory, so no author-supplied source PDFs are on disk;
claim-support verdicts marked `unverified` could not be checked against primary
sources. The one on-disk source is the Lean proof artifact itself
(`/Volumes/Stripe/tractatus/issue-5/proofs/`), which backs `companion2026` and the
Appendix cross-references (audited separately; see `numerical-audit.md` and
`flags.md`).

## Resolution + claim-support table

| Key | Resolved | Surrounding claim | Verdict | Notes |
|---|---|---|---|---|
| wittgenstein1921 | yes | Block quote of TLP 1.21 and 2.062 (§1); TLP 3.42 quote (§3); 6.3751 excerpt (§1) | partial | 1.21 and 2.062 match the Pears–McGuinness translation exactly (from model knowledge; source not on disk). The §3 quotation of TLP 3.42 reads "...logical space, **but** the whole of logical space..." where P–M has "...logical space: **nevertheless** the whole of logical space...". Wording inside quotation marks should be verified/corrected. Non-critical (source not on disk). |
| wittgenstein1929 | yes | "finally conceded that attributions of degree exclude one another in a way his truth-functional apparatus cannot represent" (§1, §5) | unverified — source not on disk | Consistent with v1 literature.md annotation ("Abandons independence: attributions of degree exclude one another, and the exclusion is not truth-functional") and standard scholarship. Bib data (PAS Suppl. 9, 162–171) matches literature.md. |
| ramsey1923 | yes | "Ramsey's review already pressed the problem of color ascriptions" (§1) | unverified — source not on disk | Consistent with literature.md ("First statement of the problem in print"). Bib data (Mind 32(128), 465–478) matches. |
| hacker1986 | yes | Direct quote: Wittgenstein's first philosophy "collapsed over its inability to solve one problem — colour exclusion" (§1) | unverified — source not on disk | Direct quotation with no page number. literature.md carries the same quote, but the primary source is not on disk. Author should verify wording and add a page reference. |
| moss2012 | yes | "Moss argues the color-incompatibility problem is solvable ... her construction uses vector-valued magnitudes" (§1, §6.2) | unverified — source not on disk | Consistent with literature.md ("constructs elementary propositions (vector-valued, degree-theoretic)"). Bib data incl. DOI 10.1007/s10992-011-9193-3 matches. |
| button2017 | yes | "Button proves that the atomist picture tolerates exclusion problems iff logical space has cardinality a power of two, and reads the result as a reductio ..." (§6.1) | unverified — source not on disk | Consistent with literature.md ("Necessary and sufficient condition ...: logical space has cardinality a power of two"). Bib data incl. DOI 10.1007/s10992-016-9412-z matches. |
| skyrms1981 | yes | "following Skyrms's Tractarian nominalism" (§6.3) | unverified — source not on disk | Consistent with literature.md. Bib data (Phil. Studies 40, 199–206) matches. |
| armstrong1989 | yes | "Armstrong's combinatorial theory of possibility adopts the 'Tractarian thesis of Independence' for wholly distinct states of affairs, with possible worlds as recombinations" (§6.3) | unverified — source not on disk | literature.md says "first-order states of affairs"; the paper says "wholly distinct" (Armstrong's own recombination proviso). Plausible but the quoted phrase 'Tractarian thesis of Independence' should be page-verified by the author. |
| evans2014 | yes | "Evans and Berger's cathoristic logic takes incompatibility rather than negation as the primitive logical relation" (§6.4) | unverified — source not on disk | Consistent with literature.md (arXiv:1411.7158, incompatibility primitive). |
| mckinsey1943 | yes | "McKinsey's study of the clause class" (§5 Remark) | unverified — source not on disk | Consistent with literature.md and standard history of Horn theory. Bib data (JSL 8(3), 61–76) matches. |
| horn1951 | yes | "Horn classes are closed under intersections of models ..., a property isolated by Horn in 1951" (§5 Remark) | unverified — source not on disk | Consistent with literature.md ("Closure of Horn classes under products/intersections"); Horn 1951 is about direct unions/products, and the paper's parenthetical correctly specializes to pointwise intersection of satisfying assignments in the propositional case. Bib data (JSL 16(1), 14–21) matches. |
| benzmuller2014 | yes | "We follow the methodological line of the mechanization of Gödel's ontological argument" (§6.5) | unverified — source not on disk | ECAI 2014, pp. 93–98 — matches the known publication data. Methodology-precedent claim is modest. |
| moura2021 | yes | "formalized in Lean 4 [cite]" (§1) | supports | Standard Lean 4 system citation (CADE-28, LNCS 12699, 625–635). Mechanical. |
| companion2026 | yes | "The base formalization of worlds, propositions, and evaluation is that of our companion paper" (§1, §2, §6.5, Ack.) | supports | Verified on disk: `WorldModel`, `freeModel`, `Proposition`, `evalM` reside in `proofs/TractatusOntology.lean` in this repository, and the four paper modules import/extend them. `@unpublished`, manuscript under review — status accurately described. |

## Unresolved keys

None. All 14 cited keys have matching entries in `refs.bib`; final `bibtex` run
reported 0 errors, 0 warnings (see `compile-log.txt`).

## Unused bib entries (informational)

`lokhorst1988`, `spinney2022`, `weiss2017` are defined in `refs.bib` but never
cited. With `\bibliographystyle{plain}` + bibtex this is harmless (they do not
appear in the rendered bibliography). Carried over from the v1 literature review;
either cite them (Spinney 2022 is the BRIEF's stated venue precedent) or drop them.

## Bibliographic-data cross-check vs v1 ground truth

Every entry with a DOI/volume/page record in `../tractatus-world-models.1/literature.md`
was compared field-by-field: `moss2012`, `button2017`, `spinney2022` (DOIs),
`wittgenstein1929`, `ramsey1923`, `skyrms1981`, `lokhorst1988`, `weiss2017`,
`mckinsey1943`, `horn1951` (volume/issue/pages). All match. No discrepancies.
