structure Writer (α : Type) where
  value : α
  log : List String
deriving Repr, BEq

def tell (msg : String) : Writer Unit :=
  { value := (), log := [msg] }

instance : Monad Writer where
  pure x := { value := x, log := [] }
  bind w f :=
    let result := f w.value
    { value := result.value, log := w.log ++ result.log }

def computeWithLog : Writer Nat := do
  tell "Starting computation"
  let x := 10
  tell s!"Got x = {x}"
  let y := 20
  tell s!"Got y = {y}"
  tell "Adding them up"
  pure (x + y)

#guard computeWithLog.value == 30
#guard computeWithLog.log == [
  "Starting computation",
  "Got x = 10",
  "Got y = 20",
  "Adding them up"
]