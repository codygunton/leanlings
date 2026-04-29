/- # List Proofs 1: Append Properties

Lists support many useful lemmas :
  - `List.nil_append` : [] ++ l = l
  - `List.append_nil` : l ++ [] = l
  - `List.append_assoc` : (a ++ b) ++ c = a ++ (b ++ c)
  - `List.length_append` : (a ++ b).length = a.length + b.length

  `simp` knows most of these, so it can often close the goal.

  TODO : Prove these about the standard List operations.
  -/

-- Appending nil on the right is identity
theorem append_nil' (l : List α) : l ++ [] = l := by
  rw [List.append_nil]
  ---QUESTION: why doesn't exact List.append_nil work here?

-- Append is associative
theorem append_assoc' (a b c : List α) : (a ++ b) ++ c = a ++ (b ++ c) := by
  rw [List.append_assoc]

-- Length of append
theorem length_append' (a b : List α) : (a ++ b).length = a.length + b.length := by
  rw [List.length_append]