theorem swap_add (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]

theorem reassociate (a b c : Nat) : a + b + c = a + (b + c) := by
  rw [Nat.add_assoc]

theorem swap_mul (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]

-- Strategy: reassociate, then swap the inner sum
theorem chain_rw (a b c : Nat) : a + b + c = a + (c + b) := by
  rw [Nat.add_assoc, Nat.add_comm b c]