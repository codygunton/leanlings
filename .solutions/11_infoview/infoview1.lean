theorem eq_refl : 42 = 42 := by
  rfl

theorem string_concat : "hello" ++ " world" = "hello world" := by
  rfl

theorem concrete_arith : 3 + 4 = 7 := by
  rfl

theorem add_zero_right (n : Nat) : n + 0 = n := by
  rfl

theorem add_zero_left (n : Nat) : 0 + n = n := by
  omega

theorem add_assoc_example (a b c : Nat) : a + b + c = a + (b + c) := by
  omega