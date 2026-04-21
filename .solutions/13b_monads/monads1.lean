def optionBind (x : Option α) (f : α → Option β) : Option β :=
  match x with
  | some v => f v
  | none => none

def optionPure (x : α) : Option α :=
  some x

def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def chainDivide : Option Nat :=
  optionBind (safeDivide 20 4) (fun x => safeDivide x 5)

def failDivide : Option Nat :=
  optionBind (safeDivide 20 0) (fun x => safeDivide x 5)
