/- # Option 2: Errors with Context (Except)

`Option` says "something went wrong" but not WHAT. When you
need error messages, use `Except ε α` :

  `.ok x` — success with value `x`
  `.error e` — failure with error `e` of type `ε`

Example :
  def validateAge (n : Nat) : Except String Nat :=
    if n > 150 then .error "age too large"
    else .ok n

`Except` is like `Option` but carries an error description.
Pattern-match on `.ok` and `.error` just like `some`/`none`.

TODO : Implement each function using `Except`.
-/

-- Return `.error "division by zero"` if b is 0,
-- otherwise `.ok (a / b)`.
def checkedDivide (a b : Nat) : Except String Nat :=
  match b with
  | 0 => .error "division by zero"
  | b => .ok (a/b)

-- Validate that a name is non-empty.
-- Return `.error "name is empty"` if the string is "",
-- otherwise `.ok name`.
def validateName (name : String) : Except String String :=
  match name with
  | "" => .error "name is empty"
  | name => .ok name

-- QUESTIOn: did ew totally replace the existing option lesson? 
-- Validate that a score is between 0 and 100 (inclusive).
-- Return appropriate error messages for out-of-range values.
def validateScore (n : Nat) : Except String Nat :=
  if n < 0 || n > 100 then .error "integer out of bounds" else .ok n

-- Convert an Except to an Option, discarding the error message.
def toOption (e : Except ε α) : Option α :=
  match e with
  | .ok v => some v
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
