import Mathlib.Tactic

/- # Ext 2: Extensionality for Structures -/

theorem pair_eq : (1, 2) = (1, 2) := by ext <;> rfl

theorem pair_eq_of (a b c d : Nat) (h1 : a = c) (h2 : b = d) :
    (a, b) = (c, d) := by
  ext
  · exact h1
  · exact h2

theorem congr_example (f : Nat → Nat) (a b : Nat) (h : a = b) :
    f a = f b := by
  congr