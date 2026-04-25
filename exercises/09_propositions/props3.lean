/- # Propositions 3: Negation and Implication

• `A → B` (implication): a function from proof of A to proof of B.
    Proved by `fun (h : A) => ...proof of B...`

• `¬A` (negation): defined as `A → False`.
    To prove ¬A, assume A and derive a contradiction.

• `absurd : α → ¬α → β` derives anything from a contradiction.

These proofs are written as function expressions (term-mode).
In the next module, you'll learn tactic mode — an alternative
way to build proofs step by step.

TODO : Provide proofs for each theorem using `fun`.
-/

-- Implication: if we know P, we can prove P
theorem identity (P : Prop) : P → P :=
  fun p => p

-- If we know P and P → Q, we can prove Q
theorem modus_ponens (P Q : Prop) : P → (P → Q) → Q :=
  fun p f => (f p)

-- From a contradiction (P and ¬P), we can prove anything
theorem contradiction (P Q : Prop) : P → ¬P → Q :=
  fun p np => (np p).elim
