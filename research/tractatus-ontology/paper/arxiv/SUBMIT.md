# arXiv submission checklist — RSL paper ("What Lean Cannot Say")

This directory is a **self-contained arXiv source bundle** for the RSL
paper, derived from the READY camera-ready `tractatus-ontology.11/`. It is
an *arXiv preprint variant*: the vetted v11 text with the Review of Symbolic
Logic / ASL journal masthead and copyright line neutralized, and a
"Preprint. Manuscript under review." notice added on the title page. The
prose, theorems, figures, and bibliography are otherwise identical to v11.

Operator uploads this bundle to arXiv; agent work stops at the bundle +
this checklist.

---

## Bundle contents

| File | Role |
|------|------|
| `paper.tex` | Main source. Byte-identical to `tractatus-ontology.11/paper.tex` **except** the arXiv-variant preamble block (masthead/copyright neutralization) and a one-line author footnote ("Preprint. Manuscript under review."). |
| `asl.cls` | ASL author document class (vendored). See **License consideration** below. |
| `asl.bst` | ASL BibTeX style (vendored). |
| `bussproofs.sty` | Proof-tree macros (vendored; also on CTAN). |

The bibliography is an inline `thebibliography` in `paper.tex` (no external
`.bib` / `.bbl` needed — bibtex is **not** run for this paper).

## Standalone-compile verification (performed 2026-07-13, TeX Live 2026)

Copied the four files above into a scratch dir and ran three `pdflatex`
passes (`lastpage`/refs convergence):

```
pages: 25
error lines (!): 0
overfull hboxes: 0
undefined refs/citations: 0
```

Page count unchanged from the v11 camera-ready (25 pp): removing the
masthead logo box freed vertical space but the layout reflowed to the same
page total. The only "Review of Symbolic Logic" strings remaining in the
rendered PDF are two legitimate **bibliography citations** (Weiss 2017;
Rogers & Wehmeier 2012) — those are correct scholarly references to that
journal and are meant to stay.

## How the RSL/ASL masthead was neutralized

The `[jsl]` class option turns on two pieces of journal branding, each
gated by a class-level toggle:

- `\LogoOn` → the **first-page masthead logo box** (`\@setlogo`), which
  prints the journal name plus a `Volume / Number / Year` line;
