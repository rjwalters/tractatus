# Numerical audit — tractatus-world-models.2

Auditor: pub-audit (claude-fable-5), 2026-07-13.

The paper has no data tables and one figure (a schematic, no plotted values), so the
classic text-vs-table check is small. The load-bearing "numbers" are claims about the
external Lean proof artifact (`/Volumes/Stripe/tractatus/issue-5/proofs/`), which per
this repo's verify-artifact-claims norm were re-verified by running the checks, not by
trusting prior review.

## Text claims vs sources

| Text claim | Source | Source value | Match | Notes |
|---|---|---|---|---|
| "63 declarations" (abstract, §1, Ack. context; also BRIEF.md) | Lean modules Horn/Equiv/Spectrum/Exclusion | 8 + 6 + 37 + 12 = 63 top-level declarations | YES | Counted by grep over `theorem/lemma/def/abbrev/structure/inductive/instance` at line starts; one doc-comment false positive in Horn excluded by inspection. Matches CLAUDE.md's per-module counts (Horn 8, Equiv 6, Spectrum 37) + Exclusion 12. |
| "~1,000 lines" (§1) | `wc -l` over the four modules | 174 + 145 + 472 + 235 = 1,026 | YES | Within rounding of "~1,000". |
| "no sorrys" (abstract, §1, §6.5, Appendix) | grep + full `lake build` | 0 sorries (only doc-comment mentions); build clean | YES | `lake build` in the worktree: exit 0, 0 errors, 0 warnings, 3068 jobs. |
| "axiom footprint limited to propext, Classical.choice, Quot.sound" (abstract, §1, §6.5, Ack.) | `#print axioms` via `lake env lean` on 10 headline theorems | Footprints are subsets of {propext, Classical.choice, Quot.sound}; several theorems axiom-free | YES | Kernel-level check: `exclusion_not_horn`, `color_not_horn`, `horn_realizable_iff`, `freeModel_unique_refines_iso`, `spectrum_invariant_iff_freeModel_tautology`, `refinesEquiv_iff_image_eq`, `equivModel_iso_hornModel_symm`, `exclusion_realizable_iff`, `tautology_pullback`, `color_independence_fails`. The companion module's deliberate `axiom silence : True` is not in any checked footprint. |
| "the build is warning-free under Lean 4.26" (Appendix) | `lake build` with toolchain v4.26.0 | 0 warnings, exactly 9 `#eval` info lines (the documented intentional demos) | YES | |
| "The kernel-checked proof is nine lines" (§5, proof sketch of Thm 5.4 / `exclusion_not_horn`) | `TractatusOntologyExclusion.lean` lines 179–189 | Proof body is 6 tactic lines (11 lines including the statement; 7 counting from `:= by`) | **NO** | No natural counting yields nine. Cosmetic, but it is a checkable factual claim about the artifact — reword (e.g. "six lines" or "a few lines"). Non-critical note in `flags.md`. |
| Theorem 4.3 statement attributed to `horn_realizable_iff` (§4; also intro item (C4)) | `TractatusOntologyHorn.lean` lines 128–140 | Lean proves: (∀ assignment, realizable) ↔ (∀ c ∈ cs, c.1 = c.2) — a GLOBAL biconditional | **NO** | The paper states a PER-VALUATION boundary ("v : S → Bool is the profile of some Horn world iff v satisfies every clause"). No declaration proving the per-valuation Horn statement exists in the artifact (grep over all four modules). See critical flag in `flags.md`. |
| Theorem 5.1 statement attributed to `exclusion_realizable_iff` (§5) | `TractatusOntologyExclusion.lean` lines 98–101 | (∃ w matching v) ↔ (∀ c ∈ cs, ¬(v c.1 ∧ v c.2)) — per-valuation | YES | The exclusion boundary IS the per-valuation shape the paper states. This asymmetry is likely how the Thm 4.3 mis-statement arose. |
| "compare the Horn analog, which needs a ≠ b" (Thm 5.2 note) | `hornModel_independence_fails` | Requires `hpair_distinct : ∀ c ∈ cs, c.1 ≠ c.2`; exclusion analog needs only `cs ≠ []` | YES | |
| "quantifies over all Horn clause lists" (§5, re Thm 5.4) | `exclusion_not_horn` | `¬ ∃ ds : List (S × S), ...` | YES | |
| "even over a two-element S" (§6.1) | `RedGreen` inductive | 2 constructors (red, green) | YES | |
| Appendix theorem index (17 rows, 42 declaration names) | grep over the four modules | All 42 names exist, each in the module the Appendix assigns it | YES (with the Thm 4.3 caveat) | Statement shapes spot-checked for all Spectrum rows, both Horn rows, both Equiv names (existence), and all Exclusion rows; all match the paper's prose except Thm 4.3 (above). |

## Figure source-of-truth check

`figures/spectrum.pdf` and `figures/src/make_spectrum_figure.py` have identical
mtimes (both 2026-07-13 09:01) — the render is not older than its source. Not stale.
The figure is a schematic (no numerical content to cross-check); its caption's
substantive claim ("no Horn model shares a nontrivial exclusion model's image
profiles") matches Theorem 5.4 / `exclusion_not_horn`.

## Build-derived numbers

`main.pdf`: 9 pages, 418,956 bytes — consistent with the migration note's "9 pages".
6 overfull hboxes (cosmetic; worst 121.5pt at source lines 419–424), 0 undefined
references, 0 undefined citations.
