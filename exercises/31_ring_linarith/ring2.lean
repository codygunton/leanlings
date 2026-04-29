import Mathlib.Tactic

/- # Ring 2: Linear Arithmetic with `linarith`

`linarith` proves linear arithmetic goals — inequalities and
equalities involving `+`, `-`, and constants times variables.

It automatically uses ALL hypotheses in your context.
Think of it as "omega for Real/Rat/Int with hypotheses."

  example (x : Int) (h1 : x > 0) (h2 : x < 5) : x ≤ 4 := by
    linarith

`linarith` is stronger than `omega` for non-Nat types and
when you have hypotheses with inequalities. But `omega` is
better for divisibility and modular arithmetic on Nat.

TODO : Replace each `sorry` with `linarith`.
-/

-- Simple: use a hypothesis
theorem from_hyp (x : Int) (h : x > 0) : x ≥ 1 := by
  sorry

-- Combine two hypotheses
theorem two_hyps (a b : Int) (h1 : a + b = 10) (h2 : a - b = 4) : a = 7 := by
  sorry

-- Chain of inequalities
theorem chain (x y z : Int) (h1 : x < y) (h2 : y < z) : x < z := by
  sorry

-- Averaging
theorem avg_bound (a b : Int) (h1 : a ≤ 10) (h2 : b ≤ 10) : a + b ≤ 20 := by
  sorry

-- More hypotheses
theorem squeeze (x : Int) (h1 : 2 * x + 1 ≤ 7) (h2 : x ≥ 2) : x = 2 ∨ x = 3 := by
  omega -- this one needs omega (discrete), not linarith
  -- QUESTION: why doesn't `linarith` work here?
  -- Because `linarith` proves ONE inequality, not disjunctions.
  -- For "x = 2 ∨ x = 3", you need case analysis.