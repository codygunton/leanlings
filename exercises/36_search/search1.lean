import Mathlib.Tactic

/- # Search 1: Finding Lemmas with `exact?`

When you don't know which lemma to use, Lean can search for
you! `exact?` searches the library for a term that closes
the current goal.

HOW TO USE :
  1. Write `exact?` where you'd write a tactic
  2. Wait a moment (it searches thousands of lemmas)
  3. Look at the "Try this:" suggestion in your InfoView
  4. Replace `exact?` with the suggested lemma

`exact?` is a DISCOVERY tool, not a proof tactic. In final
proofs, replace it with what it found.

TRY IT : For each `sorry` below, first type `exact?` to
discover the right lemma. Then replace with the suggestion.
(If you're not in an editor, the solutions show what `exact?`
would have found.)

TODO : Replace each `sorry` with the specific lemma.
-/

-- exact? will suggest: `Nat.zero_le n`
theorem zero_le_any (n : Nat) : 0 ≤ n := by
  sorry

-- exact? will suggest: `Nat.le_refl n` or `le_refl n`
theorem le_self (n : Nat) : n ≤ n := by
  sorry

-- exact? will suggest: `Nat.succ_pos n` or `Nat.zero_lt_succ n`
theorem succ_pos (n : Nat) : 0 < n + 1 := by
  sorry

-- exact? will suggest: `Nat.add_comm a b`
theorem add_comm_nat (a b : Nat) : a + b = b + a := by
  sorry