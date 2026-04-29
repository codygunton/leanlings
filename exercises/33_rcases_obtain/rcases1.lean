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
  sorry

-- Split an Or into two goals
theorem or_swap (h : P ∨ Q) : Q ∨ P := by
  sorry

-- Extract an existential witness
theorem exists_shift (h : ∃ n : Nat, n > 5) : ∃ n : Nat, n > 3 := by
  sorry

-- Split nested And
theorem and_reassoc (h : (P ∧ Q) ∧ R) : P ∧ (Q ∧ R) := by
  sorry