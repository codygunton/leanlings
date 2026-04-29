/- # Termination 2: Proving Termination with `have` -/

def myGcd (m n : Nat) : Nat :=
  if h : n = 0 then m
  else
    have : m % n < n := Nat.mod_lt m (Nat.pos_of_ne_zero h)
    myGcd n (m % n)
termination_by n

def myLog2 (n : Nat) : Nat :=
  if h : n ≤ 1 then 0
  else
    have : n / 2 < n := Nat.div_lt_self (by omega) (by omega)
    1 + myLog2 (n / 2)
termination_by n

#guard myGcd 12 8 == 4
#guard myGcd 35 14 == 7
#guard myLog2 1 == 0
#guard myLog2 8 == 3
#guard myLog2 10 == 3