- `\CopyRightOn` → the **copyright block** ("© year, Association for
  Symbolic Logic" + ISSN) set into the first-page margin.

The arXiv variant sets **both toggles off in the preamble**:

```latex
\makeatletter
\LogoOnfalse
\CopyRightfalse
\makeatother
```

These must be set in the preamble (not deferred): `asl.cls` registers its
own `\AtBeginDocument{\ifLogoOn\@setlogo\fi}` at class-load time, so
`\ifLogoOn` must already be false when that hook fires. This touches only
toggles `asl.cls` itself exposes — **the vendored `asl.cls` is left
byte-identical to the ASL distribution.** The running heads on pp. 2ff use
the author/title marks (`\leftmark`/`\rightmark`), not the journal name, so
no further change is needed.

The "under review" notice is carried as a footnote on the author name
(`\author{Robb Walters\footnote{Preprint. Manuscript under review. ...}}`)
rather than a `\title`-attached `\thanks`, because `asl.cls`'s `\title` does
not emit a title-attached footnote (`\footnote` works in the ASL front
matter — cf. the GitHub-artifact footnote in the abstract).

## License consideration — vendored `asl.cls` / `asl.bst` (the redistribution call)

`asl.cls` is "Copyright 2002 by the Association for Symbolic Logic"
(Y. N. Moschovakis) with **no explicit redistribution license** in its
header. It is distributed by the ASL specifically for authors to prepare
and submit manuscripts, via the ASL Author Resources bundle
(<https://aslonline.org/journals/author-resources/>).

**Call made (agent):** *keep* the vendored class files in this arXiv
bundle. Rationale: the class is publicly downloadable from ASL for exactly
this purpose (author manuscript preparation), and including it in an
author's own preprint source is within that intended use; arXiv requires
source that compiles, and this is the source that produces the vetted v11
typesetting. This matches the issue's guidance ("`asl.cls` is
redistributable in the author bundle context").

**Fallback if redistribution is questioned** (by the operator, ASL, or
arXiv moderation): re-post an **article-class** arXiv variant built from the
v8 lineage (`tractatus-ontology.8/`, generic `article` class, two-pass
`pdflatex`, no vendored class). The v8 text is an earlier READY version;
for a strict content match to v11 the v11 prose would need porting onto the
`article` preamble (a mechanical preamble swap, since v11's body is
class-agnostic apart from the ASL front-matter commands `\subjclass` /
`\keywords` / `\revauthor` / `\address`). The article-class route removes
the license question entirely. Flagged here so the operator can choose;
default recommendation is to ship the ASL-class bundle above.

---

## arXiv metadata (ancillary — for the submission form)

**Title:**
> What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*

**Author:** Robb Walters (Integrated Plasmonics Corporation, San Francisco, CA, USA)

**Categories:**
- Primary: **math.LO** (Logic)
- Cross-list: **cs.LO** (Logic in Computer Science)

**MSC 2020:** Primary 03B70; Secondary 03A05, 03B35, 03B05
(as in the paper's `\subjclass`).

**Abstract (plain text, ~250 words — within arXiv's 1920-char limit):**

> We present a machine-checked reconstruction of the semantic core of
> Tractatus Logico-Philosophicus in the Lean proof assistant.
> Parameterizing over world models separates the Tractatus into
> invariants, assumptions, and limits: truth-functional compositionality,
> bivalence, and functional completeness are structural invariants holding
> in every model, whereas the independence of atomic facts is a
> model-dependent assumption -- it characterizes a "free" model and fails
> in constrained ones. An expresses relation linking propositions to
> meta-level predicates lets us prove that any proposition expressing a
> world-independent property is a tautology or contradiction, so nontrivial
> propositions cannot express world-independent truths -- the
> saying/showing distinction as a theorem. Distinguishing three
> equivalences -- syntactic identity, logical-form equivalence up to
> permutation, and semantic equivalence -- we show the first strictly
> refines the other two, which are themselves provably incomparable:
> logical form neither determines nor is determined by truth conditions. We
> formalize the N-operator (joint denial) and settle TLP 5.52 both ways:
> quantifiers reduce to N-applications over any finite domain, while over an
> infinite domain no finite N-application expresses the universal quantifier
> -- the Geach-Soames critique as a theorem. We prove full functional
> completeness (TLP 5.101) and N-generation completeness (TLP 6), and
> characterize the sayable exactly: over finitely many atoms a
> world-property is expressible iff invariant under pointwise-iff agreement
> of worlds, whereas over infinitely many atoms the totality property of
> TLP 1 is invariant yet expressed by no proposition. The formalization
> comprises 2,296 lines of Lean 4 proving 80 verified results with 0 sorry
> obligations and 1 deliberate axiom.

**Comments field:**

> Preprint. Proof artifact: https://github.com/rjwalters/tractatus (commit
> 34db8e1). Manuscript under review. 25 pages. Formalized in Lean 4
> (toolchain leanprover/lean4:v4.26.0, Mathlib); builds with `lake build`.

**License recommendation:** **arXiv.org perpetual, non-exclusive license
v1.0** — *not* CC BY. The paper is under journal review; a non-exclusive
license keeps all downstream rights with the author and imposes no reuse
terms that could conflict with the journal's copyright transfer at
acceptance, while still permitting arXiv to distribute the preprint.

**Endorsement status:** *[PLACEHOLDER — operator to fill]* arXiv math.LO
requires endorsement (Dec 2025 policy: academic email + prior arXiv math
authorship for auto-endorsement; neither applies). Operator to request a
personal endorsement from an established arXiv author in the Lean community
(the endorsement code is generated by the arXiv submission form: submit →
"need endorsement" → share code). Record endorser + date here once secured.

---

## Step-by-step upload checklist (operator)

1. [ ] Obtain endorsement for **math.LO** (see Endorsement status above).
2. [ ] Create/sign in to arXiv account (personal — not an agent task).
3. [ ] Start a new submission; category **math.LO** (primary), cross-list
       **cs.LO**.
4. [ ] Upload the source bundle: `paper.tex`, `asl.cls`, `asl.bst`,
       `bussproofs.sty` (a `.tar.gz`/`.zip` of *this directory*, or the four
       files individually). Do **not** upload the PDF as the source — arXiv
       compiles from source.
5. [ ] Let arXiv's AutoTeX run **three** `pdflatex` passes (default is
       enough; the bundle is self-contained, no bibtex). Verify the arXiv
       preview is 25 pp with no journal masthead and the "Preprint.
       Manuscript under review." author footnote on p. 1.
6. [ ] Paste the metadata above (title, authors, abstract, MSC 2020 in the
       comments/report-no as appropriate, comments field).
7. [ ] Select the **arXiv non-exclusive license v1.0** (not CC BY).
8. [ ] Submit; record the assigned arXiv ID + version here.
9. [ ] After journal acceptance, post the accepted version as a new arXiv
       version if the journal's green-OA policy permits (Cambridge Green OA
       allows preprints anywhere at any time).
</content>
