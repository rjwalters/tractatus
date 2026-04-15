import Lake
open Lake DSL

package tractatus where
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib Proofs where
  srcDir := "proofs"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.17.0"
