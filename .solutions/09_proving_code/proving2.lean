def triple (n : Nat) : Nat := 3 * n

theorem triple_0 : triple 0 = 0 := by
  rfl

theorem triple_def (n : Nat) : triple n = 3 * n := by
  rfl

theorem zero_add (n : Nat) : 0 + n = n := by
  omega

theorem add_comm_example (a b : Nat) : a + b = b + a := by
  omega