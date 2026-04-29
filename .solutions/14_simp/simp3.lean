theorem discover1 (l : List Nat) : [] ++ l = l := by
  simp only [List.nil_append]

-- Strategy: simp? suggests simp only [List.reverse_cons, ...] — many lemmas!
-- Using bare simp is fine here; the point is that simp? reveals what's happening.
theorem discover2 : [1, 2, 3].reverse = [3, 2, 1] := by
  simp only [List.reverse_cons, List.reverse_nil, List.nil_append, List.cons_append]

theorem mixed (l : List Nat) :
    ([] ++ l ++ []).length = l.length := by
  simp

theorem review_omega (a b : Nat) (h : a ≤ b) : a ≤ b + 1 := by
  omega

theorem review_simp (l₁ l₂ : List Nat) :
    [] ++ l₁ ++ (l₂ ++ []) = l₁ ++ l₂ := by
  simp