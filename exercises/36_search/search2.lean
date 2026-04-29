import Mathlib.Tactic

/- # Search 2: Finding Tactics with `apply?`

`apply?` is like `exact?` but for `apply` : it searches for
a lemma whose conclusion matches your goal, potentially
leaving subgoals for the lemma's hypotheses.

  `exact?` — finds a complete proof (no subgoals)
  `apply?` — finds a lemma to apply (may leave subgoals)

Other search tactics :
  `rw?` — searches for a rewrite lemma
  `simp?` — runs simp and reports which lemmas it used

These are invaluable when learning — they help you discover
what's in the library.

TRY IT : Use `apply?` or `exact?` to discover lemmas, then
replace with the actual proof.

TODO : Replace each `sorry` with the right lemma or tactic.
-/

-- apply? suggests: `Nat.add_le_add`
-- which leaves two subgoals: a ≤ c and b ≤ d
theorem add_le_add_of (a b c d : Nat) (h1 : a ≤ c) (h2 : b ≤ d) :
    a + b ≤ c + d := by
  sorry

-- Use simp? to discover which simp lemmas close this
-- Replace sorry with what simp? suggests
theorem list_simp : [1, 2, 3].length = 3 := by
  sorry

-- Discover a lemma about list append length
-- Hint: try `simp?` or `simp [List.length_append]`
theorem append_length (l1 l2 : List Nat) :
    (l1 ++ l2).length = l1.length + l2.length := by
  sorry

-- Discover how to prove something about Nat.min
-- Hint: try `omega` or `exact?`
theorem min_le_fst (a b : Nat) : min a b ≤ a := by
  sorry