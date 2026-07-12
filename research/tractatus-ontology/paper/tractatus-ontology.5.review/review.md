# Review: tractatus-ontology.5

**Reviewer:** Claude (automated paper review)
**Date:** 2026-07-12
**Paper reviewed:** `research/tractatus-ontology/paper/tractatus-ontology.5/paper.tex`
**Version history:** v1 (27/40) → v2 (37/40) → v3 (39/40, unsound) → v4 (35/40, 1 critical) → v5 (this review)

---

## Overall Assessment: STRONG

**Score: 38/40 — converged (≥ 32, 0 critical)**

| Dimension | Score | Key Issue |
|-----------|-------|-----------|
| Technical Soundness | 5/5 | Statement and artifact now aligned: separation witnesses generalized to arbitrary distinct atoms; tt-iso vacuity claim formalized |
| Novelty & Contribution | 4/5 | Honest ceiling: core collapse remains definitional; incomparability + vacuity lemma strengthen but do not lift it |
| Experimental Rigor | 5/5 | Build verified on the exact published commit, locally and by green CI |
| Clarity & Writing | 5/5 | All v4 clarity issues resolved; no new problems found |
| Related Work Coverage | 4/5 | Missing Lampert & Nakano (2025), a directly relevant HPL paper on early Wittgenstein's logic |
| Figures & Tables | 5/5 | Correct figure; 54-row table matches source exactly |
| Reproducibility | 5/5 | Pinned toolchain, tracked manifest, CI, working Appendix A steps |
| Presentation & Structure | 5/5 | 16 pages; zero box warnings; counts consistent everywhere including the previously stale intro footnote |

### Resolution of v4 issues (each verified against the current artifacts)

1. **[RESOLVED — Critical] Statement/artifact generality gap.** All four separation witnesses (`formEq_not_structEq_witness`, `semEq_not_formEq_witness`, `formEq_not_semEq_witness`, `formEq_semEq_not_structEq_witness`) are now stated in Lean for arbitrary `S`, taking two distinct atoms as explicit hypotheses `(a b : S) (hab : a ≠ b)`; the `TwoFacts` instances are retained as `example` declarations (6 examples in the file, checked but uncounted). Theorem 5.7 as printed — "for S with at least two atoms" — is machine-checked at exactly that generality. Verified by reading the source and by the green CI run on the published commit.
2. **[RESOLVED] Intro footnote counts.** Now 1,345/45 and 284/9, matching `wc -l` and declaration greps, the abstract (1,629 / 54), Appendix A, and the 54-row Appendix B table.
3. **[RESOLVED] Unformalized truth-table-iso claim.** New lemma `truth_table_iso_of_nontrivial` proves the (strengthened) claim: *any* proposition is truth-table-isomorphic to *any* nontrivial one. Remark 5.8 cites it.
4. **[RESOLVED] Hierarchy vocabulary.** §5.3 retitled "Three Equivalence Relations"; section overview updated; Appendix B legend now "equivalence helper." Remaining occurrences of "hierarchy" are internal LaTeX labels and the deliberate phrase "not a rung of a hierarchy."
5. **[RESOLVED] Date.** Now July 2026.
6. **[RESOLVED] TractObject inertness.** §2.1 states it explicitly, matching the source-level design note.
7. **[RESOLVED] Tarski / Spinney.** New Remark 5.10 (Tarskian invariance) with `tarski1986`; `spinney2022` cited there and in Related Work. Both entries Crossref-verified.
8. **[RESOLVED] Companion development.** Fifth Future Work item added.
9. **[DEFERRED, acknowledged] CUP document class** — unchanged carry-over; see Suggestions.

### Verification performed

- `lake build` clean (zero errors, zero warnings) on the exact pushed commit — local and CI.
- `[Nonempty S]` grep confirms Remark 5.6's "exactly one theorem" claim (`structEq_ne_semEq` only; `Nonempty D` in the quantifier file is a different assumption and is disclosed in §5.4).
- All listings re-diffed against source: only line-wrapping differences.
- No stale counts anywhere (grep for 53/1,592/44/1,308 returns only legitimate hits).
- Two fresh literature searches (invariance-criteria literature; recent saying/showing work).

---

## Critical Issues (must fix)

None.

---

## Important Issues (should fix)

1. **Missing engagement with Lampert & Nakano (2025)** (Dimension: 5)
   - Problem: T. Lampert and A. Nakano, "A Logical Refutation of Wittgenstein's Early Philosophy of Logic," *History and Philosophy of Logic*, 2025 (online first, pp. 1–19, DOI 10.1080/01445340.2025.2498308) argues that the classical undecidability proofs do not refute Wittgenstein's early conception of logic on its own terms (he rejects principles they assume), and supplies a purely logical refutation that does not depend on such principles. This sits squarely in the paper's expressive-completeness/decidability lane (the Weiss Π¹₁-completeness discussion, the Geach–Soames critique) and postdates the draft's literature search. An HPL/RSL referee — plausibly one of these authors — will expect engagement.
   - Recommendation: Add the citation and 2–3 sentences in the "expressive completeness debate" paragraph of Related Work, positioning it as the newest entry in the critique literature and noting that our formalization is neutral on the decidability conjecture (we formalize the semantic core, not the *ab*-notation decision procedure). Abstract and framing verified against the publisher listing; do not overclaim its contents beyond the abstract.

---

## Suggestions (nice to have)

1. **Sher/Bonnay overgeneration parallel.** The new vacuity lemma (`truth_table_iso_of_nontrivial`) is structurally an *overgeneration* result — the relation admits far too much — which is exactly the classic objection to the Tarski–Sher permutation-invariance criterion (Sher 1991; Bonnay 2008; McGee 1996). One sentence in Remark 5.10 drawing this parallel would deepen the connection already made to Tarski and preempt a knowledgeable referee's observation. Optional.
2. **Neutral pronoun for Spinney.** "on which our formal candidate can be brought to bear... his discussion targets" — consider "that discussion targets" (house styles increasingly prefer avoiding assumed pronouns for living authors).
3. **CUP document class** (carried over since v2): confirm with the RSL editorial office that `article`-class submissions are accepted for review, or convert.

---

## Missing Related Work

- **Lampert & Nakano (2025)** — see Important Issue 1. Recommendation: cite and discuss.
- **Sher (1991), *The Bounds of Logic*; Bonnay (2008), "Logicality and Invariance," BSL** — supporting citations if Suggestion 1 is taken. Not critical.

---

## Recommendation

**ACCEPT (converged)** — 38/40, no critical issues, one small should-fix. The paper meets the convergence criterion (≥ 32/40, 0 critical). The single important issue is a bounded addition (one bibliography entry plus a short passage); after it, the paper is READY for submission to the *Review of Symbolic Logic*, modulo the mechanical CUP class conversion at camera-ready.

## Next Step

Run `/pub-revise tractatus-ontology.5` for a minimal v6 adding the Lampert & Nakano discussion (and optionally the Sher/Bonnay sentence), then mark READY.
