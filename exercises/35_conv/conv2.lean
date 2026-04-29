import Mathlib.Tactic

/- # Conv 2: Navigating Deeper

Inside `conv`, you can navigate deeper into terms :

  `arg 1`, `arg 2` — select a function argument by position
  `ext x` — enter a lambda/binder
  `enter [1, 2]` — a path notation (arg 1, then arg 2)

The key insight : `conv` gives you surgical precision.
Where `rw` rewrites ALL occurrences and `simp` simplifies
EVERYTHING, `conv` lets you change exactly ONE thing.

TODO : Replace each `sorry` with `conv` blocks.
-/

-- Enter a function body with ext
-- Goal: (fun x => x + 0) = (fun x => x)
theorem conv_enter_lambda :
    (fun x : Nat => x + 0) = (fun x => x) := by
  sorry

-- Rewrite inside an argument of a function
-- Goal: Nat.succ (a + b) = Nat.succ (b + a)
theorem conv_in_arg (a b : Nat) :
    Nat.succ (a + b) = Nat.succ (b + a) := by
  sorry

-- Multiple navigations in sequence
-- Goal: (a + 0) + (0 + b) = a + b
-- Hint: conv_lhs does two things: lhs; simp and rhs; simp
theorem conv_two_spots (a b : Nat) :
    (a + 0) + (0 + b) = a + b := by
  sorry