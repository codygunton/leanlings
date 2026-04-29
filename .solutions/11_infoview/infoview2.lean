def double (n : Nat) : Nat := n + n

theorem double_self (n : Nat) : double n = n + n := by
  unfold double
  rfl

theorem double_two_mul (n : Nat) : double n = 2 * n := by
  unfold double
  omega

theorem double_double (n : Nat) : double (double n) = 4 * n := by
  simp [double]
  omega

def triple (n : Nat) : Nat := 3 * n

theorem triple_vs_double (n : Nat) : triple n = double n + n := by
  simp [triple, double]
  omega