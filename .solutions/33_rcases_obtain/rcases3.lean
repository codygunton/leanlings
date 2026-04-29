import Mathlib.Tactic

/- # Rcases 3: Nested Patterns -/

theorem or_and_extract (h : (P ∧ Q) ∨ (R ∧ S)) : P ∨ R := by
  rcases h with ⟨hp, _⟩ | ⟨hr, _⟩
  · left; exact hp
  · right; exact hr

theorem nested_exists (h : ∃ n : Nat, ∃ m : Nat, n + m = 10) :
    ∃ k : Nat, k ≤ 10 := by
  rcases h with ⟨n, m, hnm⟩
  exact ⟨n, by omega⟩

theorem rfl_pattern (h : ∃ n : Nat, n = 5 ∧ n > 3) : 5 > 3 := by
  rcases h with ⟨_, rfl, hgt⟩
  exact hgt

theorem complex_destruct (h : (P ∧ Q) ∨ (Q ∧ R)) : Q := by
  rcases h with ⟨_, hq⟩ | ⟨hq, _⟩
  · exact hq
  · exact hq