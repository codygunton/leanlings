import Mathlib.Tactic

/- # Ring 3: Combining Tactics

Real proofs often need multiple tactics. Common combos :

  `ring` + `linarith` : prove an algebraic fact, then use it
  `have ... := by ring` + `linarith` : introduce intermediate steps
  `norm_num` : evaluate concrete numeric expressions

`norm_num` is like `decide` for arithmetic — it computes
concrete numeric facts : `2 + 3 = 5`, `17 is prime`, etc.

TODO : Replace each `sorry` with the right tactic(s).
       Some need `ring`, some `linarith`, some `norm_num`.
-/

-- norm_num: concrete computation
theorem concrete1 : (37 : Int) * 41 = 1517 := by
  sorry

-- norm_num: primality check (use `norm_num` or `decide`)
theorem seven_prime : Nat.Prime 7 := by
  sorry

-- ring then linarith: show x^2 ≥ 0 for Int
-- Hint: this is ` sq_nonneg x` but you can also do it manually
theorem sq_nonneg_manual (x : Int) : x ^ 2 ≥ 0 := by
  sorry

-- Combine: use `have` to establish an algebraic fact, then linarith
-- Hint: `have h := sq_nonneg (a - b)` gives you `(a - b)^2 ≥ 0`
theorem am_gm_special (a b : Int) : a ^ 2 + b ^ 2 ≥ 2 * a * b := by
  sorry

-- Choose the right tool for each goal
theorem mixed (n : Nat) (h : n > 0) : n * n > 0 := by
  sorry