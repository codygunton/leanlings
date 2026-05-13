import Mathlib.Tactic

/- # Rcases 1: Structured Destruction

`rcases` is Mathlib's powerful version of `cases`. It uses
a pattern language with angle brackets and vertical bars :

  `rcases h with ⟨ha, hb⟩` — split `h : P ∧ Q` into ha, hb
  `rcases h with hp | hq` — split `h : P ∨ Q` into two goals
  `rcases h with ⟨w, hw⟩` — split `h : ∃ x, P x` into w, hw

The advantage over `cases` : you name everything in ONE step,
and you can nest patterns arbitrarily deep.

TODO : Replace each `sorry` with `rcases` + the right pattern.
-/

-- Split an And
theorem and_swap (h : P ∧ Q) : Q ∧ P := by
  rcases h with ⟨ hp, hq ⟩
  exact ⟨ hq, hp ⟩

-- Split an Or into two goals
-- DOTHIS YOu can't use | notation you have to use dot? syntax differnces should be noted
-- In every exerciuse, the user should be ause to use the infopane to find their way to the right result.
-- Most of them don't work this way. This is an xample of one that's really bad--basically ou can try to follow your nose and fail because there is very specific notation alloed here and the infopane doesn't help
theorem or_swap (h : P ∨ Q) : Q ∨ P := by
  rcases h with hp | hq
  · right; exact hp
  · left; exact hq
  /- THIS SHOULD TOTALLY WORK BUT IT DOESN'T -/
  /- AND THE INFOVIEW SUGGEST inl/inr but you need to use right/left? -/
  /- rcases h with hp | hq -/
  /- | inl => exact hp -/
  /- | inr => exact hq -/


-- Extract an existential witness
theorem exists_shift (h : ∃ n : Nat, n > 5) : ∃ n : Nat, n > 3 := by
  rcases h with ⟨ w, hw ⟩
  exact ⟨ w, by linarith ⟩


-- Split nested And
theorem and_reassoc (h : (P ∧ Q) ∧ R) : P ∧ (Q ∧ R) := by
  rcases h with ⟨ hpq, hr ⟩
  rcases hpq with ⟨ hp, hq ⟩
  exact ⟨ hp, ⟨ hq, hr ⟩⟩
