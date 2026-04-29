import Lake
open Lake DSL

package «leanlings» where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.28.0"

lean_lib «Leanlings»

@[default_target]
lean_exe «leanlings» where
  root := `Main
