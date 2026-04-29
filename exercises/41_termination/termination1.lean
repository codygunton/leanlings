/- # Termination 1: Telling Lean What Decreases

So far, all our recursive functions used **structural recursion** :
the recursive call was on a strict subterm of the input
(like `n` in `n + 1`, or `xs` in `x :: xs`). Lean accepts
these automatically.

But some functions don't recurse on a subterm :

  def div (n k : Nat) : Nat :=
    if n < k then 0 else 1 + div (n - k) k

Here `n - k` is not a syntactic subterm of `n`. Lean rejects
this unless you explain WHY the recursion terminates.

`termination_by expr` says : "this expression decreases on
every recursive call." Lean then asks you to prove it.
For simple Nat cases, `omega` closes the proof automatically
via `decreasing_by omega`.

IMPORTANT : Use `=` (propositional equality) in your `if`, not
`==` (boolean equality). `if n = 0` gives Lean a proof that
`n ≠ 0` in the else branch, which the termination checker needs.
`if n == 0` gives no such proof!

TODO : Add `termination_by` (and `decreasing_by omega` where
      needed) to make each function compile.
-/

-- countdown: count from n down to 0.
-- The recursive call is on `n - 1`. Tell Lean that `n` decreases.
-- Hint: add `termination_by n` after the function body.
def countdown (n : Nat) : List Nat :=
  if n = 0 then [0]
  else n :: countdown (n - 1)
  sorry -- replace with: termination_by n

-- halve: keep dividing by 2 until we reach 0.
-- `n / 2` is smaller than `n` when `n > 0`.
def halve (n : Nat) : Nat :=
  if n = 0 then 0
  else 1 + halve (n / 2)
  sorry -- replace with: termination_by n

-- repeated subtraction division: n / k via subtraction.
-- `n - k` is smaller than `n` when `k > 0` and `n ≥ k`.
def myDiv (n k : Nat) (hk : k > 0) : Nat :=
  if n < k then 0
  else 1 + myDiv (n - k) k hk
  sorry -- replace with: termination_by n

#guard countdown 5 == [5, 4, 3, 2, 1, 0]
#guard halve 16 == 5
#guard myDiv 10 3 (by omega) == 3