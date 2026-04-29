import Mathlib.Tactic

/- # Search 3: Review — Pick Your Tactic

You've now learned many tactics! For each goal below,
choose the best one. No hints this time.

Tactic toolbox :
  `rfl` — both sides are definitionally equal
  `omega` — linear Nat/Int arithmetic
  `ring` — polynomial equalities
  `linarith` — linear arithmetic with hypotheses
  `simp` — simplification with lemma database
  `push_neg` — push negation inward
  `rcases` — structured pattern matching
  `ext` — function/structure extensionality
  `conv` — targeted rewriting
  `norm_num` — concrete numeric facts
  `positivity` — prove something is positive/nonneg
  `decide` — decidable propositions

TODO : Replace each `sorry` with the RIGHT tactic.
-/

-- p1: polynomial
theorem p1 (x : Int) : (x - 1) * (x + 1) = x ^ 2 - 1 := by sorry

-- p2: use hypotheses
theorem p2 (a b : Int) (h1 : a ≤ b) (h2 : b ≤ a + 2) : b - a ≤ 2 := by sorry

-- p3: concrete computation
theorem p3 : (123 : Int) * 456 = 56088 := by sorry

-- p4: function equality
theorem p4 : (fun n : Nat => n * 1) = (fun n => n) := by sorry

-- p5: negated quantifier
theorem p5 : ¬ ∀ n : Nat, n * n < n := by sorry

-- p6: destructure and recombine
theorem p6 (h : P ∧ (Q ∨ R)) : (P ∧ Q) ∨ (P ∧ R) := by sorry

-- p7: positivity
theorem p7 (n : Nat) : 0 ≤ n * n := by sorry