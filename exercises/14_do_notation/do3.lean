/- # Do Notation 3: Mutable Variables and For Loops

In a `do` block, you can use mutable variables and for loops :

    def sumList (l : List Nat) : Nat := Id.run do
      let mut total := 0
      for x in l do
        total := total + x
      return total

    `Id.run` runs a pure `do` block (no IO needed).
    `let mut` creates a mutable variable.

    TODO : Implement these using mutable variables and for loops.
    -/

--- QUESTION: why do I need Id.run but here but not in the prevoius two examples?
-- Count how many elements satisfy a predicate
def countWhere (p : Nat → Bool) (l : List Nat) : Nat := Id.run do
  let mut total := 0
  for x in l do
    total := total + (p x).toNat
  return total

-- Find the maximum element (return 0 for empty list)
def listMax (l : List Nat) : Nat := Id.run do
  if l == [] then 0 else
  let mut max := 0
  for x in l do
    max := if x > max then x else max
  return max

-- Don't change below this line!
#guard countWhere (· > 3) [1, 2, 3, 4, 5] == 2
#guard countWhere (· == 0) [0, 1, 0, 2] == 2
#guard countWhere (· > 0) ([] : List Nat) == 0
#guard listMax [1, 5, 3, 9, 2] == 9
#guard listMax ([] : List Nat) == 0
