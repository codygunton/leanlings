import Mathlib.Tactic

/- # Conv 3: Conv in Practice

In real proofs, `conv` is most useful when `rw` would change
the wrong occurrence. A common pattern :

  1. Try `rw` — if it rewrites the wrong thing, switch to `conv`
  2. Use `conv_lhs` or `conv_rhs` to target a side
  3. Navigate with `lhs`/`rhs`/`arg` to the right spot
  4. Apply `rw`, `ring`, or `simp` there

TODO : Replace each `sorry` with the best approach.
       Some can use plain `rw`; others need `conv`.
-/

-- Plain rw works (only one occurrence)
theorem just_rw (a b : Nat) (h : a = b) : a + a = b + b := by
  sorry

-- conv needed: only rewrite first a
-- Goal: a + a = b + a (rewrite first a to b, not second)
theorem conv_needed (a b : Nat) (h : a = b) : a + a = b + a := by
  sorry

-- conv with ring inside
-- Goal: (a + b) * (a + b) = (b + a) * (a + b)
theorem conv_ring (a b : Nat) :
    (a + b) * (a + b) = (b + a) * (a + b) := by
  sorry

-- Choose your tool: rw, conv, simp, or ring?
theorem choose_tool (a b c : Nat) :
    (a + b) + c = (b + a) + c := by
  sorry