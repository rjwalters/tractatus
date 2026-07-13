# Audit flags for tractatus-world-models.2

## Critical flags (block advancement to AUDITED)

- **Theorem-statement / artifact mismatch** (Theorem 4.3, `thm:horn-boundary`, §4;
  echoed in intro item (C4), main.tex lines 145–150 and 358–364): the paper states a
  **per-valuation** realizability boundary — "A Boolean valuation v : S → Bool is the
  profile of some world of Horn(S, cs) iff v satisfies every clause: for all (a, b) ∈
  cs, if v(a) then v(b)" — and attributes it to `horn_realizable_iff`. The actual Lean
  theorem (`proofs/TractatusOntologyHorn.lean` lines 128–140) is a **global**
  biconditional: *every* assignment `S → Prop` is realizable **iff every clause is
  trivial** (`∀ c ∈ cs, c.1 = c.2`). These are different theorems, and no declaration
  proving the paper's per-valuation Horn statement exists anywhere in the four modules
  (grep over Horn/Equiv/Spectrum/Exclusion; the per-valuation shape exists only on the
  exclusion side, `exclusion_realizable_iff`, which is likely how the mis-statement
  arose). Because §1 asserts "Every result above is formalized in Lean 4 and checked
  by its kernel," Theorem 4.3 as printed is a kernel-checked-claim that the kernel did
  not check. Fix options for the reviser: (a) restate Thm 4.3 to match the Lean
  statement (arguably the better "TLP 2.061 boundary": independence survives iff the
  clause list says nothing), adjusting the contrapositive gloss that follows; or (b)
  add the per-valuation lemma to `TractatusOntologyExclusion.lean`/`Horn.lean` (it is
  a few lines, mirroring `exclusion_realizable_iff`) and cross-reference the new name.
  The downstream uses (Lemma 5.3, Thm 5.4 via the top world) do NOT depend on the
  mis-stated version — the separation theorem chain was re-verified and is sound.

## Non-critical notes

- **Proof-length claim** (§5, proof sketch of Theorem 5.4): "The kernel-checked proof
  is nine lines" — the proof body of `exclusion_not_horn` is 6 tactic lines (11 lines
  including the statement). No counting convention yields nine. Reword.
- **Possible quotation inexactness** (TLP 3.42, §3): the paper quotes "...only one
  place in logical space, **but** the whole of logical space must already be given by
  it"; the cited Pears–McGuinness translation reads "...logical space: **nevertheless**
  the whole of logical space must already be given by it" (from model knowledge —
  source not on disk, hence non-critical). Verify against the translation cited in
  `refs.bib` (`wittgenstein1921`, Pears & McGuinness).
- **Unpaged direct quote** (`hacker1986`, §1): the Hacker "collapsed over its
  inability to solve one problem" quote carries no page number and the source is not
  on disk. Author should verify wording and add a page reference.
- **Unverified citations** (11): claim-support for `wittgenstein1929`, `ramsey1923`,
  `hacker1986`, `moss2012`, `button2017`, `skyrms1981`, `armstrong1989`, `evans2014`,
  `mckinsey1943`, `horn1951`, `benzmuller2014` could not be verified against primary
  sources (no `<thread>/refs/` directory on disk). All are consistent with the
  verified v1 `literature.md` annotations. Author is responsible for off-disk
  verification.
- **Unused bib entries** (3): `lokhorst1988`, `spinney2022`, `weiss2017` are defined
  but never cited (harmless under bibtex; note Spinney 2022 is the BRIEF's venue
  precedent — consider citing or dropping).
- **Overfull hboxes** (6, cosmetic): worst is 121.5pt (source lines 419–424, the
  `colorModel` display), also 75.3pt (Appendix module path, lines 639–642) and 73.2pt
  (Definition 2.3, lines 217–222). No content loss; polish before submission.

## Verified clean (for the record)

- Build: pdflatex → bibtex → pdflatex ×2, all exit 0; `main.pdf` 9 pages; 0 unresolved
  `??`, 0 undefined citations/references; bibtex 0 errors 0 warnings.
- Citations: 14/14 cited keys resolve; bibliographic data field-checked against the v1
  `literature.md` ground truth (all DOIs/volumes/pages match).
- Lean artifact: 42/42 Appendix-referenced declarations exist in the stated modules;
  declaration count 63 exactly as claimed; ~1,000 lines (actual 1,026); full
  `lake build` clean (0 errors/warnings, exactly the 9 documented `#eval` info lines);
  0 sorries; axiom footprint kernel-verified via `#print axioms` on 10 headline
  theorems — all within {`propext`, `Classical.choice`, `Quot.sound`}.
- Figure: `figures/spectrum.pdf` not stale relative to `figures/src/`.
