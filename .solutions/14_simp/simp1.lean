theorem append_nil (l : List Nat) : l ++ [] = l := by simp

theorem nil_append (l : List Nat) : [] ++ l = l := by simp

theorem both_sides (l : List Nat) : [] ++ l ++ [] = l := by simp

theorem length_append (l₁ l₂ : List Nat) :
    (l₁ ++ l₂).length = l₁.length + l₂.length := by simp