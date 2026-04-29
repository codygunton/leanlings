def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def safeHead (l : List α) : Option α :=
  match l with
  | [] => none
  | x :: _ => some x

-- Strategy: match on singleton vs longer list
def safeLast : List α → Option α
  | [] => none
  | [x] => some x
  | _ :: xs => safeLast xs

def getOrDefault (o : Option Nat) (d : Nat) : Nat :=
  match o with
  | some n => n
  | none => d

#guard safeDivide 10 2 == some 5
#guard safeDivide 10 0 == none
#guard safeDivide 0 5 == some 0
#guard safeHead [1, 2, 3] == some 1
#guard safeHead ([] : List Nat) == none
#guard safeLast [1, 2, 3] == some 3
#guard safeLast [42] == some 42
#guard safeLast ([] : List Nat) == none
#guard getOrDefault (some 5) 0 == 5
#guard getOrDefault none 42 == 42