/- # Nat Proofs 3: Induction (Advanced)

Building on the induction section, let's prove more
substantial properties.

For custom functions, you often need :
  1. `induction` to recurse on the structure
  2. `simp [function_name]` to unfold definitions
  3. The induction hypothesis `ih`
  4. `rw [lemma]` to rewrite with library lemmas

  Useful lemmas :
    - `Nat.mul_add` : a * (b + c) = a * b + a * c
    - `Nat.add_mul` : (a + b) * c = a * c + b * c
    - `Nat.mul_comm` : a * b = b * a

    TODO : Prove these properties using induction.
    -/

-- Sum of first n natural numbers
def sumTo : Nat → Nat
| 0 => 0
| n + 1 => sumTo n + (n + 1)

-- Gauss's formula: sumTo n = n * (n + 1) / 2
-- Since we're using Nat (no fractions), prove the doubled version:
-- QUESTION: this works but it's ugly, without pulling out any big hammers,
-- how do i do this more systematically so that the goal becomes more an dmore simple?
-- Also: what is the big hammer way?
theorem sumTo_formula (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => trivial
  | succ n ih => rw [sumTo]
                 rw [Nat.mul_add]
                 simp [ih]
                 rw [Nat.mul_add]
                 rw [Nat.mul_add]
                 rw [Nat.add_mul]
                 rw [Nat.mul_add]
                 rw [Nat.mul_add]
                 omega


-- Sum is monotone
theorem sumTo_mono (n : Nat) : sumTo n ≤ sumTo (n + 1) := by
  rw [sumTo]
  simp

