/- # Rewriting 2: Strategic Rewriting

`rw` is often a setup move — you rewrite the goal into a
form that another tactic can close :

  rw [h]; rfl -- rewrite, then both sides match
  rw [h]; omega -- rewrite, then arithmetic finishes
  rw [h1, h2] -- chain rewrites (left to right)
  rw [← h] -- backwards: replace right side with left

The key insight : `rw [h]` where `h : a = b` replaces `a`
with `b` in the goal. `rw [← h]` replaces `b` with `a`.

Check InfoView after each step to see the transformation.

TODO : Complete the proofs. Each uses `rw` plus possibly
      another tactic.
-/

-- Backwards rewriting with a library lemma.
-- `← Nat.add_assoc` goes the other direction: a + (b + c) → (a + b) + c
-- InfoView shows: ⊢ a + (b + c) = a + b + c
-- DOTHIS: make this an example that doens't work without the <- (currently it does)
theorem flatten (a b c : Nat) : a + (b + c) = a + b + c := by
  rw [<-Nat.add_assoc]

-- Use `rw [h]` to substitute x with 5. Lean then reduces
-- 5 + 1 to 6 definitionally, so the goal closes automatically.
-- (InfoView before rw: ⊢ x + 1 = 6. After rw: goal disappears!)
theorem rw_then_rfl (x : Nat) (h : x = 5) : x + 1 = 6 := by
  rw [h]

-- After rw: InfoView shows ⊢ b + 1 > b
theorem rw_then_omega (a b : Nat) (h : a = b + 1) : a > b := by
  rw [h]
  omega

-- Chain two hypothesis rewrites.
-- After `rw [h1]`: a becomes b. After `rw [h2]`: b becomes c.
-- InfoView should show ⊢ c + 1 = c + 1 → closes automatically.
theorem chain_hyps (a b c : Nat) (h1 : a = b) (h2 : b = c) :
    a + 1 = c + 1 := by
  rw [h1]
  rw [h2]
