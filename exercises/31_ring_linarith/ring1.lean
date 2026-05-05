import Mathlib.Tactic

/- # Ring 1: Algebraic Identities with `ring`

`ring` proves equalities in commutative (semi)rings — it handles
`+`, `*`, `-`, `^` on types like `Int`, `Nat`, `Rat`, etc.

Unlike `omega` (which only knows linear arithmetic), `ring` handles
**polynomials** : it can prove `(x + y)^2 = x^2 + 2*x*y + y^2`.

When to use `ring` vs `omega` :
  - Variables with multiplication/exponents → `ring`
  - Inequalities (≤, <) → `omega` or `linarith`
  - Pure Nat with no multiplication → either works
  - `ring` works on Int, Rat, Real; `omega` only on Nat/Int

TODO : Replace each `sorry` with `ring`.
-/

-- Basic commutativity
theorem add_comm_int (a b : Int) : a + b = b + a := by
  omega

-- Distributive law
theorem distrib (a b c : Int) : a * (b + c) = a * b + a * c := by
  simp only [mul_add]


-- Difference of squares
theorem diff_squares (x y : Int) : (x + y) * (x - y) = x ^ 2 - y ^ 2 := by
  ring

-- Expand a binomial
theorem binomial_sq (a b : Int) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  ring

-- A trickier identity
theorem cube_sum (a b : Int) :
    a ^ 3 + b ^ 3 = (a + b) * (a ^ 2 - a * b + b ^ 2) := by
  ring
