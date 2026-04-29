import Mathlib.Tactic

/- # Ext 3: Combining ext with Other Tactics -/

theorem mul_comm_fun : (fun x y : Int => x * y) = (fun x y => y * x) := by
  ext x y; ring

theorem map_id_eq {α : Type} : (fun l : List α => l.map id) = (fun l => l) := by
  ext l; simp

theorem comp_assoc (f g h : Nat → Nat) :
    (fun x => f (g (h x))) = (fun x => (f ∘ g ∘ h) x) := by
  ext x; rfl