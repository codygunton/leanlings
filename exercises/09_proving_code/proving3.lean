/- # Proving Code 3: Simplification with simp

You know `omega` for arithmetic. But what about goals that
mention YOUR OWN function definitions?

    double n = 2 * n -- omega doesn't know what `double` means!

`simp [f]` unfolds the definition of `f` and simplifies.
If the result is arithmetic, `omega` can finish :

    simp [double] -- transforms `double n` → `n + n`
    omega -- now it's just arithmetic: n + n = 2 * n ✓

This two-step pattern is very common :
  1. `simp [yourFunction]` — expose what the function does
  2. `omega` or `rfl` — close the resulting goal

  TIP : After `simp [double]`, check InfoView to see how
  the goal changed. Understanding this transformation is
  the key to writing proofs about your code.

TODO : Complete the proofs using `simp` and `omega`.
-/

def double (n : Nat) : Nat := n + n

-- After `simp [double]`, InfoView shows: ⊢ n + n = 2 * n
-- Then `omega` finishes the arithmetic.
theorem double_is_mul2 (n : Nat) : double n = 2 * n := by
  sorry

-- simp [double] transforms `double a ≤ double b` into `a + a ≤ b + b`
-- omega uses the hypothesis `a ≤ b` to close the goal.
theorem double_le (a b : Nat) (h : a ≤ b) : double a ≤ double b := by
  sorry

-- Two nested doubles: simp [double] unfolds both at once.
theorem double_double (n : Nat) : double (double n) = 4 * n := by
  sorry