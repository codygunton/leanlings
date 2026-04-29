theorem flatten (a b c : Nat) : a + (b + c) = a + b + c := by
  rw [← Nat.add_assoc]

-- Strategy: substitute x = 5, then 5 + 1 = 6 by computation
theorem rw_then_rfl (x : Nat) (h : x = 5) : x + 1 = 6 := by
  rw [h]

-- Strategy: substitute a = b + 1, then omega closes b + 1 > b
theorem rw_then_omega (a b : Nat) (h : a = b + 1) : a > b := by
  rw [h]; omega

-- Strategy: chain substitutions a → b → c
theorem chain_hyps (a b c : Nat) (h1 : a = b) (h2 : b = c) :
    a + 1 = c + 1 := by
  rw [h1, h2]