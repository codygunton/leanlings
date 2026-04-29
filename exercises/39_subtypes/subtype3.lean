/- # Subtypes 3: Proofs About Subtypes

Subtypes carry proofs, so you can *use* those proofs in
theorems. The key pattern :

  `have ha := a.property` — extracts the proof from a subtype

This brings the fact into scope so tactics like `omega`
can use it.

  theorem pos_plus_pos (a b : PosNat) : a.val + b.val > 0 := by
    have ha := a.property -- ha : a.val > 0
    have hb := b.property -- hb : b.val > 0
    omega

TODO : Replace each `sorry` with a proof.
-/

def PosNat := {n : Nat // n > 0}
def Byte := {n : Nat // n < 256}

-- The value in a PosNat is never zero.
-- Hint: extract `p.property` with `have`, then `omega`.
theorem pos_ne_zero (p : PosNat) : p.val ≠ 0 := by
  sorry

-- Adding two PosNats gives a result > 1.
-- Hint: extract both properties, then `omega`.
theorem pos_add_gt_one (a b : PosNat) : a.val + b.val > 1 := by
  sorry

-- A Byte value is always ≤ 255.
theorem byte_le (b : Byte) : b.val ≤ 255 := by
  sorry

-- Doubling a PosNat val gives an even number.
-- Hint: use `⟨witness, proof⟩` for the existential.
theorem double_pos_even (p : PosNat) : ∃ k, p.val * 2 = 2 * k := by
  sorry