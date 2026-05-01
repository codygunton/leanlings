/- # Decision Procedures 2: decide

`decide` proves propositions that Lean can evaluate by
trying all possible cases. It works on :

  ✓ Concrete comparisons : 2 < 5, 10 ≠ 3
  ✓ Propositional facts : True ∧ True, ¬False
  ✓ String/value equality : "hello" ≠ "world"

`decide` does NOT work with variables — it can only
evaluate concrete, finite expressions.

Comparison with `omega` :
  • `2 < 5` — both `decide` and `omega` work
  • `n < n + 1` — only `omega` (has variable `n`)
  • `True ∨ False` — only `decide` (not arithmetic)
  • `"hello" ≠ "world"` — only `decide` (not numbers)

TODO : Complete the proofs. Think about whether `decide`
      or `omega` is the right tool.
-/

-- Concrete comparison — no variables.
-- Both `decide` and `omega` work. Use `decide`.
theorem two_lt_five : 2 < 5 := by
  decide

-- Boolean facts — `decide` works, `omega` doesn't.
theorem true_and_true : True ∧ True := by
  decide

-- String comparison — `decide` works, `omega` doesn't.
theorem strings_differ : "hello" ≠ "world" := by
  decide

-- Now one that needs `omega` — variables!
-- `decide` will fail here. Use `omega`.
theorem var_lt (n : Nat) : n < n + 1 := by
  omega

-- A proposition involving `Or` with concrete values.
theorem concrete_or : 3 = 3 ∨ 4 = 5 := by
  decide
