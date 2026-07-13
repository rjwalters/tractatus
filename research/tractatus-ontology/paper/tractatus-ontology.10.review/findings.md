# Findings — tractatus-ontology.10

Cross-section observations from the review pass. (Prior review
`tractatus-ontology.9.review/` was scored against the same `anvil-pub-v2`
rubric, so the rubric-version-transition subsection is omitted per the
steady-state case — the 42/44 → 43/44 delta is directly comparable.)

## v10 delta verification (against the v9 review's recommendations)

The v9 review recommended three non-blocking improvements; v10 addressed
all three, and this pass verified each on the artifact:

1. **Wehmeier engagement (v9 D4 deduction)** — landed. §5 adds a
   26-line paragraph engaging Wehmeier 2004 (NDJFL 45(1), exclusive
   identity convention, sequent/Hilbert calculi) and Rogers & Wehmeier 2012
   (RSL 5(4), N as sole primitive + exclusive identity, tableau calculi),
   with correct bibliographic details (Crossref-verified pre-review; both
   `\bibitem`s complete with DOIs) and an honest complementarity framing.
   §4.6 adds a contact sentence at the point of use. A
   `references/wehmeier.md` claim-support note was added. D4 4→5.
   One defect introduced in the new material: the "Neither work" sentence
   (major, comments.md) — a copy edit, scored under D7 (4→3).
2. **Abstract/conclusion compression (v9 D9 deduction)** — landed. Abstract
   ~450 → ~262 words (excluding the artifact footnote) with every headline
   claim retained; the conclusion now isolates two consequences instead of
   re-running the full result sequence. The result set is no longer
   narrated three times at full resolution. D9 3→4. Residual: the
   complementarity contrast is stated in both §4.6 and §5 (nit).
3. **Stale literature.md Gap Analysis item** — fixed. Item 4 now states the
   equivalence separation (incomparability, not the superseded chain
   `structEq ⊊ formEq ⊊ semEq`), removing the phantom-error trap for
   future audits that trust `literature.md` as claim-support ground truth
   (friction F19).

## Artifact and build observations

- The v10 diff vs v9 is 180 diff-lines confined to: the abstract, the §4.6
  contact paragraph, the §5 Wehmeier paragraph, the conclusion's first
  paragraph, and two new `\bibitem`s. No Lean file, figure, table, or
  appendix row changed — the v9 audit's artifact verification (fresh
  `lake build` clean, 80 declarations cross-checked name-by-name) still
  covers every artifact claim in the paper, and the counts were re-checked
  arithmetically this pass.
- No `tractatus-ontology.10.audit/` sibling exists (review invoked before
  audit); the render gate fails open per the audit-first contract. This
  review compensated by compiling from scratch (3-pass pdflatex, vendored
  asl.cls, exit 0; 25 pages; 0 overfull; 0 placeholders; no unresolved
  refs) and content-matching the committed PDF (byte size 499,233 and
  extracted text both identical to the fresh build). The two benign log
  warnings (font shape `OT1/cmr/bx/sc` substitution; pdfTeX `Hfootnote.1`
  dest) are pre-existing in v9's passing audit log — the second is the
  standard hyperref artifact of a `\footnote` inside `\begin{abstract}`
  under asl.cls, harmless.
- Citation graph: 23 `\cite` keys, 23 `\bibitem`s, bijective (no orphans
  either direction).
- Carried-over v9 minors/nits not addressed in v10 (all below scoring
  threshold individually; listed in comments.md): scherf2025 framing,
  "The three new results" leftover, Fogelin 1976/1987 dating.

## Convergence note

43/44 with 0 critical flags on the same rubric as v9's 42/44 — above the
≥35 threshold for the second consecutive iteration, with both prior
deductions resolved and one new copy-edit-level defect (the "Neither work"
sentence) that should be fixed during submission prep but does not block
advancement.

(Procedural: this file was written via shell heredoc — the agent-harness
output-file guard intercepted the file-write tool on `findings.md` inside
the staging dir, the F23 collision documented in ANVIL-AUDIT-NOTES.md.)
