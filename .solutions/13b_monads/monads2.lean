def exceptBind (x : Except ε α) (f : α → Except ε β) : Except ε β :=
  match x with
  | .ok v => f v
  | .error e => .error e

def exceptPure (x : α) : Except ε α :=
  .ok x

def checkPositive (n : Int) : Except String Int :=
  if n > 0 then .ok n else .error "not positive"

def checkSmall (n : Int) : Except String Int :=
  if n < 100 then .ok n else .error "too large"

def validate (n : Int) : Except String Int :=
  exceptBind (checkPositive n) (fun x => checkSmall x)
