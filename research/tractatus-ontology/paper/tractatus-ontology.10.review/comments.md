# Comments — tractatus-ontology.10

Line-level feedback keyed to `paper.tex` sections, grouped by severity.

## major

- **§5 Related Work, Wehmeier paragraph** — "Neither work treats identity by
  the exclusive convention, so their identity results have no direct
  analogue here."
  On the natural reading, "neither work" refers to the two items just
  contrasted ("Their contribution and ours") or to the two Wehmeier-line
  papers — and both readings make the sentence false or self-contradictory:
  the same paragraph says two sentences earlier that Rogers & Wehmeier
  "take the further step of combining the exclusive treatment of identity
  with the $N$-operator as sole logical primitive," and Wehmeier 2004 is
  introduced as developing predicate logic "on the exclusive (`exact')
  convention." The intended subject is clearly this paper's own development
  (which has no identity apparatus at all). Suggested fix: "Our
  formalization does not treat identity by the exclusive convention, so
  their identity results have no direct analogue here." One-sentence copy
  edit; must land before submission — the misreading sits in the exact
  paragraph added to engage the closest prior work, at their home venue.
  (Scored under D7; the substance of the positioning is accurate, so D4 is
  not deducted.)

## minor

- **§4.6 ↔ §5 (rhetorical economy)** — the §4.6 contact paragraph ("Our
  target here differs from the proof-theoretic treatment ... so the two
  accounts are complementary: their completeness result is about a
  consequence relation for a Tractarian logic, ours ... is about the
  semantic-equivalence closure") and the §5 Wehmeier paragraph ("Their
  contribution and ours are complementary rather than competing: they build
  a proof-theoretic \emph{logic} ... whereas we mechanize the
  $N$-operator's expressive reach") state the same contrast twice in
  similar words. Trim one to a pointer (e.g., end §4.6 with "see
  Section~\ref{sec:related}" after one clause). Costs a few lines, not a
  page; noted as a nit-level residual under D9.
- **§5, proof-assistants paragraph** `related-work` (carried over from v9,
  unaddressed) — scherf2025, an unpublished manuscript whose repository was
  deleted (web.archive snapshot only), is still framed as "the most
  directly comparable work." The comparison is substantively apt (the only
  other machine-checked complete philosophical system in Lean 4), but the
  framing gives an archive-only artifact top billing; consider "the most
  directly comparable attempt" or add a published comparison point.

## nit

- **§4.3 (What Can Be Said, Exactly)** (carried over from v9, unaddressed) —
  "The three new results carry the same axiom footprint as the rest of the
  Aristotle-assisted development": "new" is a version-diff leftover; a fresh
  reader has no baseline. Say "The three results of this subsection."
- **Bibliography, fogelin1987** (carried over from v9, unaddressed) — prose
  credits Fogelin with initiating the expressive-completeness debate; the
  critique first appeared in the 1976 first edition, while the entry cites
  the 1987 second edition (first edition noted parenthetically). Cite as
  Fogelin (1976/1987) at first prose mention.

## procedural notes

- render gate: no `tractatus-ontology.10.audit/` sibling exists, so the
  audit-first gate fails open; this review compiled the paper itself
  (3-pass pdflatex, exit 0) and ran `anvil.lib.render_gate.gate(...)`
  against the committed `paper.pdf` + fresh `.build/paper.log` — PASS
  (25 pages, 0 overfull, 0 placeholders); `_gate.json` in this sidecar.
  Committed PDF content-matches the fresh build (499,233 bytes + identical
  extracted text).
- numeric-consistency: detector run against a scratch copy of `paper.tex`
  named `main.tex` (friction F22: `anvil.lib.numeric_consistency` body
  discovery hard-assumes `<slug>.md`/`main.tex` and has no path override);
  PASS — 551 numbers, 0 claims, 0 findings. The `--write-review`
  `.numeric/_review.json` sidecar was not written into the portfolio (it
  would have carried the scratch path).
- evidence-check: run against the same scratch `main.tex` copy
  (byte-identical to `paper.tex`); all nine quoted spans in scoring.md
  validate (`pass: true`, 9 dimensions checked, 0 findings).
- score_history: not appended — the immutable legacy version dir
  `tractatus-ontology.10/` carries no `_progress.json` (repo `.gitignore`
  also ignores `_progress.json` globally, friction F21); the score record
  lives in this sidecar's `_review.json`/`_summary.md`.
