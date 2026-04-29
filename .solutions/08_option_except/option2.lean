def checkedDivide (a b : Nat) : Except String Nat :=
  if b == 0 then .error "division by zero" else .ok (a / b)

def validateName (name : String) : Except String String :=
  if name == "" then .error "name is empty" else .ok name

-- Strategy: check upper bound first, then lower bound
def validateScore (n : Nat) : Except String Nat :=
  if n > 100 then .error "score too large"
  else .ok n

def toOption (e : Except ε α) : Option α :=
  match e with
  | .ok x => some x
  | .error _ => none

#guard (checkedDivide 10 2).isOk
#guard !(checkedDivide 10 0).isOk
#guard toOption (checkedDivide 10 2) == some 5
#guard toOption (checkedDivide 10 0) == none
#guard (validateName "Alice").isOk
#guard !(validateName "").isOk
#guard (validateScore 85).isOk
#guard !(validateScore 101).isOk
#guard toOption (validateScore 50) == some 50
#guard toOption (validateScore 200) == none