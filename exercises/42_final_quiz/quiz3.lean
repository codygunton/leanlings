import Mathlib.Tactic

/- # Final Quiz: The Complete Picture

This capstone exercise tests everything you've learned :
  recursive types, structural recursion, induction proofs,
  existentials, iff-proofs, tactic automation, Mathlib tactics,
  subtypes, and dependent types.

  TODO : Complete all definitions and proofs.
  -/

namespace Quiz

-- =============================================
-- Part 1: Types & Functions (Units 6, 7)
-- =============================================

-- A binary tree that stores values at internal nodes.
inductive Tree (α : Type) where
  | leaf : Tree α
  | node (left : Tree α) (value : α) (right : Tree α) : Tree α
deriving Repr, BEq

-- 1. Count the nodes in a tree (recursive).
def Tree.size : Tree α → Nat := sorry

-- 2. Collect all values into a list (in-order traversal).
def Tree.toList : Tree α → List α := sorry

-- 3. Mirror a tree: swap left and right subtrees recursively.
def Tree.mirror : Tree α → Tree α := sorry

-- 4. Compute the depth (longest path from root to leaf).
--    A leaf has depth 0.
def Tree.depth : Tree α → Nat := sorry

-- =============================================
-- Part 2: Simple Proofs (Units 8, 9, 10)
-- =============================================

-- 5. A leaf has size 0.
theorem Tree.size_leaf : (Tree.leaf : Tree α).size = 0 := by
  sorry

-- 6. toList of a leaf is empty.
theorem Tree.toList_leaf : (Tree.leaf : Tree α).toList = [] := by
  sorry

-- 7. A sample tree for testing.
def sampleTree : Tree Nat :=
  .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 .leaf)

-- 8. Prove the size of the sample tree.
theorem sample_size : sampleTree.size = 3 := by
  sorry

-- 9. A node always has size ≥ 1.
--    Try `simp [size]` then `omega`.
theorem Tree.size_node_pos (l : Tree α) (v : α) (r : Tree α) :
    (Tree.node l v r).size ≥ 1 := by
    sorry

-- =============================================
-- Part 3: Induction (Units 11, 24, 25)
-- =============================================

-- 10. Mirroring preserves size.
--     Use `induction t` then `simp [mirror, size, ...]` and `omega`.
theorem Tree.size_mirror (t : Tree α) : t.mirror.size = t.size := by
  sorry

-- 11. Mirroring preserves depth.
--     Hint: `Nat.max_comm` swaps the arguments of `max`.
theorem Tree.depth_mirror (t : Tree α) : t.mirror.depth = t.depth := by
  sorry

-- 12. Mirror is its own inverse: mirroring twice gives back
--     the original tree.
theorem Tree.mirror_mirror (t : Tree α) : t.mirror.mirror = t := by
  sorry

-- 13. The length of toList equals the size.
theorem Tree.toList_length (t : Tree α) : t.toList.length = t.size := by
  sorry

-- 14. Depth is always ≤ size.
theorem Tree.depth_le_size (t : Tree α) : t.depth ≤ t.size := by
  sorry

-- =============================================
-- Part 4: Existentials & Iff (Units 20, 21)
-- =============================================

-- 15. A node tree always contains at least one element.
--     Provide a witness and prove it's in the list.
theorem Tree.node_has_element (l : Tree α) (v : α) (r : Tree α) :
    ∃ x, x ∈ (Tree.node l v r).toList := by
    sorry

-- 16. A tree has size 0 if and only if it is a leaf.
--     Use `constructor` to split the ↔ into two directions.
--     For the forward direction, use `cases t` to case-split.
theorem Tree.size_zero_iff_leaf (t : Tree α) : t.size = 0 ↔ t = .leaf := by
  sorry

end Quiz

-- =============================================
-- Part 5: Mathlib Tactics (Units 23b–23g)
-- =============================================

-- 17. Prove this algebraic identity.
--     Hint: one tactic handles polynomial equalities.
theorem quiz_ring (a b : Int) :
    (a + b) ^ 2 - (a - b) ^ 2 = 4 * a * b := by
  sorry

-- 18. Use hypotheses to derive the conclusion.
--     Hint: a tactic reads ALL hypotheses automatically.
theorem quiz_linarith (x y : Int)
    (h1 : x + y = 10) (h2 : x - y = 4) : x = 7 := by
  sorry

-- 19. Push the negation inward, then close.
theorem quiz_push_neg :
    ¬ ∀ n : Nat, n > 0 → n * n > n := by
  sorry

-- 20. Destructure the hypothesis in one step.
theorem quiz_rcases (h : (P ∧ Q) ∨ (P ∧ R)) : P := by
  sorry

-- 21. Prove two functions equal by extensionality.
theorem quiz_ext :
    (fun n : Nat => n + n) = (fun n => 2 * n) := by
  sorry

-- =============================================
-- Part 6: Subtypes & Dependent Types (Units 25b–25d)
-- =============================================

-- 22. Construct a value of a subtype (provide value + proof).
def posThree : { n : Nat // n > 0 } := sorry

-- 23. Construct a Fin (bounded natural number).
def firstOfThree : Fin 3 := sorry

-- 24. Prove a property about your subtype value.
theorem quiz_subtype_val : (posThree).val = 3 := by sorry

-- =============================================
-- Don't change below this line!
-- =============================================
#guard Quiz.sampleTree.size == 3
#guard (Quiz.Tree.leaf : Quiz.Tree Nat).size == 0
#guard Quiz.sampleTree.toList == [1, 2, 3]
#guard Quiz.sampleTree.mirror.size == 3
#guard Quiz.sampleTree.mirror.toList == [3, 2, 1]
#guard Quiz.sampleTree.mirror.mirror == Quiz.sampleTree
#guard Quiz.sampleTree.depth == 2
#guard (Quiz.Tree.leaf : Quiz.Tree Nat).depth == 0
#guard Quiz.sampleTree.toList.length == Quiz.sampleTree.size
#guard posThree.val == 3
#guard firstOfThree.val == 0