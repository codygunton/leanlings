import Mathlib.Tactic

/- # Ring 3: Combining Tactics -/

theorem concrete1 : (37 : Int) * 41 = 1517 := by norm_num

theorem seven_prime : Nat.Prime 7 := by decide

theorem sq_nonneg_manual (x : Int) : x ^ 2 ≥ 0 := sq_nonneg x

theorem am_gm_special (a b : Int) : a ^ 2 + b ^ 2 ≥ 2 * a * b := by
  have h := sq_nonneg (a - b)
  nlinarith [h]

theorem mixed (n : Nat) (h : n > 0) : n * n > 0 := by positivity