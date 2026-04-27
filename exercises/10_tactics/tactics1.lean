/- # Tactics 1: intro and exact

In the previous module, you wrote proofs as expressions
(e.g., `fun h => h`). Tactic mode is an alternative :
  instead of building the proof term yourself, you give
  step-by-step instructions and Lean builds it for you.

  Enter tactic mode with `by` :

    DOTIHS : shouldn't assume source = target here and improve exposition
    theorem foo : P → P := by
      intro h -- introduces hypothesis `h : P`
      exact h -- closes the goal with `h`

  • `intro h` moves the hypothesis from the goal into context

  • `exact term` closes the goal when `term` has the right type

  TODO : Complete the proofs using `intro` and `exact`.
  -/

-- Introduce the hypothesis, then provide it as the proof
theorem self_implication (P : Prop) : P → P := by
  intro p
  exact p

-- Introduce both hypotheses, then use the right one
theorem use_second (P Q : Prop) : P → Q → Q := by
  intro p q
  exact q

-- Function composition
theorem compose (P Q R : Prop) : (P → Q) → (Q → R) → P → R := by
  intro f
  intro g
  exact g ∘ f
