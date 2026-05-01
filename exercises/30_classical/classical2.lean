/- # Classical Logic 2: Contrapositive

The contrapositive of `P → Q` is `¬Q → ¬P`.
Proving the contrapositive is often easier.

Constructively : `(P → Q) → (¬Q → ¬P)` is always provable.
    (Given P, apply h to get Q, then ¬Q gives a contradiction.)

Classically : `(¬Q → ¬P) → (P → Q)` needs `Classical.em`.
    (Given P, we need Q — but we can't compute Q from P.
     We must case-split : either Q holds, or ¬Q holds and
     then h gives ¬P, contradicting our P.)

TODO : Prove both directions.
-/

-- Constructive direction (doesn't need classical logic).
-- This direction is purely constructive — no Classical axiom needed.
-- (The reverse direction below is where Classical.em is required.)
theorem contrapositive (P Q : Prop) (h : P → Q) : ¬Q → ¬P := by
  intro nq
  intro p
  let q := h p
  exact absurd q nq

-- Classical direction (needs excluded middle).
-- Your proof via double negation elimination works! Alternatives:
--   • `Classical.byContradiction (fun hnq => absurd hp (h hnq))`
--   • `cases Classical.em Q with | inl q => exact q | inr nq => exact absurd hp (h nq)`
theorem contrapositive_reverse (P Q : Prop) (h : ¬Q → ¬P) : P → Q := by
  have cp := contrapositive (¬Q) (¬P) h
  intro p
  have nnp : ¬¬P := fun np => np p
  let nnq := cp nnp
  exact Classical.not_not.mp nnq


-- Apply contrapositive reasoning
theorem not_or_of_imp (P Q : Prop) (h : P → Q) : ¬P ∨ Q := by
  cases Classical.em P with
  | inl p => have q := h p
             exact Or.inr q
  | inr np => exact Or.inl np