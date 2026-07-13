# Findings — tractatus-ontology.9 (cross-section observations)

1. **The evidence base is unusually strong for the venue and the audit chain
   holds.** Every mathematical claim in the paper is a kernel-checked Lean
   theorem, and the `.audit/` sibling independently re-verified the build,
   all 80 declaration rows, and the six headline statements against source.
   Given this repository's history (a v3 ACCEPT once missed a non-building
   repo and a false hierarchy theorem), the fact that the current claim set
   survives from-scratch re-verification is the paper's strongest property.
   The paper even absorbed the lesson: the old false chain
   `structEq ⊊ formEq ⊊ semEq` is now the proved *incomparability* result,
   presented as a finding rather than an embarrassment.

2. **The paper is honest about its weakest point.** The headline collapse
   theorem is near-definitional, and Remark 4.6 concedes this before a
   referee can, arguing the contribution is the *formulation* (typed
   object/meta boundary) — the same defense pattern as Tarski/diagonal-lemma
   analogies. This honesty is load-bearing for dim 1; a version of this
   paper that oversold the two-line proof would score materially lower.

3. **Related-work coverage is one line short of complete.** The
   Wehmeier/Rogers–Wehmeier literature on Tractarian first-order logic and
   the N-operator (including an *RSL* 2012 paper) is absent while the paper
   proves N-operator results and targets RSL. Non-blocking (novelty is not
   misrepresented) but the single most likely referee request. See
   comments.md (`related-work`).

4. **Rhetorical economy is the only structural weakness.** Results are
   stated three times at full resolution (abstract, contribution list,
   conclusion). At 25 pages with no venue cap this is tolerable, but dim 9
   exists precisely to price this in: 3/4.

5. **Stale internal note inside the immutable version dir.**
   `tractatus-ontology.9/literature.md` (Gap Analysis item 4) still asserts
   the superseded hierarchy chain the paper refutes. It is not part of the
   rendered artifact and does not affect any dimension score, but it is
   claim-support ground truth for future audits (audit friction F19) — a
   future v10 should carry the fix.

6. **Deterministic gates all pass.** Render gate: 25 pages, 0 overfull ≥
   5.0pt, 0 placeholders, no unresolved refs. Numeric consistency: 0
   findings (advisory), plus a manual pass over the line/declaration
   arithmetic — exact. Citation resolution: 21/21.

## Rubric version transition

This iteration was scored against `anvil-pub-v2` (/44, ≥35); the prior
iteration at `tractatus-ontology.8.review/` predates per-review rubric
version stamping (issue #346) and was scored against `/40-legacy` — the
pre-anvil legacy paper workflow rubric (8 dimensions, /40, ≥32 threshold; it
was not an anvil-format review sibling at all, so `prior_rubric_id` is
`null`). The score delta `39/40-legacy → 42/44` is NOT directly comparable —
the threshold pool, dimension count, and weighted contributions all changed,
and the anvil rubric adds dimensions the legacy rubric lacked (rhetorical
economy; reproducibility as a hard requirement; citation hygiene as a
separate weighted dimension). A downstream consumer reading the delta SHOULD
treat the prior score as advisory only and re-anchor on this iteration's
`42/44` against the `≥35/44` threshold.
