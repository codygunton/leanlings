/- # Monad 2: Implementing Monad

The Monad typeclass has two key operations :

  class Monad (m : Type → Type) where
    pure : α → m α -- wrap a value
    bind : m α → (α → m β) → m β -- chain computations

In Lean 4, `Monad` extends `Applicative` (which extends `Functor`).
You only need to implement `pure` and `bind` — the rest is derived.

Here we build a `Writer` monad that carries a log alongside a value.
Think of it as a computation that produces output AND accumulates
a list of log messages.

TODO : Implement the Monad instance for Writer.
-/

-- A Writer carries a value and a log (list of messages)
structure Writer (α : Type) where
  value : α
  log : List String
deriving Repr, BEq

-- Helper: create a log entry without a meaningful value
def tell (msg : String) : Writer Unit :=
  { value := (), log := [msg] }

-- Implement Monad for Writer
-- pure: wrap a value with an empty log
-- bind: run first computation, pass its value to f,
--       concatenate both logs
instance : Monad Writer where
  pure x := {value := x, log := []}
  bind w f :=
    let w' := f w.value
    {w' with log := w.log ++ w'.log}

-- Use your Writer monad: compute a result while logging steps
def computeWithLog : Writer Nat := do
  tell "Starting computation"
  let x := 10
  tell s!"Got x = {x}"
  let y := 20
  tell s!"Got y = {y}"
  tell "Adding them up"
  pure (x + y)

-- Don't change below this line!
#guard computeWithLog.value == 30
#guard computeWithLog.log == [
  "Starting computation",
  "Got x = 10",
  "Got y = 20",
  "Adding them up"
]
