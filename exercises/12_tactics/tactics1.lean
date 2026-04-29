/- # Tactics 1: intro and exact

In the previous module, you wrote proofs as expressions
(e.g., `fun h => h`). Tactic mode is an alternative :
  instead of building the proof term yourself, you give
  step-by-step instructions and Lean builds it for you.

  Enter tactic mode with `by` :

    theorem foo : P → P := by
      intro h -- introduces hypothesis `h : P`
      exact h -- closes the goal with `h`

  • `intro h` moves a hypothesis from the goal into context
    (InfoView : the `P →` disappears from the goal, `h : P` appears above ⊢)

  • `exact term` closes the goal when `term` has the right type

  TODO : Complete the proofs using `intro` and `exact`.
  -/

-- Introduce the hypothesis, then provide it as the proof
theorem self_implication (P : Prop) : P → P := by
  sorry

-- Introduce both hypotheses, then use the right one
theorem use_second (P Q : Prop) : P → Q → Q := by
  sorry

-- Introduce all three, then combine them
-- (InfoView after intro: hpq : P → Q, hqr : Q → R, hp : P)
theorem compose (P Q R : Prop) : (P → Q) → (Q → R) → P → R := by
  sorry