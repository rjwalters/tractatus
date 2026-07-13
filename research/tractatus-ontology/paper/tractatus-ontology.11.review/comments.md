# Comments — tractatus-ontology.11

Line-level feedback keyed to `paper.tex` sections, grouped by severity.

## minor

- **Bibliography / §5, fogelin1987** (carried over from v9/v10; declined in
  v11 `changelog.md` as out of the operator-directed polish scope) — prose
  credits Fogelin with initiating the expressive-completeness debate
  ("Fogelin~\cite{fogelin1987} initiates the modern debate"), but the
  critique first appeared in the 1976 first edition while the entry cites
  the 1987 second edition (first edition noted parenthetically in the
  `\bibitem`). Cite as Fogelin (1976/1987) at first prose mention. A
  dating-convention preference, not a support failure; reasonable to fold
  into submission mechanics (#33/#35). Not scored as a deduction — the
  bibliographic record itself is accurate.

## nit

- **§5, proof-assistants paragraph** — with scherf2025 softened to "the most
  directly comparable attempt", the sentence's closing clause still reads
  "demonstrating that complete philosophical systems can be formalized in
  dependent type theory"; for an unpublished, archive-only artifact,
  "suggesting" would be even more precisely calibrated. Below the threshold
  of a scoring weakness; optional.

## procedural notes

- render gate: no `tractatus-ontology.11.audit/` sibling exists, so the
  audit-first gate fails open per the contract; this review ran
  `anvil.lib.render_gate.gate(...)` with explicit paths against the
  reviser's fresh convergence-loop build (fixpoint at pass 2, `.aux`
  byte-identical at confirmatory pass 3) — PASS (25 pages, 0 overfull at
  5.0pt, 0 placeholders); `_gate.json` in this sidecar. The legacy
  `paper.pdf`/`paper.tex` naming required explicit paths as before (the
  0.8.0 `main.pdf`-naming fix is moot on this thread). The #668 overfull
  dedupe had nothing to collapse (0 overfull entries in the concatenated
  3-pass log).
- numeric-consistency: run IN PLACE with the new `--body paper.tex`
  override (#670/#679) plus `--write-review` — PASS (551 numbers, 0 claims,
  0 findings); the `tractatus-ontology.11.numeric/_review.json` sidecar now
  lands in the portfolio (friction F22 retired). The result payload records
  `body_path: "paper.tex"` (bare filename per the documented convention for
  a body inside the version dir); the Review-schema sidecar itself carries
  the path only through finding `evidence_span`s, of which there are none
  on a clean pass.
- evidence-check: run IN PLACE with `--body paper.tex` against the staged
  `scoring.md` — `pass: true`, 9 dimensions checked, 0 findings. No scratch
  copy needed (F22 retired).
- artifact-verify (#663/#665): `tractatus-ontology/.anvil.json` declares
  `lake build` (absolute elan v4.26.0 path, cwd `../../../..` = repo root,
  1800s). `verify(...)` ran it in this fresh worktree (after a
  `lake exe cache get` environment prime, per the paper's own Appendix A
  recipe): exit 0, "Build completed successfully (3068 jobs)", with exactly
  the 9 expected `#eval` info lines (5 in `TractatusOntology.lean`
  L705–709, 4 in `TractatusDecidability.lean` L136/139/142/145) and empty
  stderr. Raw capture in `_artifact_verify.json`; on pass no critical flag
  and no finding is emitted (advisory file only).
- sidecar CLI (#673/#682): `python -m anvil.lib.sidecar`
  cleanup/stage invocations were warning-free this pass (the F20 cosmetic
  `RuntimeWarning` is gone).
- score_history: not appended into the version dir's `_progress.json`
  metadata by this sidecar (the reviser-created
  `tractatus-ontology.11/_progress.json` exists on disk but is
  git-ignored globally, friction F21); the score record lives in this
  sidecar's `_review.json`/`_summary.md`.
