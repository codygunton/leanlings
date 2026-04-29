import Mathlib.Tactic

/- # Search 1: Finding Lemmas with `exact?` -/

theorem zero_le_any (n : Nat) : 0 ≤ n := Nat.zero_le n

theorem le_self (n : Nat) : n ≤ n := le_refl n

theorem succ_pos (n : Nat) : 0 < n + 1 := Nat.succ_pos n

theorem add_comm_nat (a b : Nat) : a + b = b + a := Nat.add_comm a b