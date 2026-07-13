# Line-level comments — tractatus-ontology.9/paper.tex

Grouped by severity. Section keys refer to `paper.tex` headings.

## blocker

None.

## major

- **§5 Related Work / §4.6 "The N-Operator: Finite Success, Infinite
  Failure"** — excerpt: "Our formalization engages the critique directly
  (Section~\ref{sec:noperator}): TLP~5.52 is proved for finite domains".
  The expressive-completeness paragraph covers Fogelin, Geach, Soames,
  Carruthers, and Lampert & Nakano, but not the Wehmeier line: K. F.
  Wehmeier, "Wittgensteinian predicate logic" (Notre Dame Journal of Formal
  Logic 45(1), 2004) and B. Rogers & K. F. Wehmeier, "Tractarian first-order
  logic: identity and the N-operator" (The Review of Symbolic Logic 5(4),
  2012) — the latter published in the target venue and directly concerned
  with whether the N-operator can express first-order logic (with identity,
  under the exclusive reading of variables). It does not threaten this
  paper's novelty (paper-based, no machine checking, no saying/showing
  analysis), but an RSL referee working on the N-operator will expect §4.6
  or §5 to engage it. `related-work` — recommend a `pub-litsearch` re-run to
  resolver-verify these identifiers before citing; this review deliberately
  writes no `.bib`/`\bibitem` entries.

## minor

- **Abstract** — excerpt: "We present a machine-checked reconstruction of
  the semantic core". The abstract runs seven paragraphs (~450 words) and
  enumerates every result; ASL/RSL abstracts are customarily terser. Folding
  paragraphs 4–6 into one "results" paragraph would help the dim-9 economy
  without losing the contribution statement.
- **§7 Conclusion** — excerpt: "It also fixes the sayable exactly: over
  finitely many atoms a world-property is expressible iff it is invariant
  under pointwise-$\iff$ agreement of worlds". This re-narrates the abstract
  and §4.3 nearly verbatim — the third full statement of the same result
  set. Compress to what the results *mean* rather than what they *are*.
- **§5 Related Work, "Proof assistants and philosophy"** — excerpt:
  "Scherf~\cite{scherf2025} provides the most directly comparable work".
  Calling an unpublished manuscript whose repository has been deleted (cited
  via a web.archive snapshot) "the most directly comparable work" is
  honest but fragile: a referee may discount it, and the archived link is
  the only durable trace. Consider demoting the framing ("a recent
  unpublished formalization...") or adding a published comparison point.
- **§2.1 Objects and States of Affairs** — excerpt: "\texttt{TractObject} is
  declared for conceptual completeness but plays no role in the subsequent
  formal development". Fine as disclosed, but consider whether a declaration
  that does no work should appear in the headline "80 results / six files"
  framing at all; a referee hunting for padding will land here first (the
  declaration counts themselves exclude it, which is correct).

## nit

- **Bibliography** — `fogelin1987` cites the 2nd edition (1987) while the
  prose credits Fogelin with *initiating* the debate; the critique first
  appeared in the 1976 first edition. The entry does say "(First edition
  1976.)" — consider citing 1976 pagination or saying "Fogelin (1976/1987)"
  in prose at first mention.
- **§4.3** — excerpt: "The three new results carry the same axiom footprint
  as the rest of the Aristotle-assisted development". "The three new
  results" reads as a leftover from the version-to-version diff; a fresh
  reader has no baseline for "new". Say "The results of this subsection".

## Procedural notes

- render-gate: consumed the audit's committed `paper.pdf` +
  `tractatus-ontology.9.audit/compile-log.txt` (3-pass concatenation;
  overfull dedupe by unique line/amount → 0 unique, matching the expected
  count). `_gate.json` written in this sidecar. PASS.
- numeric-consistency: automated detector run against a scratch copy of
  `paper.tex` renamed `main.tex` (module body-discovery hard-assumes
  `<slug>.md`/`main.tex` — friction F22 in
  `research/tractatus-ontology/paper/ANVIL-AUDIT-NOTES.md`); the
  `.numeric/_review.json` sidecar was NOT written (would have pointed at the
  scratch path). 544 numbers, 0 claims, 0 findings; manual claim-vs-claim
  cross-check of the line/declaration arithmetic also passed.
- evidence-check: run via `anvil.lib.evidence_check`-equivalent verification
  against the same scratch `main.tex` (byte-identical to `paper.tex`); all
  nine scoring quotes matched verbatim under whitespace collapse.
- sidecar: staged via the `python -m anvil.lib.sidecar` CLI shim
  (stage → write → commit), per the non-Python-driver ordering in
  `pub-review.md` step 3.
