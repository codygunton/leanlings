-- rfl: both sides are literally 10
theorem p1 : (10 : Nat) = 10 := by rfl

-- omega: arithmetic with variable n
theorem p2 (n : Nat) : n + 3 = 3 + n := by omega

-- decide (or simp or rfl): concrete list equality
theorem p3 : [1, 2] ++ [3] = [1, 2, 3] := by decide

-- simp: @[simp] lemma List.append_nil
theorem p4 (l : List Nat) : l ++ [] = l := by simp

-- decide: concrete inequality
theorem p5 : ¬(3 = 5) := by decide

-- simp [f] or unfold f; rfl: custom definition
def f (n : Nat) : Nat := n + 10

theorem p6 (n : Nat) : f n = n + 10 := by
  simp [f]

-- rw: chain hypothesis substitutions
theorem p7 (a b : Nat) (h1 : a = b) (h2 : b = 0) : a = 0 := by
  rw [h1, h2]