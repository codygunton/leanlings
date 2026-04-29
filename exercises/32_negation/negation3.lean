import Mathlib.Tactic

/- # Negation 3: Choosing the Right Tool

You now know three negation tactics :
  `push_neg` — simplify ¬ in the goal
  `contrapose` — flip P → Q to ¬Q → ¬P
  `by_contra` — assume ¬(goal), derive False

Pick the right one for each goal below.

TODO : Replace each `sorry` with the right approach.
-/

-- push_neg: simplify the negated quantifier
theorem exists_nonprime : ¬ ∀ n : Nat, n ≥ 2 → Nat.Prime n := by
  sorry

-- contrapose: flip the direction, then prove the easier version
theorem lt_of_sq_lt_four (n : Nat) : n ^ 2 < 4 → n < 2 := by
  sorry

-- by_contra: assume ¬ and derive contradiction
-- If a list has an element, it's not empty
theorem ne_nil_of_mem {α : Type} {a : α} {l : List α} (h : a ∈ l) : l ≠ [] := by
  sorry

-- Combine: push_neg then omega/decide
theorem not_all_le_self : ¬ ∀ n : Nat, n + 1 ≤ n := by
  sorry