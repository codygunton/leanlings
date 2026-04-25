/- # Monads 1: What is a Monad?

  Before diving into `do` notation, let's understand the idea.

  A **monad** is a type constructor `m` (like `Option`, `Except`,
  `IO`) equipped with two operations :

    pure : α → m α -- wrap a plain value
    bind : m α → (α → m β) → m β -- chain a computation
    "if you can convert a nat to an optional string and you have an optional
     nat then you can get an optional string"

  `pure` injects a value into the monad.
  `bind` takes a monadic value and a function that produces
  the next monadic value — threading the "effect" along.

  For `Option` :
    • `pure x = some x`
    • `bind (some x) f = f x`
    • `bind none f = none` -- short-circuits!

  That's why `Option` can model failure : `bind` propagates
  `none` automatically so you don't have to check by hand.

  TODO : Implement these by hand to see how bind works.
-/

-- Manual pure for Option: wrap a value in some.
def optionPure (x : α) : Option α := some x

-- Manual bind for Option: apply f to the inner value,
-- or return none if there's nothing inside.
def optionBind (x : Option α) (f : α → Option β) : Option β :=
  match x with
  | some v => f v
  | none => none

-- DOTHIS: what does this comment mean?
-- Now use your optionBind to chain two lookups.
-- safeDivide returns none on division by zero.
def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

-- Compute 20 / 4 / 5 by chaining with optionBind
-- (no do notation — just function calls!)
-- QUSTION: is this what you intended?
def chainDivide : Option Nat := (optionBind (safeDivide 20 4) (safeDivide · 5))

-- What happens when a step fails?
-- Compute 20 / 0 / 5 — should propagate the none.
def failDivide : Option Nat := (optionBind (safeDivide 20 0) (safeDivide · 5))

-- Don't change below this line!
#guard optionPure 42 == some 42
#guard optionBind (some 5) (fun x => some (x + 1)) == some 6
#guard optionBind (none : Option Nat) (fun x => some (x + 1)) == none
#guard chainDivide == some 1
#guard failDivide == none
