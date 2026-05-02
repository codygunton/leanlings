/- # Simplification 3: Discovery with simp?

How do you know which lemma `simp` used? The `simp?` tactic
runs `simp` and then TELLS you which lemmas it applied :

  example : l ++ [] = l := by simp?
  -- Lean suggests: Try this: simp only [List.append_nil]

This is invaluable for learning! Workflow :
  1. Write `simp?` (with the question mark)
  2. Look at InfoView — it shows a `simp only [...]` suggestion
  3. Replace `simp?` with the suggested `simp only [...]`

Using `simp only` instead of `simp` in final code is
considered good practice — it's more robust against library
changes and documents exactly which facts you're using.

TODO : For each theorem, first try `simp?`, read the suggestion
      in InfoView, then write the `simp only [...]` version.
      (Using plain `simp` also works — but try `simp?` first!)
-/

-- Try `simp?` and replace with the suggested `simp only [...]`
-- (simp? should suggest something like: simp only [List.nil_append])
theorem discover1 (l : List Nat) : [] ++ l = l := by
  simp only [List.nil_append]

-- Try `simp?` — what lemma handles list reversal of a singleton?
-- (If simp? suggests multiple lemmas, use all of them)
theorem discover2 : [1, 2, 3].reverse = [3, 2, 1] := by
  /- simp? -/
  simp only [List.reverse_cons, List.reverse_nil, List.nil_append, List.cons_append]

-- `simp` cleans up the list noise, but can't close the arithmetic.
-- After `simp?`, you'll still have a goal — use `omega` to finish.
theorem mixed (l : List Nat) (h : l.length ≥ 2) :
    ([] ++ l ++ []).length ≥ 2 := by
  sorry

-- Now choose the right tool for each goal:
-- Some need `simp`, some need `omega`, some need `rw`.
-- Think about what each goal is asking before picking.
theorem review_omega (a b : Nat) (h : a ≤ b) : a ≤ b + 1 := by
  omega

theorem review_simp (l₁ l₂ : List Nat) :
    [] ++ l₁ ++ (l₂ ++ []) = l₁ ++ l₂ := by
  simp