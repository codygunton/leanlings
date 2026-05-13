import Mathlib.Tactic

/- # Rcases 3: Nested Patterns

`rcases` patterns can nest arbitrarily :

  `⟨⟨a, b⟩, c⟩` — nested And : `(A ∧ B) ∧ C`
  `⟨a, b⟩ | ⟨c, d⟩` — Or of Ands : `(A ∧ B) ∨ (C ∧ D)`
  `rfl` — immediately rewrite an equality

DOTHIS : improve phrasing; unclear what "one component" means here
The `rfl` pattern is a power feature : if one component is
an equality `x = expr`, writing `rfl` in that position
substitutes `expr` for `x` everywhere.

  rcases h with ⟨rfl, hp⟩ -- if h : x = 5 ∧ P x, now P 5

TODO : Replace each `sorry` with the right `rcases` pattern.
-/

-- Or of Ands: extract from both sides
-- NOTETHAT: this is so unergonomic, goddamn just try changing _anything_
theorem or_and_extract (h : (P ∧ Q) ∨ (R ∧ S)) : P ∨ R := by
  rcases h with hpq | hrs
  rcases hpq with ⟨ hp, hq ⟩
  · left; exact hp
  rcases hrs with ⟨ hr, hs ⟩
  · right; exact hr

-- Nested existential
theorem nested_exists (h : ∃ n : Nat, ∃ m : Nat, n + m = 10) :
    ∃ k : Nat, k ≤ 10 := by
      obtain ⟨ w1, w2, h_sum ⟩ := h
      exact ⟨ w1, by linarith ⟩

-- rfl pattern: substitute equality immediately
-- DOTHIS: more examples of this are needed to illustrate what it does
theorem rfl_pattern (h : ∃ n : Nat, n = 5 ∧ n > 3) : 5 > 3 := by
  /- obtain ⟨ w, hw ⟩ := h -/
  /- linarith -/
  rcases h with ⟨x, rfl, hgt⟩
  exact hgt

-- Complex combination
theorem complex_destruct (h : (P ∧ Q) ∨ (Q ∧ R)) : Q := by
  rcases h with hpq | hqr
  rcases hpq with ⟨ hp, hq ⟩
  exact hq
  rcases hqr with ⟨ hq, hr ⟩
  exact hq
  /- -- cleaner -/
  /- rcases h with ⟨_, hq⟩ | ⟨hq, _⟩ -/
  /- · exact hq -/
  /- · exact hq -/
