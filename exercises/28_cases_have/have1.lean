/- # Cases and Have 2: Intermediate Steps

`have name : type := proof` introduces an intermediate result :

    theorem example (h : P ∧ Q) : Q ∧ P := by
      have hp : P := h.left
      have hq : Q := h.right
      exact ⟨hq, hp⟩

  This is useful for breaking complex proofs into steps.
  You can also use `have` with tactics :

    have hp : P := by exact h.left

    TODO : Use `have` to break these proofs into steps.
    -/

-- `have` vs `cases`: `cases` destructs a value into its constructors.
-- `have` introduces a NEW fact you derive from existing ones.
-- When you're chaining implications (not destructing data), `have` is the right tool.
-- Chain implications using intermediate steps
theorem chain (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) (hp : P) : R := by
  /- exact hqr (hpq hp) -/
  have hq : Q := hpq hp
  have hr : R := hqr hq
  exact hr

-- Use have to establish an intermediate fact.
-- Recall: `¬P` is defined as `P → False`.
-- So `¬¬P` is `(P → False) → False`.
theorem double_neg_intro (P : Prop) (hp : P) : ¬¬P := by
  intro nhp
  exact nhp hp