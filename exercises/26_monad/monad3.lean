/- # Monad 3: Polymorphic Monadic Code

The power of the Monad typeclass : write code ONCE that works
with any monad — Option, Except, IO, Writer, your own.

  def doubleM [Monad m] (mx : m Nat) : m Nat := do
    let x ← mx
    pure (x * 2)

  #eval doubleM (some 5) -- some 10
  #eval doubleM (none : Option Nat) -- none

The same `doubleM` works for Option, Except, IO — any `m`
that implements `Monad`.

TODO : Write polymorphic monadic functions using `[Monad m]`.
-/

-- Apply a function to the value inside any monad
-- Use `do`
def mapM' [Monad m] (f : α → β) (mx : m α) : m β := do
  let x <- mx
  pure (f x)

-- Chain two monadic values, keeping only the second
-- This is like `>>` in Haskell
def seqM [Monad m] (ma : m α) (mb : m β) : m β := do
  let _ <- ma
  let b <- mb
  pure b

-- Apply a monadic function to each element of a list,
-- collecting results. If any step fails, the whole thing fails.
-- DOTHIS: this one is kinda tricky
def forM' [Monad m] (f : α → m β) : List α → m (List β)
  | [] => pure []
  | x :: xs => do
    let v <- f x
    let vs <- forM' f xs
    pure (v::vs)


-- Don't change below this line!
#guard mapM' (· + 1) (some 5) == some 6
#guard mapM' (· + 1) (none : Option Nat) == none

#guard seqM (some 1) (some 2) == some 2
#guard seqM (none : Option Nat) (some 2) == (none : Option Nat)

def safeDouble (n : Nat) : Option Nat :=
  if n > 100 then none else some (n * 2)

#guard forM' safeDouble [1, 2, 3] == some [2, 4, 6]
#guard forM' safeDouble [1, 200, 3] == none
#guard forM' safeDouble ([] : List Nat) == some []
