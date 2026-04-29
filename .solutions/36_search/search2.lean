import Mathlib.Tactic

/- # Search 2: Finding Tactics with `apply?` -/

theorem add_le_add_of (a b c d : Nat) (h1 : a ≤ c) (h2 : b ≤ d) :
    a + b ≤ c + d := Nat.add_le_add h1 h2

theorem list_simp : [1, 2, 3].length = 3 := by simp

theorem append_length (l1 l2 : List Nat) :
    (l1 ++ l2).length = l1.length + l2.length := by
  simp [List.length_append]

theorem min_le_fst (a b : Nat) : min a b ≤ a := by omega