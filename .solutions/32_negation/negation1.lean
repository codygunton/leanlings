import Mathlib.Tactic

/- # Negation 1: Pushing Negation with `push_neg` -/

theorem not_all_pos : ¬ ∀ n : Nat, n > 0 := by
  push_neg
  exact ⟨0, le_refl _⟩

theorem no_self_gt : ¬ ∃ n : Nat, n > n := by
  push_neg
  intro n
  omega

theorem not_both_lt (a b : Nat) : ¬ (a < b ∧ b < a) := by
  push_neg
  omega

theorem not_all_big : ¬ ∀ n : Nat, n > 0 → n > 100 := by
  push_neg
  exact ⟨1, by omega, by omega⟩