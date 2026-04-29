/- # Subtypes 3: Proofs About Subtypes -/

def PosNat := {n : Nat // n > 0}
def Byte := {n : Nat // n < 256}

theorem pos_ne_zero (p : PosNat) : p.val ≠ 0 := by
  have := p.property
  omega

theorem pos_add_gt_one (a b : PosNat) : a.val + b.val > 1 := by
  have := a.property
  have := b.property
  omega

theorem byte_le (b : Byte) : b.val ≤ 255 := by
  have := b.property
  omega

theorem double_pos_even (p : PosNat) : ∃ k, p.val * 2 = 2 * k := by
  exact ⟨p.val, by omega⟩