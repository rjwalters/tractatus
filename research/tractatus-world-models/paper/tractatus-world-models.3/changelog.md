# Changelog — tractatus-world-models.3

Revision of `tractatus-world-models.2` against ALL critic siblings at N=2:
`.2.review/` (generic /44 rubric: 35/44, `advance: false`, 2 critical flags),
`.2.audit/` (1 critical flag + non-critical notes), `.2.numeric/` (advisory, pass,
no findings). No venue overlay was scored (no `venue` key in `.anvil.json`; migration
note F6), so every review-origin entry below is `generic`.

**Artifact repair performed outside the paper dir (critical path):** the per-valuation
Horn realizability lemma `horn_valuation_realizable_iff` was added to
`proofs/TractatusOntologyHorn.lean` (statement and proof by Claude, mirroring
`exclusion_realizable_iff`; kernel-checked, axiom-free per `#print axioms`, no `sorry`).
`lake build`: 0 errors, 0 warnings, exactly the 9 documented `#eval` info lines.
Module counts moved 174→212 lines, 8→9 declarations (four-module totals 63→64
declarations, 1,026→1,064 lines); `CLAUDE.md`'s Structure block was updated to match.

| Source | Note | Resolution |
|---|---|---|
| tractatus-world-models.2.review (generic, critical-flag `theorem_artifact_mismatch`) + .2.audit (critical-flag) | Thm `thm:horn-boundary` printed a per-valuation realizability boundary but cited `horn_realizable_iff`, which proves the *global* biconditional; no per-valuation Horn declaration existed in the artifact | Took fix option (b): added `horn_valuation_realizable_iff` to `proofs/TractatusOntologyHorn.lean` (kernel-checked, axiom-free) and re-pointed the theorem's Lean cross-reference to it; added one sentence after the theorem stating the global form and citing `horn_realizable_iff`; Appendix index row updated and a new `(global Horn boundary)` row added; intro item (C4) now advertises both forms |
| tractatus-world-models.2.review (generic, critical-flag `render_gate_overfull_boxes`) + .2.audit (note) | 6 overfull hboxes over 5pt (worst 121.5pt at the §5 `colorModel` area; 75.3pt Appendix module path; 73.2pt near Def 2.3; +3 more) | Zeroed ALL overfull boxes: `\emergencystretch=3em` in the preamble (resolves the five prose/theorem boxes, incl. the 121.5pt `lem:top` and 73.2pt Def 2.3 lines); Appendix module path moved to its own centered line (was 75.3pt); widest theorem-index row (`lem:top`, two long identifiers) split across two table lines (was +2.4pt). Final log: 0 overfull hboxes (threshold: any), 0 errors, 0 warnings, 0 undefined refs/cites |
| tractatus-world-models.2.review (generic, major) + .2.audit (note) + .2.numeric context | "The kernel-checked proof is nine lines" vs actual 6 tactic lines of `exclusion_not_horn` | Reworded to "six lines" |
| tractatus-world-models.2.review (generic, major) | Figure 1 caption "refinement-incomparable" overstates Thm `thm:exclusion-not-horn` (every model refines into the free model, so the tiers are comparable one way) | Caption now reads "not refinement-equivalent", matching the figure artwork and the theorem; the same overstatement in Remark `rem:horn1951` ("incomparable regions") reworded to "no nontrivial exclusion model is refinement-equivalent to any Horn model" |
| tractatus-world-models.2.review (generic, major) | No resolvable artifact locator (only "the tractatus repository"; `companion2026` is `@unpublished`) | Added `https://github.com/rjwalters/tractatus` in §1 (formalization paragraph), Appendix A, and the `companion2026` bib note |
| tractatus-world-models.2.review (generic, minor) + .2.audit (note) | Hacker direct quote "collapsed over its inability to solve one problem" carries no page number; source not on disk to verify | Rephrased to indirect quotation (no quotation marks, no invented locator): "on his telling, Wittgenstein's first philosophy collapsed over its inability to solve this one problem --- colour exclusion" |
| tractatus-world-models.2.review (generic, minor) + .2.audit (note) | TLP 3.42 quotation wording ("...but...") may not match the cited Pears–McGuinness translation ("...nevertheless..."); source not on disk | Paraphrased (quotation marks removed): "a proposition, though it determines only a single place in logical space, must already have the whole of logical space given with it", cited to `wittgenstein1921` |
| tractatus-world-models.2.review (generic, minor) + .2.audit (note) | Unused bib entries `lokhorst1988`, `spinney2022`, `weiss2017` | All three now cited: Lokhorst 1988 + Weiss 2017 in §7.5's formal-reconstruction-precedent sentence; Spinney 2022 in a §4 footnote on logical form and logical space (venue precedent). 17/17 bib entries now cited |
| tractatus-world-models.2.review (generic, minor) | `evans2014` folds the arXiv id into the `journal` field | Converted to `@misc` with `eprint`/`archivePrefix` + `note` |
| tractatus-world-models.2.review (generic, nit) | `\date` carries "Draft v2" marker | Dropped; now `\date{July 2026}` |
| .2.audit (verified-clean row: "63 declarations") | Declaration/line counts must track the post-fix artifact | Abstract and §1 updated 63→64 declarations; §1 line count updated to the exact 1,064 (was "~1,000" for 1,026); `CLAUDE.md` per-module Horn line updated (212 lines, 9 decls). Note: the thread `BRIEF.md` still says 63 (it predates the lemma; left untouched as reviser input) |
| (self, citation hygiene, same pass as the bib work) | plain.bst lowercases proper nouns inside `{\emph{...}}` groups (rendered "wittgenstein's tractatus", "god's") in ramsey1923, lokhorst1988, spinney2022, weiss2017, benzmuller2014, companion2026 | Case-protected with brace groups (`{W}ittgenstein`, `{{\emph{Tractatus}}}`, `{G}od's`) |
| tractatus-world-models.2.review (generic, nit, procedural) | Render gate ran on `main.pdf` vs command doc's `paper.pdf`; multi-pass log triple-counts boxes | No paper change (upstream friction F13/F14, already recorded) |
| .2.numeric (tool_evidence) | 42 numbers, 0 arithmetic claims, 0 findings, pass | Nothing to address |

Deliberate non-resolutions: none — every blocker/major/minor was addressed; the only
declined-adjacent item is BRIEF.md's stale "63 declarations" (input document, out of
reviser scope; flagged above and in the session report).

## Verification

- Lean: full `lake build` clean (0 errors, 0 warnings, exactly 9 `#eval` info lines);
  `#print axioms Tractatus.horn_valuation_realizable_iff` → depends on **no** axioms.
- LaTeX: `pdflatex → bibtex → pdflatex ×2` (+1 stabilization pass, see below) from
  inside the version dir: 10 pages, **0 overfull hboxes**, 0 errors, 0 warnings,
  0 undefined references/citations. Aux files cleaned; no PDF committed (pub-audit
  produces it).
- Convergence note: with the resolved citations reflowing several page breaks, the
  contract's two post-`bibtex` passes end with a benign "Labels may have changed"
  rerun hint; a third post-`bibtex` pass fully stabilizes (recorded as migration
  friction F15).
