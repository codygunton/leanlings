/- # Dependent Types 2: Indexed Families

An **indexed family** is an inductive type whose TYPE changes
depending on a value. The classic example : length-indexed lists.

  inductive Vec (α : Type) : Nat → Type where
    | nil : Vec α 0
    | cons : α → Vec α n → Vec α (n + 1)

Notice :
  - `α` is a **parameter** (before the colon) — same for all constructors
  - `Nat` is an **index** (after the colon) — varies per constructor
  - `nil` produces `Vec α 0` (length 0)
  - `cons` produces `Vec α (n + 1)` (length increases by 1)

The length is tracked IN THE TYPE. A `Vec String 3` always
has exactly 3 elements — the compiler enforces this!

Pattern matching on `Vec` is **dependent** : matching on
`.cons x xs` tells Lean the length is `n + 1`, so `xs`
has type `Vec α n`. Matching `.nil` tells Lean length is 0.

TODO : Replace each `sorry` with the correct implementation.
-/

inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons : α → Vec α n → Vec α (n + 1)

-- Get the first element. The type `Vec α (n + 1)` guarantees
-- the vector is non-empty — no Option needed!
def Vec.head : Vec α (n + 1) → α := sorry

-- Get everything after the first element.
-- A Vec of length n+1 becomes a Vec of length n.
def Vec.tail : Vec α (n + 1) → Vec α n := sorry

-- Build a Vec of `n` copies of the same value.
-- Hint: match on n. Base: .nil. Step: .cons x (recurse).
def Vec.replicate : (n : Nat) → α → Vec α n := sorry

-- Apply a function to every element, preserving length.
-- Match on the Vec: .nil → .nil, .cons x xs → .cons (f x) (recurse).
def Vec.map (f : α → β) : Vec α n → Vec β n := sorry

-- Pair up elements from two Vecs of the SAME length.
-- The shared index `n` makes mismatched-length zips a type error!
-- Match both simultaneously. Only two cases are possible.
def Vec.zip : Vec α n → Vec β n → Vec (α × β) n := sorry

-- Test helpers (not graded)
def v123 : Vec Nat 3 := .cons 1 (.cons 2 (.cons 3 .nil))
def vABC : Vec String 3 := .cons "a" (.cons "b" (.cons "c" .nil))

#guard Vec.head v123 == 1
#guard Vec.head vABC == "a"