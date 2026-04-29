/- # Functor 1: Transforming Wrapped Values

You've used `.map` on Lists and Options :

  [1, 2, 3].map (· + 1) = [2, 3, 4]
  (some 5).map (· + 1) = some 6

Both follow the same pattern : apply a function to the values
INSIDE a container, without changing the container's shape.

This pattern is captured by the `Functor` typeclass :

  class Functor (f : Type → Type) where
    map : (α → β) → f α → f β

  -- `f` is the container type: List, Option, etc.

The `<$>` operator is shorthand for `Functor.map` :

  (· + 1) <$> [1, 2, 3] = [2, 3, 4]
  (· + 1) <$> some 5 = some 6

TODO : Use `<$>` (Functor.map) to transform values inside
      containers. Do NOT use `.map` — use `<$>` instead.
-/

-- Transform every element in the list by doubling it.
-- Use `<$>` (or equivalently, `Functor.map`).
def doubleAll (l : List Nat) : List Nat := sorry

-- Transform the value inside an Option by converting to String.
-- Use `<$>` with `toString`.
def showOption (o : Option Nat) : Option String := sorry

-- Apply a function to each element of a list of pairs,
-- transforming only the SECOND element.
-- Hint: `Prod.map id f` transforms the second element.
-- Or: `(fun (a, b) => (a, f b))` works too.
def mapSeconds (f : Nat → Nat) (l : List (String × Nat)) :
    List (String × Nat) := sorry

-- Compose two transformations using <$>.
-- Double every number, then convert to string.
-- Hint: first <$> with one function, then <$> with the other.
def doubleAndShow (l : List Nat) : List String := sorry

#guard doubleAll [1, 2, 3] == [2, 4, 6]
#guard doubleAll [] == []
#guard showOption (some 42) == some "42"
#guard showOption none == none
#guard mapSeconds (· * 10) [("a", 1), ("b", 2)] == [("a", 10), ("b", 20)]
#guard doubleAndShow [1, 2, 3] == ["2", "4", "6"]
#guard doubleAndShow [] == []