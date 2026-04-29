/- # Proving Code 2: The omega Tactic

`rfl` proves equalities that Lean can *compute* to the same
value. But when a theorem has variables, computation alone
isn't always enough :

    0 + n = n -- `n` is a variable, so Lean can't evaluate
                  -- the left side to a concrete number.

For goals about +, -, ≤, <, = on natural numbers, the
`omega` tactic solves them automatically. Think of it as
a calculator that works with variables.

  TIP : After typing `by`, place your cursor on each tactic
  line. The **Lean InfoView** panel (right side in VS Code)
  shows the current *proof state* — your goal (below ⊢) and
  any available hypotheses (above ⊢). Watch it update as
  you step through the proof.

TODO : Complete each proof. Use `rfl` when both sides are
       definitionally equal, and `omega` when you need
       arithmetic reasoning.
-/

def triple (n : Nat) : Nat := 3 * n

-- `triple n` IS defined as `3 * n`, so this is definitional — rfl works.
-- (Check InfoView: the goal is `triple 0 = 0`, and Lean computes both to 0)
theorem triple_0 : triple 0 = 0 := by
  sorry

-- Same idea — the goal literally matches the definition body.
theorem triple_def (n : Nat) : triple n = 3 * n := by
  sorry

-- Now try `rfl` on this one — it fails! Why?
-- Lean defines `+` by pattern-matching on the SECOND argument,
-- so `0 + n` doesn't simplify when `n` is a variable.
-- `omega` understands this arithmetic and closes the goal.
-- (InfoView shows: ⊢ 0 + n = n)
theorem zero_add (n : Nat) : 0 + n = n := by
  sorry

-- omega handles any linear arithmetic on Nat
-- (InfoView shows: ⊢ a + b = b + a)
theorem add_comm_example (a b : Nat) : a + b = b + a := by
  sorry