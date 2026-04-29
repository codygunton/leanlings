import Mathlib.Tactic

/- # Rcases 2: Obtain — Structured Let-Binding

`obtain` is like `rcases` but works as a forward step :
instead of destructuring a hypothesis, it creates new names
from an expression.

  `obtain ⟨a, ha⟩ := h` — same as `rcases h with ⟨a, ha⟩`

It's especially natural for existentials :

  obtain ⟨witness, proof⟩ := h -- extracts witness and proof

`obtain` can also combine with a type annotation :

  obtain ⟨n, hn⟩ : ∃ n, n > 0 := ⟨1, by omega⟩

TODO : Replace each `sorry` with `obtain` + the right pattern.
-/

-- Extract components of an And
theorem fst_of_and (h : P ∧ Q) : P := by
  sorry

-- Extract an existential and use the witness
theorem exists_add (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m = 5 := by
  sorry

-- Chain two obtains
theorem exists_trans (h1 : ∃ n : Nat, n > 5) (h2 : ∀ n : Nat, n > 5 → n > 3) :
    ∃ n : Nat, n > 3 := by
  sorry

-- Obtain with type annotation (create your own witness)
theorem exists_even : ∃ n : Nat, 2 ∣ n ∧ n > 0 := by
  sorry