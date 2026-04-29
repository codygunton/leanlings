import Mathlib.Tactic

/- # Negation 3: Choosing the Right Tool -/

theorem exists_nonprime : ¬ ∀ n : Nat, n ≥ 2 → Nat.Prime n := by
  push_neg
  exact ⟨4, by omega, by decide⟩

theorem lt_of_sq_lt_four (n : Nat) : n ^ 2 < 4 → n < 2 := by
  contrapose
  intro h
  push_neg at h ⊢
  nlinarith

theorem ne_nil_of_mem {α : Type} {a : α} {l : List α} (h : a ∈ l) : l ≠ [] := by
  by_contra heq
  rw [heq] at h
  exact absurd h List.not_mem_nil

theorem not_all_le_self : ¬ ∀ n : Nat, n + 1 ≤ n := by
  push_neg
  exact ⟨0, by omega⟩