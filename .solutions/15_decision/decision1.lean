theorem add_shuffle (a b c : Nat) : a + b + c = c + b + a := by omega

-- Strategy: omega uses h : a < b directly
theorem lt_to_le (a b : Nat) (h : a < b) : a + 1 ≤ b := by omega

theorem double_bound (n : Nat) : 2 * n + 1 < 2 * (n + 1) := by omega

-- Strategy: omega chains h1 and h2 transitively
theorem le_trans_example (a b c : Nat)
    (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by omega

-- Strategy: omega understands Nat truncating subtraction
theorem sub_add_le (n m : Nat) : n - m ≤ n := by omega