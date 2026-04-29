import Mathlib.Tactic

/- # Conv 3: Conv in Practice -/

theorem just_rw (a b : Nat) (h : a = b) : a + a = b + b := by
  rw [h]

theorem conv_needed (a b : Nat) (h : a = b) : a + a = b + a := by
  conv_lhs => lhs; rw [h]

theorem conv_ring (a b : Nat) :
    (a + b) * (a + b) = (b + a) * (a + b) := by
  conv_lhs => lhs; rw [Nat.add_comm]

theorem choose_tool (a b c : Nat) :
    (a + b) + c = (b + a) + c := by
  conv_lhs => lhs; rw [Nat.add_comm]