# Changelog — tractatus-ontology.10 → tractatus-ontology.11

Light polish pass consuming the residual (non-blocking) findings of
`tractatus-ontology.10.review/` (43/44, advance: true, 0 critical flags).
The paper is twice-converged; no substantive rewrites. Legacy grammar
retained (entry point `paper.tex`, inline `thebibliography`, vendored
`asl.cls`, committed `paper.pdf`).

| Source | Note | Resolution |
|---|---|---|
| tractatus-ontology.10.review (generic, major) | §5 "Neither work treats identity by the exclusive convention" sentence false on its natural reading | Already resolved in the v10 source itself (post-review fix, commit `d185c11` / PR #31: "Our formalization does not treat identity by the exclusive convention…"); verified present in v11 at the same location. No further change. |
| tractatus-ontology.10.review (generic, minor) | §4.6 ↔ §5 state the complementarity contrast twice in similar words (D9 residual) | §4.6 contact paragraph reduced to its technical content (their consequence-relation completeness vs. `nGen_complete`'s semantic-equivalence closure) with a pointer "(see Section~\ref{sec:related})"; the word "complementary" and the full framing now appear once, in §5's Wehmeier paragraph. |
| tractatus-ontology.10.review (generic, nit, carried from v9) | §4.3 "The three new results" is a version-diff leftover; a fresh reader has no baseline | Reworded to the review's suggested version-agnostic phrasing: "The three results of this subsection carry the same axiom footprint…". |
| tractatus-ontology.10.review (generic, minor, carried from v9, related-work) | scherf2025 (unpublished, deleted repo, archive-only) framed as "the most directly comparable work" | Softened per the review's suggested wording: "the most directly comparable attempt". The bibliography entry already discloses the archive-only status. |
| tractatus-ontology.10.review (generic, nit, carried from v9) | fogelin1987: critique first appeared in the 1976 first edition; cite as Fogelin (1976/1987) at first prose mention | Declined — out of scope for this pass per operator instruction (light polish limited to the enumerated notes); the `\bibitem` already notes the first edition parenthetically. May be picked up in submission mechanics. |
| Operator decision (2026-07-14) | Title decision (candidates recorded in PR #30) | RESOLVED — keep "What Lean Cannot Say…". No change to `\title`; `CLAUDE.md`'s paper-workflow "Remaining before submission" line updated to record the decision, leaving only venue submission mechanics (issues #33/#35). |

## Build

Compiled under the anvil v0.8.0 convergence-loop contract (latexmk
semantics: rerun-warning fixpoint, 5-pass cap; this legacy thread has no
bibtex step). The loop converged at pass 2 (pass 1 emitted "Label(s) may
have changed"; pass 2 did not); a confirmatory pass 3 produced a
byte-identical `.aux` (fixpoint verified). Result: exit 0, 25 pages,
0 errors, 0 overfull boxes, 0 undefined refs/cites (the sole benign
`OT1/cmr/bx/sc` font-shape warning is pre-existing since v9). Rebuilt
`paper.pdf` committed per legacy thread convention.
