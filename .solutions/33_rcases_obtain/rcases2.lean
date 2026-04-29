import Mathlib.Tactic

/- # Rcases 2: Obtain — Structured Let-Binding -/

theorem fst_of_and (h : P ∧ Q) : P := by
  obtain ⟨hp, _⟩ := h
  exact hp

theorem exists_add (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m = 5 := by
  obtain ⟨n, hn⟩ := h
  exact ⟨5, rfl⟩

theorem exists_trans (h1 : ∃ n : Nat, n > 5) (h2 : ∀ n : Nat, n > 5 → n > 3) :
    ∃ n : Nat, n > 3 := by
  obtain ⟨n, hn⟩ := h1
  exact ⟨n, h2 n hn⟩

theorem exists_even : ∃ n : Nat, 2 ∣ n ∧ n > 0 := by
  exact ⟨2, ⟨1, rfl⟩, by omega⟩