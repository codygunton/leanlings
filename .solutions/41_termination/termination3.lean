/- # Termination 3: Partial Functions and the Fuel Pattern -/

partial def collatzSteps (n : Nat) : Nat :=
  if n ≤ 1 then 0
  else if n % 2 == 0 then 1 + collatzSteps (n / 2)
  else 1 + collatzSteps (3 * n + 1)

def collatzFuel : Nat → Nat → Option Nat
  | _, 0 => none
  | n, fuel + 1 =>
    if n ≤ 1 then some 0
    else if n % 2 == 0 then (collatzFuel (n / 2) fuel).map (· + 1)
    else (collatzFuel (3 * n + 1) fuel).map (· + 1)

def logBase (b n : Nat) (hb : b > 1) : Nat :=
  if h : n < b then 0
  else
    have hpos : 0 < n := by omega
    have : n / b < n := Nat.div_lt_self hpos hb
    1 + logBase b (n / b) hb
termination_by n

#guard collatzFuel 1 100 == some 0
#guard collatzFuel 4 100 == some 2
#guard collatzFuel 27 200 == some 111
#guard collatzFuel 27 5 == none
#guard logBase 2 1 (by omega) == 0
#guard logBase 2 8 (by omega) == 3
#guard logBase 10 100 (by omega) == 2