theorem arith1 (n : Nat) : n + 0 = n := by omega

theorem arith2 (a b : Nat) (h : a ≤ b) : a ≤ b + 1 := by omega

theorem simp_example (l : List Nat) : l ++ [] = l := by simp

theorem decide_example : 2 < 5 := by decide