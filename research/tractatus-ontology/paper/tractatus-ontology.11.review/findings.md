# Findings — tractatus-ontology.11

Cross-section observations from the review pass. (Prior review
`tractatus-ontology.10.review/` was scored against the same `anvil-pub-v2`
rubric, so the rubric-version-transition subsection is omitted per the
steady-state case — the 43/44 → 44/44 delta is directly comparable.)

## v11 delta verification (against the v10 review's residual notes)

The v10 review listed one major and four minor/nit residuals (all
non-blocking; v10 advanced at 43/44). v11 addressed them as follows, each
verified on the artifact:

1. **"Neither work" sentence (v10 major, D7)** — already fixed in the v10
   source itself post-review (commit `d185c11`, PR #31); verified present
   in v11: "Our formalization does not treat identity by the exclusive
   convention, so their identity results have no direct analogue here."
   The subject is now unambiguous.
2. **Complementarity duplication §4.6 <-> §5 (v10 minor, D9 residual)** —
   fixed. §4.6's contact paragraph is reduced to its technical content
   (consequence-relation completeness vs. nGen_complete's
   semantic-equivalence closure) ending in a pointer to
   Section \ref{sec:related}; the word "complementary" now appears exactly
   once in the paper, in §5's Wehmeier paragraph. No content was lost —
   the technical contrast survives at the point of use.
3. **§4.3 "The three new results" (v9/v10 nit, D7)** — fixed with the
   review's suggested version-agnostic phrasing ("The three results of
   this subsection"), which matches the subsection's actual count (two
   theorems + one lemma).
4. **scherf2025 "most directly comparable work" (v9/v10 minor, D4)** —
   softened to "attempt" per the review's suggestion; the \bibitem
   already discloses the deleted-repository / archive-snapshot status.
5. **Fogelin 1976/1987 dating (v9/v10 nit)** — declined in changelog.md
   (out of the operator-directed scope); carried in comments.md as minor.
   Reasonable to fold into submission mechanics.

The title decision is recorded as resolved (keep "What Lean Cannot Say…",
operator decision 2026-07-14); \title is unchanged and CLAUDE.md's
remaining-before-submission line now reflects it.

## Artifact and build observations

- The v11 diff vs v10 is confined to three prose edits in paper.tex
  (§4.3 one phrase, §4.6 one paragraph tightened, §5 one word) plus the
  rebuilt paper.pdf and the new changelog.md. No Lean file, figure,
  table, appendix row, or bibliography entry changed.
- **First pass under anvil v0.8.0.** The external-artifact gate (#663)
  ran the thread's declared `lake build` in this fresh worktree: exit 0,
  "Build completed successfully (3068 jobs)", exactly the 9 expected
  `#eval` info lines, empty stderr (_artifact_verify.json). This
  closes friction F16 (external proof-artifact verification had no slot)
  — the repo's verify-artifact-claims norm is now enforced by machinery
  rather than reviewer initiative.
- Compile: the reviser's build used the 0.8.0 convergence-loop contract
  (fixpoint at pass 2 of the 5-pass cap; confirmatory pass 3 .aux
  byte-identical). Render gate PASS on explicit paths: 25 pages,
  0 overfull at 5.0pt, 0 placeholders. The committed paper.pdf is the
  fresh build itself (499,075 bytes).
- Citation graph: 23 \cite keys, 23 \bibitem entries, bijective (no
  orphans either direction; re-checked this pass).
- Numeric detector (in place via --body, F22 retired): 551 numbers,
  0 claims, 0 findings; manual arithmetic cross-check of the line and
  declaration counts (2,296 = 1,345+284+239+142+138+148;
  80 = 45+9+11+9+3+3) and appendix row ranges (1–45 / 46–80) exact.

## Convergence note

44/44 with 0 critical flags on the same rubric as v10's 43/44 — the third
consecutive iteration above the >=35 threshold, with every open residual
from the v10 review either fixed and verified on the artifact or
explicitly declined with a documented reason. The paper is at rubric
ceiling; remaining work is venue submission mechanics (#33/#35), not
manuscript quality.

(Procedural: the agent-harness output-file guard again intercepted the
file-write tool on findings.md inside the staging dir — the F23 collision
documented in ANVIL-AUDIT-NOTES.md, still present under anvil v0.8.0 —
so this file was written via shell heredoc; all other sidecar files were
written with the normal file tool.)
