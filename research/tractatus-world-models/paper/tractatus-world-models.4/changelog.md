# Changelog — tractatus-world-models.4

Revision of `tractatus-world-models.3` against the critic siblings at N=3:
`.3.review/` (generic /44 rubric: **43/44, `advance: true`, 0 critical flags**) and
`.3.numeric/` (advisory, pass, no findings). No venue overlay was scored (no `venue`
key in `.anvil.json`).

**Verdict pre-check override (documented deviation from `pub-revise` step 4):** the
v3 verdict is `advance: true` with no critical flags, so the command's pre-check would
normally exit READY with no revision. The operator explicitly authorized this v4 pass
on issue #5 (comments of 2026-07-13/14) as a non-blocking submission-polish pass taking
the review's "Remaining priorities" together with author-caught items. No substantive
rewrites were made; the paper's converged content is untouched.

**Artifact context:** `horn_valuation_realizable_iff` is now on `master` (PR #24
merged); the reviewed
state of the four world-model modules (64 declarations / 1,064 lines) is pinned by
commit `0852c5b00e1d2942d39cf4067b0816409cac54f9` (short: `0852c5b`), which is the
commit this worktree is based on. All artifact pointers below cite it.

| Source | Note | Resolution |
|---|---|---|
| tractatus-world-models.3.review (generic, major; verdict priority 1) + issue #5 item 1 | Artifact pointer had no immutable locator; at v3 review time the cited `horn_valuation_realizable_iff` lived only on the unpushed branch | Lemma is now on `master` via PR #24. Pinned all three artifact references at commit `0852c5b`: §1 formalization paragraph now reads "(commit `0852c5b`; the full hash is pinned in Appendix A)"; Appendix A prints the full 40-char hash `0852c5b00e1d2942d39cf4067b0816409cac54f9` on its own centered line (avoids an unbreakable-typewriter overfull) with the short form and the "warning-free build at that commit" claim; `companion2026` bib note now ends "(commit 0852c5b)" |
| issue #5 item 2 (author-caught, 2026-07-14) + both prior audits ("unverified — source not on disk") | `companion2026` cited the companion by an invented title ("Saying, Showing, and Structure: A Machine-Checked Reconstruction of the *Tractatus* Ontology") | Fixed to the companion's actual current title: "What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*" (per `research/tractatus-ontology/paper/tractatus-ontology.9/paper.tex`), case-protected for plain.bst (`{L}ean`, `{W}ittgenstein`, braced `Tractatus`); kept `@unpublished` + manuscript-under-review note. Author decision on record: the companion may retitle at its v10 pass (issue #23) — re-sync at submission time if so |
| tractatus-world-models.3.review (generic, nit; verdict priority 3) | Fig. 1 caption "no Horn model shares a nontrivial exclusion model's image profiles" is misreadable as "shares *any* profile" (false — both tiers realize e.g. the all-false profile); the theorem is about profile-*set* equality | Caption now reads "no Horn model realizes exactly the image profiles of a nontrivial exclusion model" (the reviewer's suggested phrasing), matching Theorem 6.5 / `refinesEquiv_iff_image_eq` |
| tractatus-world-models.3.review (generic, minor; verdict priority 2) + issue #5 item 4 | Thread-root `BRIEF.md` evidence inventory still said "63 declarations" (predates the lemma); paper says 64 (verified 37+9+6+12) | Updated `tractatus-world-models/BRIEF.md` to "64 declarations". **Scope note:** BRIEF.md is thread-root reviser input, normally out of scope — this touch is explicitly authorized by issue #5 and recorded here per that authorization. (BRIEF states no line count, so nothing else to sync) |
| tractatus-world-models.3.review (generic, nit) | Repo `CLAUDE.md` says `TractatusOntologyExclusion.lean` is 236 lines; actual is 235. Outside the paper; the paper prints only the exact four-module total (1,064) | Declined — main-worktree `CLAUDE.md` is outside this revision's staging scope (version dir + authorized BRIEF.md only); the reviewer noted "nothing to change in `main.tex`". Left for a housekeeping commit on the main branch |
| (self, proofread pass, issue #5 item 5) | Stray space inside math in Theorem 4.2: `$\mathrm{Im}(\mathrm{freeModel}) $` | Removed the space before the closing `$`. Full proofread pass also ran duplicate-word and common-typo scans (clean), verified no duplicate labels, all 22 `\ref`s resolve, and 17/17 `\cite` keys resolve against `refs.bib`. No other defects found; no substantive rewrites made (paper converged at 43/44) |
| .3.numeric (tool_evidence) | 42 numbers, 0 arithmetic claims, 0 findings, pass | Nothing to address |

Deliberate non-resolutions: one — the repo `CLAUDE.md` 236→235 line-count nit (out of
staging scope, see table). Everything else on the issue #5 v4 punch list and the v3
review's remaining-priorities list is addressed. Issue #5's venue-mechanics item
(Synthese author guidelines / anonymization) is submission mechanics, not paper
content, and remains open on the issue by design.

## Verification

- LaTeX (per the thread contract / friction F15): `pdflatex → bibtex → pdflatex ×3`
  from inside the version dir. Final pass: **10 pages**, **0 errors**, **0 overfull
  hboxes**, **0 undefined references/citations**, no "Labels may have changed" rerun
  hint (`rerunfilecheck`: `main.out` unchanged). Aux files and PDF cleaned; no PDF
  committed (pub-audit produces it).
- Rendered spot-checks via `pdftotext`: §1 and Appendix A print the commit pin (short
  hash in §1, full hash in Appendix A); Fig. 1 caption prints the new phrasing; the
  bibliography prints the corrected companion title with `Lean`, `Wittgenstein`,
  `Tractatus` case-preserved and "(commit 0852c5b)" in the note.
- Artifact: worktree HEAD is `0852c5b00e1d2942d39cf4067b0816409cac54f9` (= the pinned
  commit); `horn_valuation_realizable_iff` present at
  `proofs/TractatusOntologyHorn.lean:167`; module totals re-verified
  `wc -l` = 472+212+145+235 = 1,064 lines.
- `figures/` (including `figures/src/make_spectrum_figure.py`) carried over verbatim;
  no figure content changed (caption text lives in `main.tex`).
