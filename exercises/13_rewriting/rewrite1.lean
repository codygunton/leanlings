/- # Rewriting 1: Named Lemmas

In tactics3, you used `rw [h]` where `h` was a local
hypothesis. But `rw` can also use named lemmas from
Lean's standard library :

  rw [Nat.add_comm] -- a + b → b + a
  rw [Nat.add_assoc] -- (a + b) + c → a + (b + c)
  rw [Nat.mul_comm] -- a * b → b * a

When there are multiple places `rw` could apply, provide
arguments to target a specific subexpression :

  rw [Nat.add_comm a b] -- only swaps `a + b`

Check InfoView after each `rw` to see how the goal changed.

TODO : Complete the proofs using `rw` with library lemmas.
-/

-- Nat.add_comm : ∀ (n m : Nat), n + m = m + n
-- InfoView shows: ⊢ a + b = b + a
-- One `rw` with the right lemma closes this.
theorem swap_add (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]

-- Nat.add_assoc : ∀ (n m k : Nat), n + m + k = n + (m + k)
-- Note: `a + b + c` is parsed as `(a + b) + c` by left-association.
-- InfoView shows: ⊢ a + b + c = a + (b + c)
theorem reassociate (a b c : Nat) : a + b + c = a + (b + c) := by
  rw [Nat.add_assoc]

-- Nat.mul_comm : ∀ (n m : Nat), n * m = m * n
-- InfoView shows: ⊢ a * b = b * a
theorem swap_mul (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]

-- Chain two rewrites to rearrange a sum.
-- Step 1: `rw [Nat.add_assoc]` turns (a + b) + c into a + (b + c)
-- Step 2: `rw [Nat.add_comm b c]` turns b + c into c + b
-- Check InfoView between steps to see the transformation!
theorem chain_rw (a b c : Nat) : a + b + c = a + (c + b) := by
  rw [Nat.add_assoc]
  rw [Nat.add_comm b c]
