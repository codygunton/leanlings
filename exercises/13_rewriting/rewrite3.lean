/- # Rewriting 3: Rewriting with Definitions

When your goal mentions a function YOU defined, `rw` can't
help directly — it needs an equation to rewrite with. Two
options :

  `unfold f` — replaces `f x` with its definition body
  `simp [f]` — unfolds `f` AND simplifies the result

After unfolding, the goal is "plain" math that `rw`, `rfl`,
or `omega` can handle.

This pattern is very common in Lean :
  1. Unfold your definitions to expose the computation
  2. Finish with arithmetic or rewriting

TODO : Complete the proofs using `unfold` or `simp [f]`
      combined with other tactics.
-/

def myDouble (n : Nat) : Nat := n + n
def myTriple (n : Nat) : Nat := n + n + n

-- `unfold myDouble` transforms the goal from
--    ⊢ myDouble n = n + n
-- to ⊢ n + n = n + n
-- Then `rfl` closes it.
theorem myDouble_def (n : Nat) : myDouble n = n + n := by
  unfold myDouble
  rfl

-- After `unfold myTriple`, the goal becomes:
--    ⊢ n + n + n = 3 * n
-- This is arithmetic — `omega` finishes it.
theorem myTriple_eq (n : Nat) : myTriple n = 3 * n := by
  unfold myTriple
  omega

-- `simp [myDouble]` unfolds both occurrences at once.
-- After simp, the goal is arithmetic: (n+1)+(n+1) = n+n+2
-- Then `omega` finishes.
theorem myDouble_succ (n : Nat) :
    myDouble (n + 1) = myDouble n + 2 := by
  unfold myDouble
  omega

-- Unfold both definitions. After `simp [myTriple, myDouble]`,
-- both sides reduce to the same expression.
theorem triple_vs_double (n : Nat) :
    myTriple n = myDouble n + n := by
  unfold myDouble
  unfold myTriple
  omega