/- # Functor 2: Implementing Functor for Your Types

Any `f : Type → Type` can be a Functor if you define `map`
for it — `map` applies a function to the inner values while
preserving the type's structure.

To make your type a Functor, provide an `instance` :

  instance : Functor MyType where
    map f x := ... -- apply f to the inner values of x

Once you have a Functor instance, `<$>` works automatically.

TODO : Implement the Functor instance for each type.
-/

-- A simple wrapper around a single value.
structure Box (α : Type) where
  val : α
deriving Repr, BEq

-- Implement Functor for Box: apply the function to the inner value.
instance : Functor Box where
  map f b := { val := f b.val }

-- A pair that holds two values of the same type.
structure Pair (α : Type) where
  fst : α
  snd : α
deriving Repr, BEq

-- Implement Functor for Pair: apply the function to BOTH values.
instance : Functor Pair where
  map f p := { fst := f p.fst, snd := f p.snd }

-- A binary tree with values at the nodes.
inductive Tree (α : Type) where
  | leaf : Tree α
  | node : Tree α → α → Tree α → Tree α
deriving Repr, BEq

-- Helper: implement map as a named function (needed for recursion).
-- Lean can't use `<$>` inside the instance definition itself,
-- so we define a helper and point the instance to it.
def Tree.mapTree (f : α → β) : Tree α → Tree β
    | leaf => leaf
    | node l v r => node (mapTree f l) (f v) (mapTree f r)

instance : Functor Tree where
  map := Tree.mapTree

#guard ((· + 1) <$> Box.mk 5) == Box.mk 6
#guard (toString <$> Box.mk 42) == Box.mk "42"
#guard ((· * 2) <$> Pair.mk 3 7) == Pair.mk 6 14
#guard ((· + 1) <$> Tree.node .leaf 5 .leaf) == Tree.node .leaf 6 .leaf
#guard ((· * 2) <$> (Tree.leaf : Tree Nat)) == Tree.leaf
#guard ((· + 10) <$> Tree.node (Tree.node .leaf 1 .leaf) 2 .leaf)
    == Tree.node (Tree.node .leaf 11 .leaf) 12 .leaf