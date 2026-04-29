def double (n : Nat) : Nat := n + n

-- Strategy: unfold `double`, then arithmetic
theorem double_is_mul2 (n : Nat) : double n = 2 * n := by
  simp [double]; omega

-- Strategy: unfold `double`, use hypothesis h via omega
theorem double_le (a b : Nat) (h : a ≤ b) : double a ≤ double b := by
  simp [double]; omega

-- Strategy: simp unfolds both layers of double
theorem double_double (n : Nat) : double (double n) = 4 * n := by
  simp [double]; omega