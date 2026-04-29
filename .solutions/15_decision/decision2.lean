theorem two_lt_five : 2 < 5 := by decide

-- Strategy: decide handles propositional logic
theorem true_and_true : True ∧ True := by decide

-- Strategy: decide evaluates string comparison
theorem strings_differ : "hello" ≠ "world" := by decide

-- Strategy: omega for arithmetic with variables
theorem var_lt (n : Nat) : n < n + 1 := by omega

-- Strategy: decide evaluates 3 = 3 to true, picks Or.inl
theorem concrete_or : 3 = 3 ∨ 4 = 5 := by decide