/- # Nat Proofs 2: Order Properties

Nat has a natural ordering. Useful lemmas :
  - `Nat.le_refl` : n <= n
  - `Nat.le_trans` : a <= b -> b <= c -> a <= c
  - `Nat.lt_of_lt_of_le` : a < b -> b <= c -> a < c

  `omega` can prove most linear arithmetic goals involving
  addition, subtraction, and comparisons.

  TODO : Prove these ordering properties.
  -/

-- Transitivity of <=
theorem my_le_trans (a b c : Nat) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  exact Nat.le_trans h1 h2

-- Adding preserves <=
theorem add_le_add (a b c : Nat) (h : a ≤ b) : a + c ≤ b + c := by
  /- have h' : a + c ≤ b + c := Nat.add_le_add_right h c -/
  /- exact h' -/
  exact Nat.add_le_add_right h c

-- A number is less than or equal to its double
theorem le_double (n : Nat) : n ≤ 2 * n := by
  omega

-- If a <= b and b <= a, then a = b (antisymmetry)
theorem le_antisymm' (a b : Nat) (h1 : a ≤ b) (h2 : b ≤ a) : a = b := by
  omega