import Mathlib.Tactic

namespace Quiz

inductive Tree (α : Type) where
  | leaf : Tree α
  | node (left : Tree α) (value : α) (right : Tree α) : Tree α
  deriving Repr, BEq

def Tree.size : Tree α → Nat
  | .leaf => 0
  | .node l _ r => 1 + l.size + r.size

def Tree.toList : Tree α → List α
  | .leaf => []
  | .node l v r => l.toList ++ [v] ++ r.toList

def Tree.mirror : Tree α → Tree α
  | .leaf => .leaf
  | .node l v r => .node r.mirror v l.mirror

def Tree.depth : Tree α → Nat
  | .leaf => 0
  | .node l _ r => 1 + max l.depth r.depth

theorem Tree.size_leaf : (Tree.leaf : Tree α).size = 0 := by
  rfl

theorem Tree.toList_leaf : (Tree.leaf : Tree α).toList = [] := by
  rfl

def sampleTree : Tree Nat :=
  .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 .leaf)

theorem sample_size : sampleTree.size = 3 := by
  rfl

theorem Tree.size_node_pos (l : Tree α) (v : α) (r : Tree α) :
    (Tree.node l v r).size ≥ 1 := by
  simp [size]; omega

theorem Tree.size_mirror (t : Tree α) : t.mirror.size = t.size := by
  induction t with
  | leaf => rfl
  | node l v r ihl ihr => simp [mirror, size, ihl, ihr]; omega

theorem Tree.depth_mirror (t : Tree α) : t.mirror.depth = t.depth := by
  induction t with
  | leaf => rfl
  | node l v r ihl ihr => simp [mirror, depth, ihl, ihr, Nat.max_comm]

theorem Tree.mirror_mirror (t : Tree α) : t.mirror.mirror = t := by
  induction t with
  | leaf => rfl
  | node l v r ihl ihr => simp [mirror, ihl, ihr]

theorem Tree.toList_length (t : Tree α) : t.toList.length = t.size := by
  induction t with
  | leaf => simp [toList, size]
  | node l v r ihl ihr => simp [toList, size, ihl, ihr]; omega

theorem Tree.depth_le_size (t : Tree α) : t.depth ≤ t.size := by
  induction t with
  | leaf => simp [depth, size]
  | node l v r ihl ihr => simp [depth, size]; omega

theorem Tree.node_has_element (l : Tree α) (v : α) (r : Tree α) :
    ∃ x, x ∈ (Tree.node l v r).toList := by
  exact ⟨v, by simp [toList]⟩

theorem Tree.size_zero_iff_leaf (t : Tree α) : t.size = 0 ↔ t = .leaf := by
  constructor
  · intro h
    cases t with
    | leaf => rfl
    | node l v r => simp [size] at h
  · intro h
    subst h
    rfl

end Quiz

theorem quiz_ring (a b : Int) :
    (a + b) ^ 2 - (a - b) ^ 2 = 4 * a * b := by ring

theorem quiz_linarith (x y : Int)
    (h1 : x + y = 10) (h2 : x - y = 4) : x = 7 := by linarith

theorem quiz_push_neg :
    ¬ ∀ n : Nat, n > 0 → n * n > n := by
  push_neg
  exact ⟨1, by omega, by omega⟩

theorem quiz_rcases (h : (P ∧ Q) ∨ (P ∧ R)) : P := by
  rcases h with ⟨hp, _⟩ | ⟨hp, _⟩ <;> exact hp

theorem quiz_ext :
    (fun n : Nat => n + n) = (fun n => 2 * n) := by
  ext n; omega

def posThree : { n : Nat // n > 0 } := ⟨3, by omega⟩

def firstOfThree : Fin 3 := ⟨0, by omega⟩

theorem quiz_subtype_val : (posThree).val = 3 := by rfl

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