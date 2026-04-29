/- # Tactics 4: Choosing the Right Tactic

You've already met `omega` (unit 8, proving2) and
`simp` (unit 8, proving3). Now add one more :

  • `decide` — proves decidable propositions by trying
    all cases. Works on concrete, finite checks.
    Use when : no variables, Lean can just evaluate.

Here's when to reach for each one :
  • `omega` → arithmetic with variables (+, -, ≤, <, =)
  • `simp` → simplify using known lemmas / unfold definitions
  • `decide` → concrete, finite propositions (no variables)

  Try using the WRONG tactic on each exercise — see what
  error you get. This builds intuition for which to use.

TODO : Complete each proof with the indicated tactic.
-/

-- Use `omega` — arithmetic with a variable
theorem arith1 (n : Nat) : n + 0 = n := by
  sorry

-- Use `omega` — inequality with variables
theorem arith2 (a b : Nat) (h : a ≤ b) : a ≤ b + 1 := by
  sorry

-- Use `simp` — list operations (not arithmetic)
theorem simp_example (l : List Nat) : l ++ [] = l := by
  sorry

-- Use `decide` — a concrete comparison, no variables
-- (Try `omega` too — it also works! But `decide` is more general
-- for non-arithmetic decidable propositions.)
theorem decide_example : 2 < 5 := by
  sorry