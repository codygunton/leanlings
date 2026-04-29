/- # Functor 3: Applicative — Wrapping and Combining

`Functor` lets you transform values inside a container.
But what if the FUNCTION is also inside a container?

  some (· + 1) <*> some 5 = some 6 -- apply wrapped function
  none <*> some 5 = none -- no function → no result

This is `Applicative`, which adds two operations to Functor :

  `pure x` — wrap a plain value : `pure 5 : Option Nat = some 5`
  `f <*> x` — apply a wrapped function to a wrapped value

The typeclass hierarchy :
  Functor → Applicative → Monad
  (map) (pure, <*>) (bind / >>=)

You already know `Monad` from do-notation (unit 14)!
Every `Monad` is an `Applicative`, and every `Applicative`
is a `Functor`.

Note : In Lean 4 core, `Option` has Applicative but `List`
does not (it only has Functor). So we practice with Option.

TODO : Use `pure` and `<*>` to work with wrapped values.
-/

-- Use `pure` to wrap a value in an Option.
def wrapOption (n : Nat) : Option Nat := sorry

-- Use <*> to apply a wrapped function.
-- Given an Option containing a function and an Option containing
-- a value, apply the function to the value.
def applyOpt (f : Option (Nat → Nat)) (x : Option Nat) : Option Nat :=
  sorry

-- Combine two Options: if both are `some`, add them.
-- Use `<$>` and `<*>`:
--   (· + ·) <$> some 3 <*> some 4  =  some 7
-- Step by step:
--   (· + ·) <$> some 3  =  some (3 + ·)   (a wrapped function!)
--   some (3 + ·) <*> some 4  =  some 7
def addOptions (a b : Option Nat) : Option Nat := sorry

-- Combine three Options: multiply width × height × depth.
-- If any is `none`, the result is `none`.
-- Hint: chain <$> and <*>: `(fun a b c => ...) <$> x <*> y <*> z`
def volume (w h d : Option Nat) : Option Nat := sorry

-- Use Applicative to validate two fields at once.
-- If both names are non-empty, return `some (first ++ " " ++ last)`.
-- If either is empty (""), return `none`.
def fullName (first last : Option String) : Option String := sorry

#guard wrapOption 42 == some 42
#guard applyOpt (some (· + 1)) (some 5) == some 6
#guard applyOpt none (some 5) == none
#guard applyOpt (some (· + 1)) none == none
#guard addOptions (some 3) (some 4) == some 7
#guard addOptions none (some 4) == none
#guard addOptions (some 3) none == none
#guard volume (some 2) (some 3) (some 4) == some 24
#guard volume none (some 3) (some 4) == none
#guard volume (some 2) none (some 4) == none
#guard fullName (some "Alice") (some "Smith") == some "Alice Smith"
#guard fullName none (some "Smith") == none
#guard fullName (some "Alice") none == none