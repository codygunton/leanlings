import Mathlib.Tactic

/- # Negation 3: Choosing the Right Tool

You now know three negation tactics :
  `push_neg` — simplify ¬ in the goal
  `contrapose` — flip P → Q to ¬Q → ¬P
  `by_contra` — assume ¬(goal), derive False

Pick the right one for each goal below.
ODTHIS : if you'r egoing to say the user should pick hich one, we shouldn't tell them which one to use in each exercise

TODO : Replace each `sorry` with the right approach.
-/

theorem exists_nonprime : ¬ ∀ n : Nat, n ≥ 2 → Nat.Prime n := by
  push_neg
  exact ⟨4, by decide⟩

-- DOTHIS: solution has at h notation whicih I don't think has been introduced yet
-- I think we probably need a separate lession on this at stuff
theorem lt_of_sq_lt_four (n : Nat) : n ^ 2 < 4 → n < 2 := by
  contrapose!
  have h2 := 2 ^ 2 = 4


theorem ne_nil_of_mem {α : Type} {a : α} {l : List α} (h : a ∈ l) : l ≠ [] := by
  sorry

theorem not_all_le_self : ¬ ∀ n : Nat, n + 1 ≤ n := by
  sorry
