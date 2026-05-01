/- # Existential Proofs 2: Using Existential Hypotheses

The header above teaches destructuring with `let ⟨w, hw⟩ := h`,
but these exercises can be solved by just providing NEW witnesses.
Both skills matter — sometimes you extract, sometimes you construct.

Given `h : ∃ x, P x`, you CAN extract the witness with :
  • `let ⟨w, hw⟩ := h` — gives you w and hw : P w
  • In tactic mode : `obtain ⟨w, hw⟩ := h`

Or you can ignore h and provide your own witness with `⟨value, proof⟩`.

TODO : Prove these. You may or may not need the hypothesis.
-/

-- We can provide our own witness regardless of the hypothesis.
theorem exists_imp' (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m = 5 := by
  exact ⟨5, rfl⟩

-- Existentials compose
theorem exists_add (h : ∃ n : Nat, n > 0) : ∃ m : Nat, m > 1 := by
  exact ⟨2, by omega⟩