import Mathlib.Tactic

/- # Ext 2: Extensionality for Structures

`ext` isn't just for functions — it works for any type with
an `@[ext]` attribute. Lean proves two structures equal by
showing their fields match.

For `Prod` (pairs), `ext` splits `(a, b) = (c, d)` into
two goals : `a = c` and `b = d`.

For `Set`, `ext` introduces an element and asks you to
show it's in one set iff it's in the other.

TODO : Replace each `sorry` with a proof using `ext`.
-/

-- Two pairs are equal if their components match
theorem pair_eq : (1, 2) = (1, 2) := by
  sorry

-- Prove two pairs equal by showing components equal
theorem pair_eq_of (a b c d : Nat) (h1 : a = c) (h2 : b = d) :
    (a, b) = (c, d) := by
  sorry

-- congr is related: it splits an equality of applications
-- f a = f b  →  a = b (when f is injective)
-- More generally: f a = g b  →  f = g ∧ a = b
theorem congr_example (f : Nat → Nat) (a b : Nat) (h : a = b) :
    f a = f b := by
  sorry