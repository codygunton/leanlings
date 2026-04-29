import Mathlib.Tactic

/- # Negation 2: Contraposition with `contrapose` -/

theorem sq_zero_imp (n : Nat) : n ^ 2 = 0 → n = 0 := by
  contrapose
  intro h
  positivity

theorem lt_imp_ne (n m : Nat) : n < m → n ≠ m := by
  contrapose!
  intro h
  omega

theorem dne (p : Prop) (h : ¬¬p) : p := by
  by_contra hp
  exact h hp

theorem not_both_true (p q : Prop) (h1 : p → ¬q) (hp : p) (hq : q) : False := by
  exact h1 hp hq