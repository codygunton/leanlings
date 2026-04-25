/- # Arrays 1: Array Basics

`Array α` is Lean's efficient random-access collection :

    let a := #[1, 2, 3] -- array literal
    a.size -- 3
    a[0]! -- 1 (with bounds check)
    a.push 4 -- #[1, 2, 3, 4]
    a.map (· * 2) -- #[2, 4, 6]

  Arrays are the preferred data structure for performance
  (O(1) access vs O(n) for lists).

  TODO : Implement these array operations.
  -/

-- Double every element in the array
def doubleArray (a : Array Nat) : Array Nat := a.map (· * 2)


-- Sum all elements of an array using a fold
def arraySum (a : Array Nat) : Nat := a.foldl (fun x acc => x + acc) 0

-- Keep only elements greater than a threshold
def filterAbove (a : Array Nat) (threshold : Nat) : Array Nat := a.filter (· > threshold)

-- Don't change below this line!
#guard doubleArray #[1, 2, 3] == #[2, 4, 6]
#guard doubleArray #[] == #[]
#guard arraySum #[1, 2, 3, 4] == 10
#guard arraySum #[] == 0
#guard filterAbove #[1, 5, 3, 8, 2] 3 == #[5, 8]
