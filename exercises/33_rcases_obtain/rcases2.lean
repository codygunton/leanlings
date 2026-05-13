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
  obtain ⟨hp, hq⟩ := h
  exact hp

-- Extract an existential and use the witness
theorem exists_add (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m = 5 := by
  obtain ⟨ five, hex ⟩ := h
  exact ⟨ five, by omega ⟩

-- Chain two obtains
-- DOTHIS: solution doesn't use two obtain -__-
-- ALSO : I don't think you've explained synactic sugar enough to explain the solution. this forall notation with a comma?
-- Maybe a hint to use #check here (and prob periodic reminders of this) would be helpful 
theorem exists_trans (h_exists_gt_5 : ∃ n : Nat, n > 5) (h_gt_5_impl_gt_3 : ∀ n : Nat, n > 5 → n > 3) :
    ∃ n : Nat, n > 3 := by
  obtain ⟨ w, h_w_gt_5 ⟩ := h_exists_gt_5
  let h_w_gt_5_impl_w_gt_3 := h_gt_5_impl_gt_3 w
  /- #check h_w_gt_5_impl_w_gt_3 -/
  let h_w_gt_3 := h_w_gt_5_impl_w_gt_3 h_w_gt_5
  /- #check h_w_gt_3 -/
  exact ⟨ w, h_w_gt_3 ⟩


-- Obtain with type annotation (create your own witness)
-- DOTHIS: I don't think this ⟨ a, b, c⟩ notation (three values) has been introduced but it's used in the soluition
-- This also relies on undersganding some precedence rules in a way that's not really to the point... i thought i was looking for an n such that, bitwize, (n AND n ) OR 2 is not 0.
-- The example in the opening comment is not very good either
theorem exists_even : ∃ n : Nat, 2 ∣ n ∧ n > 0 := by
  exact ⟨2, ⟨1, rfl⟩, by omega⟩ -- copy paste
