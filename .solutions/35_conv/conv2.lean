import Mathlib.Tactic

/- # Conv 2: Navigating Deeper -/

theorem conv_enter_lambda :
    (fun x : Nat => x + 0) = (fun x => x) := by
  conv_lhs => ext x; rw [Nat.add_zero]

theorem conv_in_arg (a b : Nat) :
    Nat.succ (a + b) = Nat.succ (b + a) := by
  conv_lhs => arg 1; rw [Nat.add_comm]

theorem conv_two_spots (a b : Nat) :
    (a + 0) + (0 + b) = a + b := by
  conv_lhs => lhs; rw [Nat.add_zero]
  conv_lhs => rhs; rw [Nat.zero_add]