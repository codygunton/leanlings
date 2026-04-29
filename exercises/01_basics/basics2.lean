/- # Basics 2: Basic Types

Lean has several built-in types :
  • `Nat` — natural numbers (0, 1, 2, ...)
  • `String` — text ("hello", "world")
  • `Bool` — true or false

  TODO : Replace each `sorry` with a value of the correct type.
  -/

def myNat : Nat := 1

def myString : String := "hell"

def myBool : Bool := true

-- Don't change below this line!
#guard myString.length > 0