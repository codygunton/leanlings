/- # Option 1: Handling Missing Values

Not every operation succeeds. Looking up a key in a map
might fail. Dividing by zero is undefined. Lean uses
`Option α` to represent "a value of type α, or nothing" :

  `some x` — success, carrying value `x`
  `none` — failure, no value

You construct Options with `some` and `none`, and
pattern-match to extract values :

  def safeDivide (a b : Nat) : Option Nat :=
    if b == 0 then none else some (a / b)

  def unwrap (o : Option Nat) : Nat :=
    match o with
    | some n => n
    | none => 0 -- default when missing

Remember that lists are destructured as `x :: xs`
(head :: tail), and `[]` matches the empty list.

TODO : Implement each function using `Option`.
-/

-- Return `none` if b is 0, otherwise `some (a / b)`.
def safeDivide (a b : Nat) : Option Nat := sorry

-- Return the first element, or `none` for an empty list.
-- Hint: match on the list; `[]` is empty, `x :: _` has a head.
def safeHead (l : List α) : Option α := sorry

-- Return the last element, or `none` for an empty list.
-- Hint: match on the list; a singleton [x] is `x :: []`.
def safeLast : List α → Option α := sorry

-- Extract the value from an Option, using a default if none.
-- (This already exists as `Option.getD`, but implement it yourself.)
def getOrDefault (o : Option Nat) (d : Nat) : Nat := sorry

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