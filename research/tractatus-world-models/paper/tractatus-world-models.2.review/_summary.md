# Review summary

```json
{
  "critic": "review",
  "for_version": 2,
  "rubric": {
    "id": "anvil-pub-v2",
    "total": 44,
    "advance_threshold": 35,
    "dimensions": 9
  },
  "scores": {
    "1_rigor_of_method": [4, 6],
    "2_evidence_sufficiency": [4, 6],
    "3_clarity_of_contribution": [5, 5],
    "4_related_work_positioning": [4, 5],
    "5_reproducibility": [4, 5],
    "6_figure_table_quality": [3, 4],
    "7_prose_structural_quality": [3, 4],
    "8_citation_hygiene": [4, 5],
    "9_rhetorical_economy": [4, 4]
  },
  "total": 35,
  "advance": false,
  "verdict": "BLOCK",
  "critical_flags": ["theorem_artifact_mismatch", "render_gate_overfull_boxes"],
  "render_gate": {
    "passed": false,
    "pages": 9,
    "page_cap": null,
    "failed_gates": ["overfull_boxes"],
    "overfull_hits": 18,
    "overfull_unique_boxes": 6,
    "worst_overfull_pt": 121.5,
    "overfull_threshold_pt": 5.0,
    "placeholders": 0,
    "pdf_path": "tractatus-world-models.2/main.pdf",
    "log_path": "tractatus-world-models.2.audit/compile-log.txt"
  },
  "numeric_consistency": {
    "ran": true,
    "numbers_extracted": 42,
    "claims_checked": 0,
    "findings": 0,
    "pass": true,
    "sidecar": "tractatus-world-models.2.numeric/_review.json"
  }
}
```

Notes:

- First scored review of this thread (v2 is a format migration; no `tractatus-world-models.1.review/` exists), so `prior_rubric_id` is omitted per the first-iteration rule.
- Corpus provenance tier and subject voice tier: inactive (no `corpus:` / `subjects` declarations) — no `provenance_back_check` or `subject_voice_grounding` blocks.
- No venue overlay (`.anvil.json` declares no `venue`; see migration note F6).
