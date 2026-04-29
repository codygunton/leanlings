import Mathlib.Tactic

/- # Negation 1: Pushing Negation with `push_neg`

When you see `¬ ∀ x, P x` or `¬ ∃ x, P x`, the negation
is "stuck" on the outside. `push_neg` pushes it inward :

  `¬ ∀ x, P x` → `∃ x, ¬ P x`
  `¬ ∃ x, P x` → `∀ x, ¬ P x`
  `¬ (a < b)` → `b ≤ a`
  `¬ (a = b)` → `a ≠ b`

This is De Morgan's law for quantifiers + inequality flipping.
After `push_neg`, the goal is usually much easier to prove.

TODO : Replace each `sorry` with `push_neg` followed by
      whatever closes the resulting goal.
-/

-- ¬ ∀ n, n > 0 becomes ∃ n, n ≤ 0
-- After push_neg, provide the witness 0.
theorem not_all_pos : ¬ ∀ n : Nat, n > 0 := by
  sorry

-- ¬ ∃ n, n > n becomes ∀ n, n ≤ n
-- After push_neg, this follows from le_refl.
theorem no_self_gt : ¬ ∃ n : Nat, n > n := by
  sorry

-- ¬ (a < b ∧ b < a) becomes a ≥ b ∨ b ≥ a (or similar)
-- After push_neg, omega can finish.
theorem not_both_lt (a b : Nat) : ¬ (a < b ∧ b < a) := by
  sorry

-- Negating an implication inside a forall
-- ¬ ∀ n, n > 0 → n > 100 becomes ∃ n, n > 0 ∧ n ≤ 100
theorem not_all_big : ¬ ∀ n : Nat, n > 0 → n > 100 := by
  sorry