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
  omega

-- norm_num: primality check (use `norm_num` or `decide`)
theorem seven_prime : Nat.Prime 7 := by
  decide

-- ring then linarith: show x^2 ≥ 0 for Int
-- Hint: this is ` sq_nonneg x` but you can also do it manually
-- DOTHIS: the example solution for this one is lame, be more manual like mine, except ther ei sno linarith or rin?
theorem sq_nonneg_manual (x : Int) : x ^ 2 ≥ 0 := by
  cases x with
  | ofNat a => simp
  | negSucc a => rw [sq]
                 rw [Int.negSucc_eq]
                 rw [neg_mul_neg]
                 simp
                 omega


-- Combine: use `have` to establish an algebraic fact, then linarith
-- Hint: `have h := sq_nonneg (a - b)` gives you `(a - b)^2 ≥ 0`
-- DOTHIS there are insufficient preparations for this one
-- DOTHIS: unclear that linarith receives a hypothesi sor that it has ot be explicitly supplised even with the have statement 
--         also: solution contains nlinarith which hasn't been introduced and isn't necessary
theorem am_gm_special (a b : Int) : a ^ 2 + b ^ 2 ≥ 2 * a * b := by
  have h := sq_nonneg (a - b)
  linarith

-- Choose the right tool for each goal
--  DOTHIS: solution has not been introudced. there should be another way. This solution and hte previous should be expalining how to do rewriting?
theorem mixed (n : Nat) (h : n > 0) : n * n > 0 := by
  positivity
