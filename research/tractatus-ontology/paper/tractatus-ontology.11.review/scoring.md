# Scoring — tractatus-ontology.11 (anvil-pub-v2, /44)

Body under review: `tractatus-ontology.11/paper.tex` (single-file document; no
`\input`/`\include` children — resolver returns `paper.tex` alone).
Legacy-grammar note (F13): the entry point is `paper.tex`, not `main.tex`.
Prior review: `tractatus-ontology.10.review/` (43/44, ADVANCE, anvil-pub-v2 —
same rubric, so no rubric-transition subsection is emitted in findings.md).
This is a fresh scoring pass; the v10 score was not carried over.

| # | Dimension | Weight | Score | Justification |
|---|---|---|---|---|
| 1 | Rigor of method / argument | 6 | 6 | The method — an inductively defined object language, a parameterized `WorldModel`, and a typed `expresses` bridge — is fully machine-checked and honestly scoped: "The design choices are deliberate modeling decisions, not exegetical claims about Wittgenstein's intent" (§2). The definitional character of the headline collapse is confronted directly (Remark 4.6), and the finite/infinite dichotomy remark hedges exactly as far as the theorems license. The v11 diff is three prose-level edits; the proof base is unchanged and was re-verified by this pass's artifact gate (fresh `lake build`, clean). |
| 2 | Evidence sufficiency | 6 | 6 | Every mathematical claim is backed by a kernel-verified proof: "80 formally verified results across six files" (§8), 0 sorries, 1 inert axiom, with separation witnesses at full generality. The per-file arithmetic in the abstract, §1 footnote, and Appendix A is exact (1,345+284+239+142+138+148 = 2,296; 45+9+11+9+3+3 = 80; appendix rows 1–45 / 46–80), and — new this pass — the external artifact was rebuilt from scratch under the #663 gate: `lake build` in this worktree exited 0 with the expected `#eval` demo lines and no errors or warnings (see `_artifact_verify.json`). |
| 3 | Clarity of contribution | 5 | 5 | The central claim is displayed as a one-sentence quote in §1 — "nontrivial propositions cannot express world-independent truths" (§1) — followed by eight numbered contributions, each one sentence with a forward section pointer. The compressed abstract (~262 words excluding the artifact footnote) names every headline result, so the contributions remain extractable from abstract + introduction alone. |
| 4 | Related-work positioning | 5 | 5 | §5 engages the Wehmeier line substantively and accurately — Rogers & Wehmeier, "published in this journal, take the further step of combining the exclusive treatment of identity with the $N$-operator as sole logical primitive" (§5) — on an honest complementarity framing, now stated once (§5) with §4.6 reduced to its technical contrast plus a pointer. The v10 residual is fixed: scherf2025 is now "the most directly comparable attempt" (§5), no longer giving an archive-only manuscript "work"-level billing. Lokhorst, Weiss, Miller, Stokhof, Spinney, and Lampert & Nakano remain engaged on their merits. No litsearch sibling exists; scored against the legacy baseline per the rubric (no deduction for perspective absence). |
| 5 | Reproducibility | 5 | 5 | Pinned toolchain, public repository, step-by-step build appendix, and CI: "the build status of the public sources is continuously verified" (App. A). This pass executed the paper's own reproduction claim end-to-end via the #663 artifact gate — the declared `lake build` (pinned elan v4.26.0 toolchain, repo root) completed cleanly in a fresh worktree after `lake exe cache get`, exactly as Appendix A instructs. The paper build was also reproduced: convergence-loop pdflatex, 25 pages, byte-stable `.aux` fixpoint. |
| 6 | Figure & table quality | 4 | 4 | Both TikZ figures are self-contained at caption level — "The free model admits all $2^n$ truth-value assignments as worlds" (Fig. 1 caption) and Fig. 2's "each region contains a machine-checked witness" (Fig. 2 caption) — rendered black-only per ASL/RSL constraints with pattern/line-style encodings. The two-part appendix table has meaningful headers (Lean name / TLP / File / Class) and booktabs alignment; no instance of chartjunk or an axis-label defect found. Figures are untouched in v11. |
| 7 | Prose & structural quality | 4 | 4 | Both v10 D7 deductions are resolved on the artifact: the mis-drafted §5 sentence now reads "Our formalization does not treat identity by the exclusive convention, so their identity results have no direct analogue here" (§5) — the subject is unambiguously this paper's development — and the §4.3 version-diff leftover is version-agnostic: "The three results of this subsection carry the same axiom footprint" (§4.3). Flow is intact, hedging calibrated, and the render pass is clean (0 overfull boxes above 5.0pt, 0 placeholders, no `??` refs — see `_gate.json`). Subject voice tier inactive (no BRIEF/subjects declared). |
| 8 | Citation hygiene | 5 | 5 | All 23 `\cite` keys resolve to `\bibitem` entries (23/23, no orphans — re-checked this pass) and entries are complete with author/title/venue/year (DOIs on the recent additions); prose claims about sources are accurate where checkable — e.g. Lokhorst "provides the most comprehensive prior formal reconstruction, covering ontology, semantics, and propositional attitudes in a set-theoretic framework" (§5) matches the on-disk `references/` notes. The lone carried-over nit (Fogelin first-edition 1976 dating at first prose mention; declined in `changelog.md` as out of scope) is a dating-convention preference, not a hygiene defect — the `\bibitem` already notes the first edition. No instance of an unsourced non-trivial claim found. |
| 9 | Rhetorical economy | 4 | 4 | The v10 residual duplication is gone: the complementarity framing appears once, in §5, and §4.6 now closes with the technical contrast and a pointer, "closure of the elementaries under iterated $N$ within a fixed development (see Section~\ref{sec:related})" (§4.6). The abstract stays compressed (~262 words) and the conclusion isolates consequences rather than re-narrating: "Two consequences of that decomposition are worth isolating" (§8). The core argument is extractable well inside 90 seconds; no instance of a non-load-bearing paragraph found. |
| | **Total** | **44** | **44** | |

