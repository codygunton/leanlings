theorem use_hyp (a b : Nat) (h : a = b) : a = b := by
  exact h

theorem use_hyp2 (h : 5 = 5) : 5 = 5 := by
  exact h

theorem self_impl (P : Prop) : P → P := by
  intro h
  exact h

theorem use_second_hyp (A B : Prop) : A → B → B := by
  intro ha
  intro hb
  exact hb

theorem shift (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  omega