/- # Decision Procedures 1: omega

`omega` solves goals about **linear arithmetic** on `Nat`
and `Int`. "Linear" means : addition, subtraction,
multiplication by constants, comparisons.

What omega handles :
  ✓ a + b = b + a (addition)
  ✓ 3 * n ≤ 3 * n + 1 (constant multiplication)
  ✓ a ≤ b → a ≤ b + c (inequalities with hypotheses)
  ✓ n - m ≤ n (Nat subtraction — careful!)

What omega does NOT handle :
  ✗ a * b = b * a (variable × variable)
  ✗ n ^ 2 ≥ 0 (exponentiation)
  ✗ l ++ [] = l (non-arithmetic — use `simp`)

`omega` automatically uses hypotheses from the context.
You don't need to tell it about `h : a ≤ b` — it reads
the whole context.

TODO : Complete the proofs using `omega`.
-/

-- Basic: equality with variables
-- InfoView shows: ⊢ a + b + c = c + b + a
theorem add_shuffle (a b c : Nat) : a + b + c = c + b + a := by
  omega

-- Inequality with a hypothesis.
-- omega sees `h : a < b` in context and uses it automatically.
-- InfoView shows: a b : Nat, h : a < b ⊢ a + 1 ≤ b
theorem lt_to_le (a b : Nat) (h : a < b) : a + 1 ≤ b := by
  omega

-- Multiplication by a constant (not a variable!) is fine.
-- InfoView shows: ⊢ 2 * n + 1 < 2 * (n + 1)
theorem double_bound (n : Nat) : 2 * n + 1 < 2 * (n + 1) := by
  omega

-- omega handles multiple hypotheses at once.
-- InfoView shows: a b c : Nat, h1 : a ≤ b, h2 : b ≤ c ⊢ a ≤ c
theorem le_trans_example (a b c : Nat)
    (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  omega

-- omega understands Nat truncating subtraction.
-- (For Nat, a - b = 0 when a < b)
theorem sub_add_le (n m : Nat) : n - m ≤ n := by
  omega
