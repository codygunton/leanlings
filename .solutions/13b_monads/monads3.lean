def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def chainDivide : Option Nat :=
  safeDivide 100 5 >>= fun x => safeDivide x 4

def checkPositive (n : Int) : Except String Int :=
  if n > 0 then .ok n else .error "not positive"

def checkSmall (n : Int) : Except String Int :=
  if n < 100 then .ok n else .error "too large"

def validate (n : Int) : Except String Int :=
  checkPositive n >>= fun x => checkSmall x
