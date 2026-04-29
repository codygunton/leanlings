import Mathlib.Tactic

/- # Rcases 1: Structured Destruction -/

theorem and_swap (h : P ∧ Q) : Q ∧ P := by
  rcases h with ⟨hp, hq⟩
  exact ⟨hq, hp⟩

theorem or_swap (h : P ∨ Q) : Q ∨ P := by
  rcases h with hp | hq
  · right; exact hp
  · left; exact hq

theorem exists_shift (h : ∃ n : Nat, n > 5) : ∃ n : Nat, n > 3 := by
  rcases h with ⟨n, hn⟩
  exact ⟨n, by omega⟩

theorem and_reassoc (h : (P ∧ Q) ∧ R) : P ∧ (Q ∧ R) := by
  rcases h with ⟨⟨hp, hq⟩, hr⟩
  exact ⟨hp, hq, hr⟩