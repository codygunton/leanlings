import Mathlib.Tactic

/- # Ext 1: Function Extensionality -/

theorem add_zero_fun : (fun x : Nat => x + 0) = (fun x => x) := by
  ext x; omega

theorem double_fun : (fun x : Nat => x + x) = (fun x => 2 * x) := by
  ext x; omega

theorem pair_fun : (fun p : Nat × Nat => p.1 + p.2) = (fun p => p.2 + p.1) := by
  ext ⟨a, b⟩; omega

theorem id_comp (f : Nat → Nat) : (fun x => f x) = f := by
  ext x; rfl