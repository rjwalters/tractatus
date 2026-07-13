# arXiv submission — index (both papers)

Two arXiv-ready source bundles have been prepared so both papers can be
posted to arXiv **before** journal submission (timestamps priority; both
target journals permit preprints — Cambridge Green OA allows preprints
anywhere at any time, Springer likewise). Agent work stops at the bundles
+ per-bundle checklists; **uploading is the operator's job** (arXiv accounts
are personal and math.LO requires a human endorsement — see below).

Prepared against master commit **`34db8e1`** (this is the commit cited in
each bundle's arXiv "comments" field as the proof artifact).

---

## The two bundles

| Paper | Bundle dir | Class | Pages | Checklist |
|-------|-----------|-------|-------|-----------|
| **RSL** — "What Lean Cannot Say: A Machine-Checked Analysis of Wittgenstein's *Tractatus*" | `tractatus-ontology/paper/arxiv/` | ASL (`asl.cls`), masthead neutralized | 25 | `tractatus-ontology/paper/arxiv/SUBMIT.md` |
| **Synthese** — "Independence as a Modeling Choice: The Geometry of Tractarian World Models" | `tractatus-world-models/paper/arxiv/` | `article` | 10 | `tractatus-world-models/paper/arxiv/SUBMIT.md` |

Both bundles were **standalone-compiled** from a clean scratch dir on
TeX Live 2026: 0 errors, 0 overfull hboxes, 0 undefined refs/citations
(RSL via 3 `pdflatex` passes; Synthese via 2 passes using the included
`.bbl`, matching arXiv's AutoTeX path). Details in each `SUBMIT.md`.

Both bundles carry a **"Preprint. Manuscript under review."** notice: the
RSL paper as a title-page author footnote (added in the arXiv variant), the
Synthese paper via its comments-field text.

### Categories & license (both)

- **Categories:** primary **math.LO**, cross-list **cs.LO**.
- **License:** **arXiv perpetual non-exclusive license v1.0** — *not* CC BY.
  The manuscripts are under journal review; a non-exclusive license keeps
  all downstream rights with the author and avoids reuse terms that could
  conflict with the journals' copyright arrangements at acceptance.
- **MSC 2020:** RSL — Primary 03B70; Secondary 03A05, 03B35, 03B05 (in the
  paper). Synthese — added in its `SUBMIT.md` metadata only (the immutable
  version dir has none): Primary 03A05, 03B70; Secondary 03B05, 03B35, 03C07.

---

## Operator's remaining steps

1. **Endorsement (blocking, do first).** arXiv math.LO requires endorsement
   (Dec 2025 policy: auto-endorsement needs an academic email *and* prior
   arXiv math authorship — neither applies here). Ask an established arXiv
   author in the Lean community group for a personal endorsement; a single
   endorser can cover **both** papers. The endorsement code comes from the
   arXiv submission form (start a submission → "need endorsement" → share the
   code with the endorser). Record endorser + date in each `SUBMIT.md`.
   *Fallback if endorsement stalls:* deposit the Synthese paper to
   PhilSci-Archive / PhilPapers (no endorsement, philosophy-native indexing);
   the RSL paper really wants math.LO, so hold it for the endorsement.

2. **arXiv account.** Personal account (not an agent task).

3. **Upload order.** Suggested: upload the **RSL** paper first (it is the
   primary artifact and the Synthese paper's comments field references it as
   the companion), then the **Synthese** paper. Each bundle's `SUBMIT.md` has
   a step-by-step upload checklist (source files to upload, AutoTeX passes,
   metadata to paste, license selection). Do **not** upload the PDFs as
   source — arXiv compiles from source.

4. **Record IDs.** After each submission, write the assigned arXiv ID +
   version back into the corresponding `SUBMIT.md`, and cross-reference the
   two (they are companions) once both IDs exist.

5. **Post-acceptance.** After journal acceptance, post the accepted version
   as a new arXiv version if the journal's green-OA policy permits.

---

## Comments-field text (copy/paste, per paper)

**RSL:**
> Preprint. Proof artifact: https://github.com/rjwalters/tractatus (commit
> 34db8e1). Manuscript under review. 25 pages. Formalized in Lean 4
> (toolchain leanprover/lean4:v4.26.0, Mathlib); builds with `lake build`.

**Synthese:**
> Preprint. Proof artifact: https://github.com/rjwalters/tractatus (commit
> 34db8e1). Manuscript under review. 10 pages, 1 figure. Companion to "What
> Lean Cannot Say" (same repository). Formalized in Lean 4.

---

## Note on the RSL `asl.cls` (license consideration)

The RSL bundle vendors `asl.cls` / `asl.bst` (Copyright 2002, Association
for Symbolic Logic; no explicit redistribution license). The agent's call
was to **keep** them — the class is publicly distributed by ASL for author
manuscript preparation, and arXiv needs the source that produces the vetted
v11 typesetting. If redistribution is ever questioned (by the operator, ASL,
or arXiv moderation), the documented fallback is an **article-class** arXiv
variant built from the v8 lineage. Full reasoning in
`tractatus-ontology/paper/arxiv/SUBMIT.md`.
</content>
