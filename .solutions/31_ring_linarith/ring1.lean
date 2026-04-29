import Mathlib.Tactic

/- # Ring 1: Algebraic Identities with `ring` -/

theorem add_comm_int (a b : Int) : a + b = b + a := by ring

theorem distrib (a b c : Int) : a * (b + c) = a * b + a * c := by ring

theorem diff_squares (x y : Int) : (x + y) * (x - y) = x ^ 2 - y ^ 2 := by ring

theorem binomial_sq (a b : Int) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by ring

theorem cube_sum (a b : Int) :
    a ^ 3 + b ^ 3 = (a + b) * (a ^ 2 - a * b + b ^ 2) := by ring