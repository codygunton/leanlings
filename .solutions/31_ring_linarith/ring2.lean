import Mathlib.Tactic

/- # Ring 2: Linear Arithmetic with `linarith` -/

theorem from_hyp (x : Int) (h : x > 0) : x ≥ 1 := by linarith

theorem two_hyps (a b : Int) (h1 : a + b = 10) (h2 : a - b = 4) : a = 7 := by linarith

theorem chain (x y z : Int) (h1 : x < y) (h2 : y < z) : x < z := by linarith

theorem avg_bound (a b : Int) (h1 : a ≤ 10) (h2 : b ≤ 10) : a + b ≤ 20 := by linarith

theorem squeeze (x : Int) (h1 : 2 * x + 1 ≤ 7) (h2 : x ≥ 2) : x = 2 ∨ x = 3 := by omega