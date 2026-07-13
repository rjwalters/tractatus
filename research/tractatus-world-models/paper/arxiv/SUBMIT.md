# arXiv submission checklist — Synthese paper ("Independence as a Modeling Choice")

This directory is a **self-contained arXiv source bundle** for the
world-models follow-up paper, derived from the READY version
`tractatus-world-models.4/`. The paper uses the generic `article` class, so
there is no journal-branding to neutralize; the bundle is the version's
source plus the generated `.bbl` (arXiv prefers the `.bbl` included so it
need not re-run BibTeX).

Operator uploads this bundle to arXiv; agent work stops at the bundle +
this checklist.

---

## Bundle contents

| File | Role |
|------|------|
| `main.tex` | Main source. Byte-identical to `tractatus-world-models.4/main.tex`. |
| `refs.bib` | BibTeX database (byte-identical to the version dir). |
| `main.bbl` | Generated bibliography — included so arXiv uses it directly (arXiv prefers `.bbl` over re-running BibTeX). |
| `figures/spectrum.pdf` | The single figure, `\includegraphics`-referenced by `main.tex`. |

No journal class files are vendored — `article` and all packages used
(`amsmath`, `booktabs`, `graphicx`, `xcolor`, `hyperref`, `enumitem`,
`caption`/`subcaption`, `listings`) are standard on TeX Live / arXiv's
AutoTeX. No license consideration applies.

## Standalone-compile verification (performed 2026-07-13, TeX Live 2026)

Copied `main.tex`, `refs.bib`, `main.bbl`, and `figures/spectrum.pdf` into a
scratch dir and ran **two `pdflatex` passes with the included `.bbl` and no
BibTeX run** (the arXiv path):

```
pages: 10
error lines (!): 0
overfull hboxes: 0
undefined refs/citations: 0
```

Citations resolve from the bundled `.bbl` (spot-checked `[1]` present). A
clean-room build that *does* run BibTeX (`pdflatex → bibtex → pdflatex ×2`)
produces the identical 10-page PDF with 0 warnings, confirming `main.bbl` is
current with `refs.bib`.

---

## arXiv metadata (ancillary — for the submission form)

**Title:**
> Independence as a Modeling Choice: The Geometry of Tractarian World Models

**Author:** Robb Walters

**Categories:**
- Primary: **math.LO** (Logic)
- Cross-list: **cs.LO** (Logic in Computer Science)

**MSC 2020 (added here; the immutable version dir has none — do NOT edit
`tractatus-world-models.4/`):**
- Primary: **03A05** (Philosophical and critical aspects of logic and
  foundations), **03B70** (Logic in computer science)
- Secondary: **03B05** (Classical propositional logic), **03B35** (Mechanization
  of proofs and logical operations), **03C07** (Basic properties of
  first-order languages and structures)

Rationale: the paper is a model-theoretic + Lean-formalized study of a
philosophical thesis (independence of states of affairs), so 03A05
(philosophical aspects) and 03B70 (logic in CS / proof assistants) are the
honest primaries; the Horn/exclusion constraint model theory and
propositional-fragment results motivate 03B05/03C07, and the kernel-checked
formalization motivates 03B35.

**Abstract (plain text, ~230 words — within arXiv's 1920-char limit):**

> The Tractatus asserts that states of affairs are mutually independent
> (TLP 1.21, 2.061-2.062); the color-exclusion problem (TLP 6.3751;
> Wittgenstein 1929) is standardly told as this thesis's refutation and the
> proximate cause of the book's collapse. We retell the story
> model-theoretically, on a machine-checked foundation. Rather than asking
> whether independence is true, we treat it as a modeling choice: the free
> model is a distinguished point in a space of world models ordered by a
> refinement preorder, whose structure we develop -- evaluation is preserved
> along refinements, tautologies and contradictions are inherited downward,
> the free model is the maximum and is unique up to refinement-isomorphism
> among models realizing every truth-value profile, and refinement is a
> lattice-like order captured exactly by image-profile sets, with joins,
> meets, and infinitary joins. Constraint classes carve this space into
> tiers. For Horn constraints (positive implications between states of
> affairs) we state an exact realizability boundary that renders TLP 2.061
> precise. Our central new result concerns exclusion constraints ~(a & b) --
> the formal shape of color exclusion: no Horn constraint set is
> refinement-equivalent to any nontrivial exclusion model. Wittgenstein's
> 1929 crisis thus becomes a separation theorem about the geometry of
> logical space. All results are formalized in Lean 4 and checked by its
> kernel: 64 declarations, no sorrys, axiom footprint limited to
> propositional extensionality, choice, and quotient soundness.

**Comments field:**

> Preprint. Proof artifact: https://github.com/rjwalters/tractatus (commit
> 34db8e1). Manuscript under review. 10 pages, 1 figure. Companion to "What
> Lean Cannot Say" (same repository). Formalized in Lean 4.

**License recommendation:** **arXiv.org perpetual, non-exclusive license
v1.0** — *not* CC BY. Same reasoning as the companion paper: the manuscript
is under journal review; a non-exclusive license leaves all downstream
rights with the author and avoids reuse terms that could conflict with the
journal's copyright arrangements at acceptance.

**Endorsement status:** *[PLACEHOLDER — operator to fill]* arXiv math.LO
requires endorsement (Dec 2025 policy). Operator to request a personal
endorsement from an established arXiv author in the Lean community; the
endorsement code is generated by the arXiv submission form. The same
endorser can typically endorse both papers. Record endorser + date here
once secured.

---

## Step-by-step upload checklist (operator)

1. [ ] Obtain endorsement for **math.LO** (shared with the companion paper).
2. [ ] Create/sign in to arXiv account (personal — not an agent task).
3. [ ] Start a new submission; category **math.LO** (primary), cross-list
       **cs.LO**.
4. [ ] Upload the source bundle: `main.tex`, `refs.bib`, `main.bbl`, and
       `figures/spectrum.pdf` (a `.tar.gz`/`.zip` of *this directory*,
       preserving the `figures/` subdir). Do **not** upload the PDF as the
       source.
5. [ ] arXiv's AutoTeX will use the included `main.bbl` (no BibTeX rerun
       needed). Verify the preview is 10 pp with the spectrum figure and all
       citations resolved.
6. [ ] Paste the metadata above (title, author, abstract, MSC 2020, comments
       field).
7. [ ] Select the **arXiv non-exclusive license v1.0** (not CC BY).
8. [ ] Submit; record the assigned arXiv ID + version here.
9. [ ] Optionally cross-list to **cs.LO** and consider a PhilSci-Archive /
       PhilPapers deposit for philosophy-native indexing (no endorsement
       needed there), as a fallback if math.LO endorsement stalls.
</content>