## Pre-scoring tool evidence

- **Render gate (step 4b)**: no `tractatus-ontology.11.audit/` sibling exists,
  so the audit-first gate fails open per the contract. Compensation: this
  review used the reviser's fresh compile (anvil v0.8.0 convergence-loop
  contract: rerun-warning fixpoint reached at pass 2, confirmatory pass 3
  `.aux` byte-identical; 5-pass cap not approached) and ran
  `anvil.lib.render_gate.gate(...)` with explicit paths (legacy `paper.pdf` /
  `paper.tex` naming — the main.pdf-naming fix is moot on this thread):
  PASS — 25 pages (no cap), 0 overfull boxes at the 5.0pt threshold,
  0 placeholder patterns, compile exit 0. `_gate.json` in this sidecar.
  The overfull dedupe (#668) had nothing to collapse: the concatenated
  3-pass `compile-log.txt` contains 0 overfull entries.
- **Numeric consistency (step 4c, advisory)**: PASS — 551 numbers extracted,
  0 arithmetic claims in the detector's claim grammar, 0 findings. Run IN
  PLACE against the version dir with the new `--body paper.tex` override
  (#670/#679; friction F22 retired) with `--write-review`; the
  `tractatus-ontology.11.numeric/_review.json` sidecar was written into the
  portfolio and the result records `body_path: "paper.tex"` (the documented
  portfolio-relative form for a body inside the version dir). Manual
  cross-check of the paper's own arithmetic: 1,345+284+239+142+138+148 =
  2,296 lines; 45+9+11+9+3+3 = 80 declarations; appendix rows 1–45 / 46–80.
- **Evidence check (step 5b)**: run in place with `--body paper.tex`
  (#670/#679); see comments.md procedural note.
- **Artifact verification (step 4f, #663)**: `artifact_verify` declared in
  `tractatus-ontology/.anvil.json` (`lake build`, absolute elan toolchain
  path, cwd = repo root, timeout 1800s); executed via
  `anvil.skills.pub.lib.artifact_verify.verify(...)`; result in
  `_artifact_verify.json` and folded into the step 6 critical-flag judgment.
