/- # Termination 1: Telling Lean What Decreases -/

def countdown (n : Nat) : List Nat :=
  if n = 0 then [0]
  else n :: countdown (n - 1)
termination_by n

def halve (n : Nat) : Nat :=
  if n = 0 then 0
  else 1 + halve (n / 2)
termination_by n

def myDiv (n k : Nat) (hk : k > 0) : Nat :=
  if n < k then 0
  else 1 + myDiv (n - k) k hk
termination_by n
decreasing_by omega

#guard countdown 5 == [5, 4, 3, 2, 1, 0]
#guard halve 16 == 5
#guard myDiv 10 3 (by omega) == 3