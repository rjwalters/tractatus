# Scoring — tractatus-ontology.9 (anvil-pub-v2, /44)

Body under review: `tractatus-ontology.9/paper.tex` (single-file document; no
`\input`/`\include` children — resolver would return `paper.tex` alone).
Legacy-grammar note (F13): the entry point is `paper.tex`, not `main.tex`.

| # | Dimension | Weight | Score | Justification |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 | The method — an inductively defined object language, a parameterized `WorldModel`, and a typed `expresses` bridge — is fully machine-checked and honestly scoped: "The design choices are deliberate modeling decisions, not exegetical claims about Wittgenstein's intent" (§2). The definitional character of the headline collapse is confronted head-on (Remark 4.6, §4.2) rather than papered over, and the finite/infinite dichotomy (Remark 4.11) is hedged exactly as far as the theorem licenses. |
| 2 | Evidence sufficiency | 6 | 6 | Every claim is backed by a kernel-verified proof: "The formalization proves 80 formally verified results across six files" (§7), with 0 sorries, 1 inert axiom, and separation witnesses stated at full generality (explicit `a ≠ b` hypotheses, §4.4). The audit sibling independently re-ran `lake build` (clean, exactly 9 `#eval` lines) and cross-checked all 80 declarations name-by-name; both directions of TLP 5.52 are proved, not asserted. |
| 3 | Clarity of contribution | 5 | 5 | The central claim is displayed as a one-sentence quote in §1 — "nontrivial propositions cannot express world-independent truths" (§1) — followed by eight numbered contributions, each one sentence with a forward section pointer. A reviewer can extract every contribution from the abstract and introduction alone. |
| 4 | Related-work positioning | 5 | 4 | §5 engages the closest prior work on its merits (Lokhorst's overlap acknowledged, Weiss's Π¹₁-completeness credited, Lampert & Nakano 2025 addressed with an explicit neutrality claim), and the novelty claim is hedged: "to our knowledge the first formal rendering of the Geach--Soames objection" (§5). One point off: the N-operator/quantification section does not engage the Wehmeier line (Wehmeier 2004; Rogers & Wehmeier 2012, *RSL* — the target venue) on Tractarian first-order logic, identity, and the N-operator; a likely RSL referee on this topic will expect it (see comments.md, related-work). No litsearch sibling exists; scored against the legacy baseline per the rubric (no deduction for perspective absence). |
| 5 | Reproducibility | 5 | 5 | Pinned toolchain, public repository, an appendix with step-by-step build instructions, and CI: "the build status of the public sources is continuously verified" (App. A). The audit reproduced the build from scratch and content-matched the committed PDF; the artifact URL in the abstract footnote resolves. This meets reproducibility as a hard requirement, not a gesture. |
| 6 | Figure & table quality | 4 | 4 | Both TikZ figures are self-contained at caption level — "The free model admits all $2^n$ truth-value assignments as worlds" (Fig. 1 caption) plus the closing invariant/assumption contrast — and are rendered black-only per ASL/RSL constraints with pattern/line-style (not color) encodings. The two-part appendix table has meaningful headers (Lean name / TLP / File / Class) and booktabs alignment; no instance of chartjunk or an axis-label defect found. |
| 7 | Prose & structural quality | 4 | 4 | Flow is intact (formalization → invariants → assumptions → limits → related work → discussion), tense and voice consistent, and hedging is calibrated where it matters: "The reading this invites should be stated carefully, without overclaiming" (§4.3). Render gate: 0 overfull boxes above 5.0pt across the 3-pass log, 0 placeholder markers, no `??` references (see _gate.json). Subject voice tier inactive (no BRIEF/subjects declared). |
| 8 | Citation hygiene | 5 | 5 | All 21 `\cite` keys resolve to `\bibitem` entries (audit: 21/21, no orphans); entries carry author/title/venue/year with DOIs for the journal articles, and prose claims about sources are accurate where checkable — e.g. Lokhorst "provides the most comprehensive prior formal reconstruction, covering ontology, semantics, and propositional attitudes in a set-theoretic framework" (§5) matches the on-disk notes. The four sources unverified on disk (wittgenstein1921/1929, carruthers1989, moura2021) are canonical primary texts and the standard Lean system paper — acceptable at this stage; no instance of an unsourced non-trivial claim found. |
| 9 | Rhetorical economy | 4 | 3 | The core argument is economical and a busy reviewer gets the contribution in well under 90 seconds, but the results are narrated in full three times: the seven-paragraph (~450-word) abstract, the eight-item contribution list, and a conclusion that re-runs the sequence again — "It also fixes the sayable exactly: over finitely many atoms a world-property is expressible iff it is invariant under pointwise-$\iff$ agreement of worlds" (§7) restates the abstract and §4.3 nearly verbatim. Trimming the abstract and compressing the conclusion would save roughly a page with no loss of argument. |
| | **Total** | **44** | **42** | |

## Pre-scoring tool evidence

- **Render gate (step 4b)**: PASS — 25 pages (no cap), 0 overfull boxes at the
  5.0pt threshold in the 3-pass concatenated `compile-log.txt` (F14-analog
  dedupe: expected unique count 0, observed 0), 0 placeholder patterns in
  `paper.tex`. `_gate.json` written alongside this file. Compile status
  "skipped" — the gate consumed the audit's committed PDF + log per the
  audit-first contract.
- **Numeric consistency (step 4c, advisory)**: PASS — 544 numbers extracted,
  0 arithmetic claims in the detector's claim grammar, 0 findings. Run against
  a scratch copy of `paper.tex` named `main.tex` because the module's body
  discovery hard-assumes `<slug>.md`/`main.tex` (friction F22; the
  `--write-review` `.numeric/` sidecar was not written — it would have
  required renaming inside the immutable version dir). Manual cross-check of
  the paper's own arithmetic: 1,345+284+239+142+138+148 = 2,296 lines;
  45+9+11+9+3+3 = 80 declarations; appendix rows 1–45 / 46–80 match the
  per-file counts.
- **Evidence check (step 5b)**: run against the same scratch `main.tex` copy
  (byte-identical to `paper.tex`); all nine quoted spans validate (see
  comments.md procedural note).
