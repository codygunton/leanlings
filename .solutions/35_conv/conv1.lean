import Mathlib.Tactic

/- # Conv 1: Targeted Rewriting -/

theorem rw_lhs_only (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  conv_lhs => rw [h]

theorem rw_first_only (a b : Nat) :
    (a + b) + (a + b) = (b + a) + (a + b) := by
  conv_lhs => lhs; rw [Nat.add_comm]

theorem rw_rhs_only (a b : Nat) (h : a = b) : b + 1 = a + 1 := by
  conv_rhs => rw [h]

theorem simp_lhs (a : Nat) : a + 0 + 0 = a := by
  conv_lhs => simp