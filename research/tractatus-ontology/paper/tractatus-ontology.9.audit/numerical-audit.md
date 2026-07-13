# Numerical audit — tractatus-ontology.9

The paper's quantitative claims are proof-artifact statistics (this thread's
evidence base is the Lean development, per the repo's verify-artifact-claims
norm), plus bibliographic figures. All checks run against `proofs/` on current
master (worktree `feature/anvil-rsl-review`, based at `41ee7f9`).

Scoping note (deliberate, per audit briefing): current master contains four
additional world-model modules (TractatusOntologyHorn/Spectrum/Equiv/Exclusion)
reserved for a follow-up paper. The paper's counts refer to its six covered
files ONLY; the difference is not an error and is not flagged.

## Proof-artifact statistics

| Text claim | Claim sites | Source | Source value | Match | Notes |
|---|---|---|---|---|---|
| 2,296 lines of Lean 4 | abstract (paper.tex:202), intro (:334) | `wc -l` over the six files | 2,296 | YES | Exact. |
| TractatusOntology.lean 1,345 lines | footnote (:336), app:build (:1935) | `wc -l` | 1,345 | YES | |
| TractatusQuantifiers.lean 284 lines | :337, :1936 | `wc -l` | 284 | YES | |
| TractatusNOperator.lean 239 lines | :338, :1937 | `wc -l` | 239 | YES | |
| TractatusCompleteness.lean 142 lines | :339, :1938 | `wc -l` | 142 | YES | |
| TractatusExpressibility.lean 138 lines | :340, :1939 | `wc -l` | 138 | YES | |
| TractatusDecidability.lean 148 lines | :341, :1940 | `wc -l` | 148 | YES | |
| 80 results (45/9/11/9/3/3 per file) | abstract (:202), footnote (:336–342), app:build (:1934–1940), Tables 1–2 (tab:decomposition, tab:decomposition2) | appendix table rows cross-checked against source declarations | 80 rows, numbered 1–80, each name present as a theorem/lemma/def in its claimed file | YES | Three names are namespaced in source (`Proposition.evalBool_correct` in Ontology; `Proposition.disj_evalBool`, `Proposition.literal_evalBool` in Completeness) — table gives the unqualified name, consistent with the table's "locate by exact text search" instruction. Per-file table row counts 45/9/11/9/3/3 match the prose. |
| 0 sorry obligations | abstract (:203), :344, :1926 | `grep -c sorry` over six files | 0 | YES | Single textual hit is a comment (TractatusOntology.lean:71) describing the *earlier* sorried statement; no `sorry` term in any proof. |
| 1 deliberate axiom `silence : True` | abstract (:204), :345, table 2, :1928 | `grep '^axiom'` | exactly one, TractatusOntology.lean:1343 | YES | |
| Toolchain `leanprover/lean4:v4.26.0` | abstract footnote (:211), app:build (:1917) | `lean-toolchain` | leanprover/lean4:v4.26.0 | YES | |
| "build produces zero errors, zero warnings" (app:build :1925) | fresh `lake exe cache get && lake build` from worktree root | Build completed successfully (3068 jobs), 0 error lines, 0 warning lines, exactly 9 `#eval` info lines (5 TractatusOntology + 4 TractatusDecidability — the intentional demos) | — | YES | See compile-log.txt addendum. Holds on current master even with the four extra world-model modules in the build. |
| Aristotle projects c15df233 / 212b28eb, 2026-07-12 (Acknowledgments :1876–1884) | literature.md Tools entry | same IDs/date | YES | |
| Scherf: 69 axioms, 40+ theorems (:1616–1617) | references/proof_assistants_philosophy.md §3.1 | 69 axioms, 40+ theorems | YES | |
| Weiss: 50-page reconstruction (:1548) | references/weiss.md, literature.md | RSL 10(1): 1–50 | YES | |

## Headline-theorem spot-check (6 statements, paper vs. source)

| Theorem | Paper site | Source site | Match |
|---|---|---|---|
| `saying_showing_triviality` | lstlisting paper.tex:943–951 (Thm 4.1 collapse) | TractatusOntology.lean:1220–1225 | YES — listing verbatim incl. proof body; hypotheses identical (no `Nonempty S`, matching the paper's claim that none is needed) |
| `functional_completeness` | lstlisting :663–667 (Thm thm:fc) | TractatusCompleteness.lean:135–137 | YES — `[Fintype S] [DecidableEq S] [Nonempty S]` hypotheses match prose "finite, decidable, and nonempty" |
| `no_finite_NOp_for_forall` | Thm thm:geach-soames prose :1467–1476 | TractatusNOperator.lean:155–163 | YES — `[Infinite D]`, arbitrary finite instance list `d :: ds`, negated equivalence at some world |
| `nGen_complete` | Thm thm:ngen :1504–1511 | TractatusNOperator.lean:216–217 | YES — ∃ q, NGen q ∧ semEq q p |
| `expressible_iff_iff_invariant` | lstlisting :1079–1084 | TractatusExpressibility.lean:75–78 | YES — verbatim; `Nonempty S` present as claimed |
| `totality_not_expressible` | lstlisting :1130–1133 | TractatusExpressibility.lean:129–130 | YES — verbatim; `[Infinite S]` |

## Figures

No `\includegraphics` in paper.tex (0 occurrences); all diagrams are inline
TikZ. Figure source-of-truth check: not applicable — no stale-figure risk.

## LaTeX build & committed-PDF comparison

- 3 pdflatex passes (vendored asl.cls recipe), all exit 0; 25 pages
  (matches expected 25).
- Final pass: zero errors, zero overfull hboxes, zero undefined
  references/citations; no `??` in extracted text. Remaining messages are
  benign: `OT1/cmr/bx/sc` font-shape substitution and a pdfTeX
  `Hfootnote.1` destination note (hyperref + titlepage footnote).
- Committed `paper.pdf` vs fresh `.build/paper.pdf`: identical size
  (497,434 bytes) and identical extracted text; bytes differ ONLY in the
  embedded `/CreationDate`, `/ModDate`, and `/ID` trailer fields
  (pdflatex is not reproducible-by-default across invocation times).
  **Content-identical; the committed PDF is a faithful build of paper.tex.**

**Discrepancies found: none.**
