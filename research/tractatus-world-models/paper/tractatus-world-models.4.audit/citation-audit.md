# Citation audit — tractatus-world-models.4

Auditor: pub-audit (claude-fable-5), 2026-07-13. First run under anvil v0.8.0.

Scope: `main.tex` is a single-file paper (no `\input`/`\include` children — verified by grep;
the only `\include`-like token is the `\includegraphics` for Fig. 1), so the cite enumeration
is over `main.tex` alone. **23 cite commands, 17 unique keys.** All 17 keys resolve against
`refs.bib`, and the bib contains no uncited entries (cited set == bib set, exact). `bibtex`
completed with 0 errors, 0 warnings (see `compile-log.txt`).

Claim-support: the thread root has **no `refs/` directory** (verified: `research/
tractatus-world-models/refs/` does not exist), so per the audit contract every citation whose
source lives off-disk is marked `unverified — source not on disk`, not fabricated as verified.
The one exception is `companion2026`, whose source of truth is **in this repository**
(`research/tractatus-ontology/paper/tractatus-ontology.9/paper.tex` + `proofs/`) and was
verified directly.

| Key | Resolved | Surrounding claim | Verdict | Notes |
|---|---|---|---|---|
| companion2026 (x4) | yes | Base formalization of worlds/propositions/evaluation inherited from the companion paper; spectrum/Horn/equivalence modules originate there; companion title cited in bib | **supports** | Verified in-repo this pass: companion title at `tractatus-ontology.9/paper.tex:139-140` is exactly "What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*" — the v4 title fix landed (the v2/v3 audits' invented-title flag is closed). The bib note's "(commit 0852c5b)" matches the paper's pin; `WorldModel`/`Proposition`/`evalM` exist in the base `proofs/` modules |
| wittgenstein1921 (x2) | yes | Direct quotes of TLP 1.21 and 2.062 (§1); TLP 3.42 paraphrase (§4) | unverified — source not on disk | Quoted wording consistent with the Pears–McGuinness translation the bib entry names; no on-disk source to check against |
| wittgenstein1929 (x2) | yes | SRLF concedes attributions of degree exclude one another beyond truth-functional representation (§1, §5) | unverified — source not on disk | Claim is the standard reading of the 1929 paper; consistent with the paper's own framing |
| ramsey1923 | yes | Ramsey's review already pressed the problem of color ascriptions (§1) | unverified — source not on disk | Standard attribution |
| hacker1986 | yes | Hacker's verdict: first philosophy collapsed over colour exclusion (§1) | unverified — source not on disk | Indirect quotation (no invented locator — the v2 concern stays fixed) |
| moss2012 | yes | Moss argues the problem is solvable by re-atomization with vector-valued magnitudes (§1, §6.2) | unverified — source not on disk | Title of the cited paper ("Solving the Color Incompatibility Problem") matches the attributed position |
| button2017 | yes | Button: atomism tolerates exclusion iff logical space has cardinality a power of two (§6.1) | unverified — source not on disk | Consistent with the cited title ("Exclusion Problems and the Cardinality of Logical Space") |
| skyrms1981 | yes | Skyrms's Tractarian nominalism precedes Armstrong's combinatorialism (§6.3) | unverified — source not on disk | |
| armstrong1989 | yes | Armstrong adopts the independence thesis; worlds as recombinations (§6.3) | unverified — source not on disk | |
| spinney2022 | yes | Recent Synthese treatment of logical form/space; places reduce to forms of objects and names (§4 fn.) | unverified — source not on disk | DOI present in bib |
| evans2014 | yes | Cathoristic logic takes incompatibility as primitive (§6.4) | unverified — source not on disk | arXiv id 1411.7158 present |
| lokhorst1988 | yes | Closest precedent: axiomatic reconstruction of ontology/philosophy of mind (§6.5) | unverified — source not on disk | |
| weiss2017 | yes | Closest precedent: systematic study of the book's logic (§6.5) | unverified — source not on disk | RSL venue + DOI present |
| benzmuller2014 | yes | Methodological precedent: mechanized Gödel ontological argument (§6.5) | unverified — source not on disk | |
| mckinsey1943 | yes | McKinsey's study of the clause class preceding Horn (Rem. 6.6) | unverified — source not on disk | Volume/pages plausible for JSL 8 |
| horn1951 | yes | Horn 1951 isolates closure of Horn classes under intersections of models (Rem. 6.6) | unverified — source not on disk | The nullary-instance reading (empty intersection = all-true assignment) is the paper's own gloss and is mathematically correct |
| moura2021 | yes | Lean 4 system citation (§1) | unverified — source not on disk | Standard CADE-28 reference; fields complete |

## Summary

- Unresolved keys: **0** (17/17 resolve; cited set == bib set)
- Claim-support failures: **0**
- Supports (verified on disk): **1** (`companion2026` — the one v4 changed; the fix is correct)
- Unverified (source not on disk): **16** — non-critical per contract; author responsible for
  off-disk verification (these have been stable and repeatedly spot-checked across v2/v3 audits)
