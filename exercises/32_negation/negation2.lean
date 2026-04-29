import Mathlib.Tactic

/- # Negation 2: Contraposition with `contrapose`

`contrapose` transforms a goal `P → Q` into `¬Q → ¬P`.
This is logically equivalent but sometimes easier to prove.

  -- Goal: P → Q
  -- After `contrapose`:
  -- Goal: ¬Q → ¬P

`contrapose!` is `contrapose` followed by `push_neg` — it
both contraposes AND simplifies the negations.

`by_contra` is different : it assumes `¬ (goal)` and asks
you to derive `False`. This is proof by contradiction.

  -- Goal: P
  -- After `by_contra h`:
  -- h : ¬P
  -- Goal: False

TODO : Replace each `sorry` with the right tactic(s).
-/

-- Contraposition: easier to prove ¬Q → ¬P
-- "if n^2 = 0 then n = 0" via contrapositive
theorem sq_zero_imp (n : Nat) : n ^ 2 = 0 → n = 0 := by
  sorry

-- contrapose! combines contrapose + push_neg
-- "if n < m then n ≠ m"
theorem lt_imp_ne (n m : Nat) : n < m → n ≠ m := by
  sorry

-- by_contra: assume the negation, derive False
-- Double negation elimination
theorem dne (p : Prop) (h : ¬¬p) : p := by
  sorry

-- by_contra with hypotheses
theorem not_both_true (p q : Prop) (h1 : p → ¬q) (hp : p) (hq : q) : False := by
  sorry