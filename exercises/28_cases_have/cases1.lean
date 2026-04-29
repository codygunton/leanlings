/- # Cases and Have 1: Destructuring Hypotheses

`cases h` destructs a hypothesis by its constructors :

  For `h : A ∧ B` :
    cases h with
    | intro left right => ... -- gives left : A, right : B

    For `h : A ∨ B` :
    cases h with
    | inl ha => ... -- case where A holds
    | inr hb => ... -- case where B holds

    For `h : ∃ x, P x` :
    cases h with
    | intro w hw => ... -- gives witness w and proof hw

    TODO : Prove using `cases`.
    -/

-- And is commutative
theorem and_comm' (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  /- constructor  -/
  /- exact h.right -/
  /- exact h.left -/
  cases h with
  | intro left right => exact ⟨right, left⟩

-- Or is commutative
theorem or_comm' (P Q : Prop) (h : P ∨ Q) : Q ∨ P := by
  cases h with
  | inl hl => exact Or.inr hl
  | inr hr => exact Or.inl hr

-- And distributes over Or (left)
theorem and_or_left' (P Q R : Prop) (h : P ∧ (Q ∨ R)) : (P ∧ Q) ∨ (P ∧ R) := by
  cases h with
  | intro left right => cases right with
                        | inl hl => exact Or.inl ⟨left, hl⟩
                        | inr hr => exact Or.inr ⟨left, hr⟩