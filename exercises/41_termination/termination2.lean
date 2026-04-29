/- # Termination 2: Proving Termination with `have`

Sometimes `omega` alone can't prove the recursive argument
decreases. For example, in GCD :

  def gcd (m n : Nat) : Nat :=
    if n = 0 then m else gcd n (m % n)

The recursive argument is `m % n`, and Lean needs to know
that `m % n < n`. This is a library theorem `Nat.mod_lt`,
not bare arithmetic, so `omega` can't see it.

The solution : use a `have` statement to state the fact as
a local hypothesis. Once it's in context, Lean's termination
checker can use it :

  if h : n = 0 then m
  else
    have : m % n < n := Nat.mod_lt m (Nat.pos_of_ne_zero h)
    gcd n (m % n)

Key pattern :
  1. Use `if h : condition` to get a proof `h` of the condition
  2. Use `have : decreasing_fact := proof` before the recursive call
  3. `termination_by` names what decreases

TODO : Add the missing `have` statements and `termination_by`.
-/

-- GCD using Euclid's algorithm.
-- `m % n < n` when `n > 0` — use Nat.mod_lt and Nat.pos_of_ne_zero.
-- Note the `h :` in the if — this gives you a proof that `n ≠ 0`.
def myGcd (m n : Nat) : Nat :=
  if h : n = 0 then m
  else
    sorry -- add: have : m % n < n := Nat.mod_lt m (Nat.pos_of_ne_zero h)
    myGcd n (m % n)
  sorry -- add: termination_by n

-- Log base 2 (rounded down). Counts how many times you can halve.
-- `n / 2 < n` when `n > 0` — use `Nat.div_lt_self` with proofs
-- that `n > 0` and `2 > 1`.
-- Hint: Nat.div_lt_self (by omega) (by omega)
def myLog2 (n : Nat) : Nat :=
  if h : n ≤ 1 then 0
  else
    sorry -- add the `have` statement
    1 + myLog2 (n / 2)
  sorry -- add: termination_by n

#guard myGcd 12 8 == 4
#guard myGcd 35 14 == 7
#guard myLog2 1 == 0
#guard myLog2 8 == 3
#guard myLog2 10 == 3