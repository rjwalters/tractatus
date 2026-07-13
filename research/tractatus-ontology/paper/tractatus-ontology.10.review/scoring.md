# Scoring — tractatus-ontology.10 (anvil-pub-v2, /44)

Body under review: `tractatus-ontology.10/paper.tex` (single-file document; no
`\input`/`\include` children — resolver would return `paper.tex` alone).
Legacy-grammar note (F13): the entry point is `paper.tex`, not `main.tex`.
Prior review: `tractatus-ontology.9.review/` (42/44, ADVANCE, anvil-pub-v2 —
same rubric, so no rubric-transition subsection is emitted in findings.md).
This is a fresh scoring pass; the v9 score was not carried over.

| # | Dimension | Weight | Score | Justification |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 | The method — an inductively defined object language, a parameterized `WorldModel`, and a typed `expresses` bridge — is fully machine-checked and honestly scoped: "The design choices are deliberate modeling decisions, not exegetical claims about Wittgenstein's intent" (§2). The definitional character of the headline collapse is confronted head-on (Remark 4.6) rather than papered over, and the finite/infinite dichotomy remark hedges exactly as far as the theorems license. The v10 diff is prose/bibliography only, so the v9-audited proof base is unchanged. |
| 2 | Evidence sufficiency | 6 | 6 | Every mathematical claim is backed by a kernel-verified proof: "80 formally verified results across six files" (§8), 0 sorries, 1 inert axiom, with separation witnesses at full generality (explicit `a ≠ b` hypotheses). The per-file line/declaration arithmetic in the abstract, §1 footnote, and Appendix A is exact (1,345+284+239+142+138+148 = 2,296; 45+9+11+9+3+3 = 80; appendix rows 1–45 / 46–80), matching the artifact facts verified on this master lineage; no Lean file was touched in v10. |
| 3 | Clarity of contribution | 5 | 5 | The central claim is displayed as a one-sentence quote in §1 — "nontrivial propositions cannot express world-independent truths" (§1) — followed by eight numbered contributions, each one sentence with a forward section pointer. The compressed abstract (~262 words excluding the artifact footnote) still names every headline result, so the contributions remain extractable from abstract + introduction alone. |
| 4 | Related-work positioning | 5 | 5 | The v9 gap is closed: §5 now engages the Wehmeier line substantively and accurately — Rogers & Wehmeier, "published in this journal, take the further step of combining the exclusive treatment of identity with the $N$-operator as sole logical primitive" (§5) — with an honest complementarity framing (their paper-based proof-theoretic completeness vs. this paper's mechanized semantic reach) plus a contact sentence at the point of use in §4.6; both entries carry correct venue/volume/page/DOI details. Lokhorst, Weiss, Miller, Stokhof, Spinney, and Lampert & Nakano remain engaged on their merits; the residual scherf2025 "most directly comparable" framing of an unpublished, deleted-repo manuscript is a carried-over minor (comments.md), not a positioning failure. No litsearch sibling exists; scored against the legacy baseline per the rubric (no deduction for perspective absence). |
| 5 | Reproducibility | 5 | 5 | Pinned toolchain, public repository, step-by-step build appendix, and CI: "the build status of the public sources is continuously verified" (App. A). This review re-ran the paper's own 3-pass pdflatex recipe from scratch (0 errors, 25 pages) and the committed `paper.pdf` content-matches the fresh build (identical byte size 499,233 and identical extracted text); the Lean artifact facts were verified within the last day on this same master lineage. |
| 6 | Figure & table quality | 4 | 4 | Both TikZ figures are self-contained at caption level — "The free model admits all $2^n$ truth-value assignments as worlds" (Fig. 1 caption) plus Fig. 2's witness-labeled incomparability regions — and are rendered black-only per ASL/RSL constraints with pattern/line-style encodings. The two-part appendix table has meaningful headers (Lean name / TLP / File / Class) and booktabs alignment; no instance of chartjunk or an axis-label defect found. Figures are untouched in v10. |
| 7 | Prose & structural quality | 4 | 3 | Flow is intact, hedging calibrated, and the render pass is clean (0 overfull boxes above 5.0pt, 0 placeholders, no `??` refs — see _gate.json), but the new Wehmeier paragraph ends with a mis-drafted sentence: "Neither work treats identity by the exclusive convention, so their identity results have no direct analogue here" (§5) — on its natural reading ("their contribution and ours") this is false for Wehmeier's works, whose exclusive treatment of identity the same paragraph describes two sentences earlier; the intended subject is this paper's own development. A carried-over v9 nit ("The three new results" in §4.3, a version-diff leftover) also remains. Subject voice tier inactive (no BRIEF/subjects declared). |
| 8 | Citation hygiene | 5 | 5 | All 23 `\cite` keys resolve to `\bibitem` entries (23/23, no orphans — checked this pass) and the two new entries (rogers2012, wehmeier2004) are complete with author/title/venue/volume/pages/year/DOI and were Crossref-verified by the pre-review code check; prose claims about sources are accurate where checkable — e.g. Lokhorst "provides the most comprehensive prior formal reconstruction, covering ontology, semantics, and propositional attitudes in a set-theoretic framework" (§5) matches the on-disk notes, and a `references/wehmeier.md` note was added for the new sources. No instance of an unsourced non-trivial claim found. |
| 9 | Rhetorical economy | 4 | 4 | The v9 triple re-narration is fixed: the abstract is compressed to ~262 words (from ~450) with no headline claim lost, and the conclusion no longer re-runs the result sequence — it isolates what matters: "Two consequences of that decomposition are worth isolating" (§8). The core argument is extractable well inside 90 seconds. Residual nit (comments.md): the §4.6 contact sentence and the §5 Wehmeier paragraph state the same complementarity contrast twice in similar words; trimming one to a pointer would save a few lines, below the threshold of a scoring weakness. |
| | **Total** | **44** | **43** | |

## Pre-scoring tool evidence

- **Render gate (step 4b)**: no `tractatus-ontology.10.audit/` sibling exists,
  so the audit-first gate fails open per the contract. Compensation: this
  review compiled the paper itself (3-pass pdflatex with the vendored
  `asl.cls`, run from inside `tractatus-ontology.10/` into `.build/`, exit 0)
  and ran `anvil.lib.render_gate.gate(...)` against the committed `paper.pdf`
  + the fresh `.build/paper.log`: PASS — 25 pages (no cap), 0 overfull boxes
  at the 5.0pt threshold, 0 placeholder patterns, 0 unresolved references.
  `_gate.json` written alongside this file. The committed `paper.pdf`
  content-matches the fresh build (byte size 499,233 and extracted text both
  identical; byte-identity is unreachable with plain pdflatex per F17).
  The two log warnings (font shape `OT1/cmr/bx/sc` substitution, pdfTeX
  `Hfootnote.1` dest) are pre-existing in v9's passing audit log.
- **Numeric consistency (step 4c, advisory)**: PASS — 551 numbers extracted,
  0 arithmetic claims in the detector's claim grammar, 0 findings. Run against
  a scratch copy of `paper.tex` named `main.tex` because the module's body
  discovery hard-assumes `<slug>.md`/`main.tex` (friction F22; the
  `--write-review` `.numeric/` sidecar was not written — it would have carried
  the scratch path). Manual cross-check of the paper's own arithmetic:
  1,345+284+239+142+138+148 = 2,296 lines; 45+9+11+9+3+3 = 80 declarations;
  appendix rows 1–45 / 46–80 match the per-file counts; abstract word count
  ~262 excluding the artifact footnote.
- **Evidence check (step 5b)**: run against the same scratch `main.tex` copy
  (byte-identical to `paper.tex`); see comments.md procedural note.
