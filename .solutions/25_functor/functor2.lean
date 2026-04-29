structure Box (α : Type) where
  val : α
deriving Repr, BEq

instance : Functor Box where
  map f b := ⟨f b.val⟩

structure Pair (α : Type) where
  fst : α
  snd : α
deriving Repr, BEq

-- Strategy: apply f to both fields
instance : Functor Pair where
  map f p := ⟨f p.fst, f p.snd⟩

inductive Tree (α : Type) where
  | leaf : Tree α
  | node : Tree α → α → Tree α → Tree α
deriving Repr, BEq

-- Strategy: structural recursion — leaf stays leaf, node maps value and recurses
def Tree.mapTree (f : α → β) : Tree α → Tree β
  | .leaf => .leaf
  | .node l v r => .node (mapTree f l) (f v) (mapTree f r)

instance : Functor Tree where
  map := Tree.mapTree

#guard ((· + 1) <$> Box.mk 5) == Box.mk 6
#guard (toString <$> Box.mk 42) == Box.mk "42"
#guard ((· * 2) <$> Pair.mk 3 7) == Pair.mk 6 14
#guard ((· + 1) <$> Tree.node .leaf 5 .leaf) == Tree.node .leaf 6 .leaf
#guard ((· * 2) <$> (Tree.leaf : Tree Nat)) == Tree.leaf
#guard ((· + 10) <$> Tree.node (Tree.node .leaf 1 .leaf) 2 .leaf)
    == Tree.node (Tree.node .leaf 11 .leaf) 12 .leaf