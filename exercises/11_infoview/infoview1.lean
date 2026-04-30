/- # InfoView 1: Reading the Proof State

The **Lean InfoView** panel is your most important tool for
writing proofs. In VS Code, it's the panel on the right
(View → Lean 4: Infoview). In other editors, look for
"Lean Infoview" or "Lean Goals".

When your cursor is inside a `by` block, InfoView shows :

    [hypotheses] ← what you know (facts, assumptions)
    ⊢ [goal] ← what you need to prove

As you type tactics, the state updates. This is how you
navigate : look at the goal, pick a tactic, check the new
goal, repeat.

HOW TO DO THIS EXERCISE :
  For each theorem below, type `by` and place your cursor
  after it. Read the InfoView to understand the goal. Then
  replace `sorry` with the right tactic.

  All proofs here need just ONE tactic : either `rfl` or `omega`.
  The InfoView goal tells you which.

TODO : Replace each `sorry` with `rfl` or `omega`.
-/

-- InfoView shows: ⊢ 42 = 42
-- Both sides are the same value → which tactic?
theorem eq_refl : 42 = 42 := rfl

-- InfoView shows: ⊢ "hello" ++ " world" = "hello world"
-- Lean computes string concatenation → which tactic?
theorem string_concat : "hello" ++ " world" = "hello world" := by
  rfl

-- InfoView shows: ⊢ 3 + 4 = 7
-- Concrete arithmetic — both rfl and omega work.
-- Try both! (rfl works because Lean computes 3 + 4 to 7)
theorem concrete_arith : 3 + 4 = 7 := by
  rfl

-- InfoView shows: ⊢ n + 0 = n
-- There's a variable, but Lean defines + by matching on the SECOND
-- argument, so `n + 0` reduces to `n` definitionally. Which tactic?
theorem add_zero_right (n : Nat) : n + 0 = n := by
  rfl

-- InfoView shows: ⊢ 0 + n = n
-- This looks similar, but `0 + n` does NOT reduce (the first
-- argument isn't a pattern match target). You need arithmetic help.
theorem add_zero_left (n : Nat) : 0 + n = n := by
  omega

-- InfoView shows: ⊢ a + b + c = a + (b + c)
-- Arithmetic with variables → which tactic?
theorem add_assoc_example (a b c : Nat) : a + b + c = a + (b + c) := by
  omega
