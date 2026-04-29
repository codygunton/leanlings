def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def chainBind : Option Nat :=
  safeDivide 10 2 >>= fun x =>
  safeDivide x 1 >>= fun y =>
  pure (x + y)

def multiplyBind : Option Nat :=
  some 3 >>= fun x =>
  some 4 >>= fun y =>
  pure (x * y)

def failBind : Option Nat :=
  (none : Option Nat) >>= fun x =>
  pure (x + 1)

def addStrings (a b : String) : Option Nat :=
  a.toNat? >>= fun x =>
  b.toNat? >>= fun y =>
  pure (x + y)

#guard chainBind == some 10
#guard multiplyBind == some 12
#guard failBind == none
#guard addStrings "3" "4" == some 7
#guard addStrings "3" "abc" == none
#guard addStrings "abc" "4" == none