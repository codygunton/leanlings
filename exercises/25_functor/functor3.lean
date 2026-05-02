/- # Functor 3: Applicative — Wrapping and Combining

`Functor` lets you apply a plain function through a type.
But what if the FUNCTION is also wrapped in that type?

  some (· + 1) <*> some 5 = some 6 -- apply wrapped function
  none <*> some 5 = none -- no function → no result

`Applicative` extends Functor with two operations :

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

-- Use `pure` to lift a value into Option.
def wrapOption (n : Nat) : Option Nat := pure n

-- Use <*> to apply a function in Option to a value in Option.
def applyOpt (f : Option (Nat → Nat)) (x : Option Nat) : Option Nat :=
  f <*> x

-- Combine two Options: if both are `some`, add them.
-- Use `<$>` and `<*>`:
--   (· + ·) <$> some 3 <*> some 4  =  some 7
-- Step by step:
--   (· + ·) <$> some 3  =  some (3 + ·)   (a wrapped function!)
--   some (3 + ·) <*> some 4  =  some 7
def addOptions (a b : Option Nat) : Option Nat :=
  (· + · ) <$> a <*> b

-- Combine three Options: multiply width × height × depth.
-- If any is `none`, the result is `none`.
-- Hint: chain <$> and <*>: `(fun a b c => ...) <$> x <*> y <*> z`
def volume (w h d : Option Nat) : Option Nat :=
  (· * · * ·) <$> w <*> h <*> d

-- Use Applicative to validate two fields at once.
-- If both names are non-empty, return `some (first ++ " " ++ last)`.
-- If either is empty (""), return `none`.
def fullName (first last : Option String) : Option String :=
  (· ++ " " ++ ·) <$> first <*> last

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
