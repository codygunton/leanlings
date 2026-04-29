/- # Termination 3: Partial Functions and the Fuel Pattern

Some functions genuinely might not terminate :

  def collatz (n : Nat) : Nat :=
    if n ≤ 1 then 0
    else if n % 2 == 0 then 1 + collatz (n / 2)
    else 1 + collatz (3 * n + 1)

Nobody has proved the Collatz conjecture terminates for all n!
Lean offers two escape hatches :

**`partial def`** — Lean skips the termination check entirely.
The tradeoff : partial functions are opaque to the proof checker.
You can RUN them but cannot PROVE anything about them.

**The fuel pattern** — Add an extra `Nat` parameter that counts
down. Recurse on that parameter (structural recursion). Return
`none` if fuel runs out. This is total and provable, but the
caller must supply enough fuel.

TODO : Replace each `sorry` with the correct implementation.
-/

-- 1. Make this a partial function.
-- Add `partial` before `def`, then implement the body:
-- if n ≤ 1, return 0. If even, recurse on n/2.
-- If odd, recurse on 3*n+1. Count the number of steps.
partial def collatzSteps (n : Nat) : Nat := sorry

-- 2. Fuel pattern: same logic but with a fuel parameter.
-- Return `none` when fuel runs out.
-- Match on fuel first (0 → none, fuel+1 → do the work).
def collatzFuel : Nat → Nat → Option Nat := sorry

-- 3. A total function: logarithm base b.
-- logBase b n hb returns how many times you can divide n by b.
-- Use `if h : n < b` to get a proof in scope.
-- Then `have hpos : 0 < n := by omega` (since n ≥ b > 1)
-- and `have : n / b < n := Nat.div_lt_self hpos hb`.
def logBase (b n : Nat) (hb : b > 1) : Nat :=
  if h : n < b then 0
  else
    sorry -- add: have hpos : 0 < n := by omega
    sorry -- add: have : n / b < n := Nat.div_lt_self hpos hb
    1 + logBase b (n / b) hb
  sorry -- add: termination_by n

#guard collatzFuel 1 100 == some 0
#guard collatzFuel 4 100 == some 2
#guard collatzFuel 27 200 == some 111
#guard collatzFuel 27 5 == none -- not enough fuel!
#guard logBase 2 1 (by omega) == 0
#guard logBase 2 8 (by omega) == 3
#guard logBase 10 100 (by omega) == 2