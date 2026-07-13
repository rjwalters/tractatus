# Review summary

```json
{
  "critic": "review",
  "for_version": 9,
  "rubric": {
    "id": "anvil-pub-v2",
    "total": 44,
    "advance_threshold": 35,
    "dimensions": 9,
    "prior_rubric_id": null,
    "prior_rubric_inferred": "/40-legacy"
  },
  "render_gate": {
    "passed": true,
    "pages": 25,
    "page_cap": null,
    "overfull_boxes": 0,
    "placeholders": 0
  },
  "scores": {
    "1_rigor_of_method": [6, 6],
    "2_evidence_sufficiency": [6, 6],
    "3_clarity_of_contribution": [5, 5],
    "4_related_work_positioning": [4, 5],
    "5_reproducibility": [5, 5],
    "6_figure_table_quality": [4, 4],
    "7_prose_structural_quality": [4, 4],
    "8_citation_hygiene": [5, 5],
    "9_rhetorical_economy": [3, 4]
  },
  "total": 42,
  "advance": true,
  "critical_flags": 0
}
```

Note: `prior_rubric_id` is `null` because the prior sibling
`tractatus-ontology.8.review/` is a legacy (pre-anvil) workflow review with
no `_meta.json`; inferred as `/40-legacy` (it scored 39/40 on the old
8-dimension rubric). The corpus provenance tier and subject voice tier are
inactive for this project (no BRIEF), so no `provenance_back_check` or
`subject_voice_grounding` blocks are emitted.
