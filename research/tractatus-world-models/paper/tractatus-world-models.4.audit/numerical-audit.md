# Numerical audit — tractatus-world-models.4

Auditor: pub-audit (claude-fable-5), 2026-07-13. All artifact-facing numbers were re-verified
against the repository at this worktree's HEAD (`f1c1bdf`, branch `feature/wm-v4-review`);
`git diff 0852c5b master -- proofs/` is **empty**, so verification at HEAD transfers to the
paper's pinned commit `0852c5b` verbatim.

| Text claim | Source | Source value | Match | Notes |
|---|---|---|---|---|
| "64 declarations" (abstract, §1) | four `proofs/TractatusOntology{Spectrum,Horn,Equiv,Exclusion}.lean` modules | 37 + 9 + 6 + 12 = 64 top-level declarations | YES | Grep for top-level declaration keywords; one apparent 10th Horn hit is a docstring line (`Horn.lean:13`), not a declaration — real Horn count is 9 |
| "1{,}064 lines" (§1) | `wc -l` over the four modules | 472 + 212 + 145 + 235 = 1,064 | YES | Exact |
| "no \lean{sorry}s" (abstract, §1, App. A) | grep over the four modules | 0 `sorry` tokens outside comments | YES | Two hits are prose in module docstrings ("sorry-free development") |
| commit pin "0852c5b" (§1) / full hash (App. A) / bib note | `git` in this repo | `0852c5b00e1d2942d39cf4067b0816409cac54f9` exists; **is an ancestor of `master`** | YES | The full hash printed in Appendix A starts with the §1/bib short form; the pin is the commit where `horn_valuable_realizable_iff` landed (PR #24) and remains valid — being older than HEAD is expected and correct for an immutable locator, and `proofs/` is byte-identical between pin and master |
| `horn\_valuation\_realizable\_iff` backs Thm 5.3 (App. A index) | `proofs/TractatusOntologyHorn.lean` | declaration at **line 167**; Lean statement `(∃ w : HornModel S cs, ∀ s, w.val s ↔ (v s = true)) ↔ (∀ c ∈ cs, v c.1 = true → v c.2 = true)` | YES | Matches the printed per-valuation boundary exactly |
| "The kernel-checked proof is six lines" (§6 proof sketch) | `exclusion_not_horn`, `Exclusion.lean:179-189` | 6 tactic lines (184–189) | YES | |
| "axiom footprint ... propext, Classical.choice, Quot.sound only" (abstract, §6.5, App. A) | four modules | no `axiom` declaration in any of the four modules | CONSISTENT | Statically consistent (the repo's one deliberate `axiom silence : True` lives in the base module and is unused by these theorems); the reviewer's `#print axioms` run at v3 confirmed dynamically, and `proofs/` is unchanged since |
| "warning-free under Lean~4.26" (App. A) | `lean-toolchain` | `leanprover/lean4:v4.26.0` | YES | Toolchain pin matches; the build itself is exercised by the pub-review artifact_verify gate this same pass |
| "$2^n$ points" (§1) | — | combinatorial truism | n/a | Not an empirical claim |
| Fig. 1 caption "no Horn model realizes exactly the image profiles of a nontrivial exclusion model" | Theorem 6.5 (`exclusion_not_horn`) via `refinesEquiv_iff_image_eq` | profile-set equality phrasing | YES | The v4 caption fix landed; no longer misreadable as "shares any profile" |

## Figure source-of-truth check (informational)

| Figure | Rendered | Source | Stale? |
|---|---|---|---|
| `figures/spectrum.pdf` | Jul 13 12:36 | `figures/src/make_spectrum_figure.py` (Jul 13 12:36) | No — same mtime; carried over verbatim from v3 per changelog (caption text lives in `main.tex`) |

## Summary

- Numerical inconsistencies: **0**
- Stale figures: **0**
