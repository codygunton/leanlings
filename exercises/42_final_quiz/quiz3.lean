/- # Final Quiz: The Complete Picture

This capstone exercise tests everything you've learned :
  recursive types, structural recursion, induction proofs,
  existentials, iff-proofs, and tactic automation.

  TODO : Complete all definitions and proofs.
  -/

-- =============================================
-- Part 1: Types & Functions (Units 6, 7)
-- =============================================

-- A binary tree that stores values at internal nodes.
inductive Tree (α : Type) where
  | leaf : Tree α
  | node (left : Tree α) (value : α) (right : Tree α) : Tree α
deriving BEq

instance [Repr α] : Repr (Tree α) where
  reprPrec t _ :=
    let rec go : Tree α → String → String
      | .leaf, _ => "·"
      | .node l v r, indent =>
        s!"{reprPrec v 0}\n{indent}├── {go l (indent ++ "│ ")}\n{indent}└── {go r (indent ++ " ")}"
    .text (go t "")

open Tree in
  def egtree : Tree Nat :=
    node
      (node (node leaf 4 leaf) 2 (node leaf 6 leaf))
      1
      (node (node leaf 5 leaf) 3 (node leaf 7 leaf))
#eval egtree


-- 1. Count the nodes in a tree (recursive).
def Tree.size : Tree α → Nat
  | .leaf => 0
  | .node l _ r => 1 + l.size + r.size
#eval egtree.size

-- 2. Collect all values into a list (in-order traversal).
def Tree.toList : Tree α → List α
  | .leaf => []
  | .node l v r => l.toList ++ [v] ++ r.toList
#eval egtree.toList

-- 3. Mirror a tree: swap left and right subtrees recursively.
def Tree.mirror : Tree α → Tree α
  | .leaf => .leaf
  | .node l v r => .node r.mirror v l.mirror
#eval egtree
#eval egtree.mirror

-- 4. Compute the depth (longest path from root to leaf).
--    A leaf has depth 0.
def Tree.depth : Tree α → Nat
  | .leaf => 0
  | .node l _ r => 1 + max l.depth r.depth
#eval egtree.depth

-- =============================================
-- Part 2: Simple Proofs (Units 8, 9, 10)
-- =============================================

-- 5. A leaf has size 0.
theorem Tree.size_leaf : (Tree.leaf : Tree α).size = 0 := by
  rw [size]

-- 6. toList of a leaf is empty.
theorem Tree.toList_leaf : (Tree.leaf : Tree α).toList = [] := by
  rw [toList]

-- 7. A sample tree for testing.
def sampleTree : Tree Nat :=
  .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 .leaf)
#eval sampleTree

-- 8. Prove the size of the sample tree.
theorem sample_size : sampleTree.size = 3 := by
  calc sampleTree.size


-- 9. A node always has size ≥ 1.
--    Try `simp [size]` then `omega`.
theorem Tree.size_node_pos (l : Tree α) (v : α) (r : Tree α) :
    (Tree.node l v r).size ≥ 1 := by
    rw [Tree.size]
    omega

-- =============================================
-- Part 3: Induction (Units 11, 24, 25)
-- =============================================

-- 10. Mirroring preserves size.
--     Use `induction t` then `simp [mirror, size, ...]` and `omega`.
theorem Tree.size_mirror (t : Tree α) : t.mirror.size = t.size := by
  induction t with
  | leaf => rw[mirror, size]
  | node l v r lih rih => rw[mirror, size, size]
                          omega

-- 11. Mirroring preserves depth.
--     Hint: `Nat.max_comm` swaps the arguments of `max`.
theorem Tree.depth_mirror (t : Tree α) : t.mirror.depth = t.depth := by
  induction t with
  | leaf => calc leaf.depth
  | node l v r lih rih => simp [mirror, depth, lih, rih, Nat.max_comm]

-- 12. Mirror is its own inverse: mirroring twice gives back
--     the original tree.
theorem Tree.mirror_mirror (t : Tree α) : t.mirror.mirror = t := by
  induction t with
  | leaf => rfl
  | node l v r lih rih => simp [mirror, lih, rih]

-- 13. The length of toList equals the size.
theorem Tree.toList_length (t : Tree α) : t.toList.length = t.size := by
  induction t with
  | leaf => simp [toList, size]
  | node l v r lih rih => simp [toList, lih, rih, size]
                          omega

-- 14. Depth is always ≤ size.
theorem Tree.depth_le_size (t : Tree α) : t.depth ≤ t.size := by
  induction t with
  | leaf => simp [depth, size]
  | node l v r lih rih => simp [depth, size]
                          omega


-- =============================================
-- Part 4: Existentials & Iff (Units 20, 21)
-- =============================================

-- 15. A node tree always contains at least one element.
--     Provide a witness and prove it's in the list.
theorem Tree.node_has_element (l : Tree α) (v : α) (r : Tree α) :
    ∃ x, x ∈ (Tree.node l v r).toList := by
    refine ⟨v, ?_⟩
    simp [toList]
    /- refine ⟨v, by simp [toList]⟩ -/

-- 16. A tree has size 0 if and only if it is a leaf.
--     Use `constructor` to split the ↔ into two directions.
--     For the forward direction, use `cases t` to case-split.
-- Alternative: `constructor <;> (intro h; cases t <;> simp_all [size])`
-- applies the same proof to both directions. Or use anonymous constructor:
-- `⟨fun h => by cases t <;> simp_all [size], fun h => by cases t <;> simp_all [size]⟩`
theorem Tree.size_zero_iff_leaf (t : Tree α) : t.size = 0 ↔ t = .leaf := by
  constructor <;> (intro h; cases t <;> simp_all [size])

-- =============================================
-- Don't change below this line!
-- =============================================
#guard sampleTree.size == 3
#guard (Tree.leaf : Tree Nat).size == 0
#guard sampleTree.toList == [1, 2, 3]
#guard sampleTree.mirror.size == 3
#guard sampleTree.mirror.toList == [3, 2, 1]
#guard sampleTree.mirror.mirror == sampleTree
#guard sampleTree.depth == 2
#guard (Tree.leaf : Tree Nat).depth == 0
#guard sampleTree.toList.length == sampleTree.size