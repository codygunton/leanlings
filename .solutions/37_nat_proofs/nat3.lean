def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => sumTo n + (n + 1)

-- Strategy: induct on n.
-- Base case: both sides are 0 (simp handles it).
-- Inductive step: unfold sumTo one step, use IH to rewrite,
-- then let omega or ring-style rewrites close the arithmetic.
theorem sumTo_formula (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => simp [sumTo]
  | succ n ih =>
    simp [sumTo]
    rw [Nat.mul_add, ih, ← Nat.add_mul, Nat.mul_comm]

theorem sumTo_mono (n : Nat) : sumTo n ≤ sumTo (n + 1) := by
  simp [sumTo]