/- # Functor 1: The Functor Typeclass

You've used `.map` on Lists and Options :

  [1, 2, 3].map (· + 1) = [2, 3, 4]
  (some 5).map (· + 1) = some 6

Both follow the same pattern : apply a function to the
inner values without changing the outer structure.

The `Functor` typeclass captures this pattern :

  class Functor (f : Type → Type) where
    map : (α → β) → f α → f β

`f` is any type constructor that takes one type parameter.
`List`, `Option`, `IO`, and `Except ε` are all examples.

You don't NEED Functor to map a list — `l.map f` works fine.
The point is that Functor gives ONE interface (`<$>`) that
works uniformly for List, Option, and any type you define.

The `<$>` operator is shorthand for `Functor.map` :

  (· + 1) <$> [1, 2, 3] = [2, 3, 4]
  (· + 1) <$> some 5 = some 6

TODO : Use `<$>` to transform values. Do NOT use `.map`.
-/

-- Apply a function to every element via `<$>`.
def doubleAll (l : List Nat) : List Nat :=
  (· * 2) <$> l

-- Apply `toString` through an Option via `<$>`.
def showOption (o : Option Nat) : Option String := toString <$> o

-- Apply a function to each element of a list of pairs,
-- transforming only the SECOND element.
-- Hint: `Prod.map id f` transforms the second element.
-- Or: `(fun (a, b) => (a, f b))` works too.
def mapSeconds (f : Nat → Nat) (l : List (String × Nat)) :
    List (String × Nat) := (fun (a, b) => (a, f b)) <$> l

-- Compose two transformations using <$>.
-- Double every number, then convert to string.
-- Hint: first <$> with one function, then <$> with the other.
def doubleAndShow (l : List Nat) : List String :=
  toString <$> (· * 2) <$> l

#guard doubleAll [1, 2, 3] == [2, 4, 6]
#guard doubleAll [] == []
#guard showOption (some 42) == some "42"
#guard showOption none == none
#guard mapSeconds (· * 10) [("a", 1), ("b", 2)] == [("a", 10), ("b", 20)]
#guard doubleAndShow [1, 2, 3] == ["2", "4", "6"]
#guard doubleAndShow [] == []