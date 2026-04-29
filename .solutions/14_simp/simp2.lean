def double (n : Nat) : Nat := n + n
def square (n : Nat) : Nat := n * n

-- Strategy: simp [double] unfolds to n + n = 2 * n, then omega closes arithmetic
theorem double_eq (n : Nat) : double n = 2 * n := by
  simp [double]; omega

theorem square_three : square 3 = 9 := by
  simp [square]

theorem precise_simp (l : List Nat) : l ++ [] = l := by
  simp only [List.append_nil]

theorem double_vs_square_zero : double 0 = square 0 := by
  simp [double, square]