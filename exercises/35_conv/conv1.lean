import Mathlib.Tactic

/- # Conv 1: Targeted Rewriting

`rw` rewrites the FIRST match it finds. But sometimes you
want to rewrite in a specific location. `conv` lets you
navigate into subexpressions :

  `conv_lhs => ...` — operate on the left side of the goal
  `conv_rhs => ...` — operate on the right side of the goal

Inside `conv` :
  `rw [lemma]` — rewrite at the current position
  `lhs` — descend into the left argument
  `rhs` — descend into the right argument
  `ring` — close with ring at current position
  `simp` — simplify at current position

Example :
  -- Goal: (a + b) + (a + b) = (b + a) + (a + b)
  conv_lhs => lhs; rw [Nat.add_comm]
  -- Only the first (a + b) gets rewritten!

TODO : Replace each `sorry` with `conv` blocks.
-/

-- Rewrite only the left side
-- Hint: conv_lhs => rw [h]
theorem rw_lhs_only (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  sorry

-- Rewrite only the left occurrence of (a + b)
-- Hint: conv_lhs => lhs; rw [Nat.add_comm]
theorem rw_first_only (a b : Nat) :
    (a + b) + (a + b) = (b + a) + (a + b) := by
  sorry

-- Rewrite on the right side
theorem rw_rhs_only (a b : Nat) (h : a = b) : b + 1 = a + 1 := by
  sorry

-- Simplify only on one side
theorem simp_lhs (a : Nat) : a + 0 + 0 = a := by
  sorry