import Lake
open Lake DSL

package tractatus

@[default_target]
lean_lib Proofs where
  srcDir := "proofs"
  globs := #[.one `TractatusOntology, .one `TractatusQuantifiers,
             .one `TractatusNOperator, .one `TractatusCompleteness,
             .one `TractatusExpressibility, .one `TractatusDecidability,
             .one `TractatusOntologyHorn, .one `TractatusOntologySpectrum,
             .one `TractatusOntologyEquiv, .one `TractatusOntologyExclusion]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.26.0"
