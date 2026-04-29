import Mathlib.Tactic

/- # Ext 3: Combining ext with Other Tactics

`ext` is the first step — after it, you still need to
prove the component goals. Combine it with :

  `ext x; simp` — extensionality then simplify
  `ext x; ring` — extensionality then algebra
  `ext ⟨a, b⟩; omega` — destructure then arithmetic

TODO : Replace each `sorry` with `ext` + the right closer.
-/

-- ext then ring
theorem mul_comm_fun : (fun x y : Int => x * y) = (fun x y => y * x) := by
  sorry

-- ext then simp
theorem map_id_eq {α : Type} : (fun l : List α => l.map id) = (fun l => l) := by
  sorry

-- Prove a function equation by extensionality
theorem comp_assoc (f g h : Nat → Nat) :
    (fun x => f (g (h x))) = (fun x => (f ∘ g ∘ h) x) := by
  sorry