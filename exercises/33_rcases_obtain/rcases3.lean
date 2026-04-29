import Mathlib.Tactic

/- # Rcases 3: Nested Patterns

`rcases` patterns can nest arbitrarily :

  `⟨⟨a, b⟩, c⟩` — nested And : `(A ∧ B) ∧ C`
  `⟨a, b⟩ | ⟨c, d⟩` — Or of Ands : `(A ∧ B) ∨ (C ∧ D)`
  `rfl` — immediately rewrite an equality

The `rfl` pattern is a power feature : if one component is
an equality `x = expr`, writing `rfl` in that position
substitutes `expr` for `x` everywhere.

  rcases h with ⟨rfl, hp⟩ -- if h : x = 5 ∧ P x, now P 5

TODO : Replace each `sorry` with the right `rcases` pattern.
-/

-- Or of Ands: extract from both sides
theorem or_and_extract (h : (P ∧ Q) ∨ (R ∧ S)) : P ∨ R := by
  sorry

-- Nested existential
theorem nested_exists (h : ∃ n : Nat, ∃ m : Nat, n + m = 10) :
    ∃ k : Nat, k ≤ 10 := by
  sorry

-- rfl pattern: substitute equality immediately
theorem rfl_pattern (h : ∃ n : Nat, n = 5 ∧ n > 3) : 5 > 3 := by
  sorry

-- Complex combination
theorem complex_destruct (h : (P ∧ Q) ∨ (Q ∧ R)) : Q := by
  sorry