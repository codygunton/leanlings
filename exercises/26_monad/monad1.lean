/- # Monad 1: Understanding Bind (`>>=`)

You've already used monads! Every `do` block desugars to
calls to `bind` (written `>>=`):

DOTHIS : I don't think this example is complete or makes sense
    do -- desugars to:
      let x ← getFirst getFirst >>= fun x =>
      let y ← getSecond x getSecond x >>= fun y =>
      return x + y pure (x + y)

`>>=` chains two computations :
  `m >>= f` runs `m`, feeds the result to `f`, returns `f`'s result.
  If `m` fails (e.g., `none`), the whole chain fails.

For `Option` :
  `some 5 >>= f` = `f 5` — unwrap and continue
  `none >>= f` = `none` — short-circuit

TODO : Rewrite each `do` block using explicit `>>=` and `pure`.
-/

def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

-- Rewrite using >>= instead of do notation
-- do let x ← safeDivide 10 2; let y ← safeDivide x 1; return x + y
def chainBind : Option Nat :=
  safeDivide 10 2 >>= fun x => safeDivide x 1
                  >>= fun y => x + y

-- Same idea: chain two operations with >>=
-- do let x ← some 3; let y ← some 4; return x * y
-- DOTHIS this exercise is kinda contrived...
def multiplyBind : Option Nat :=
  some 3 >>= fun x => pure (x * 4)

-- Short-circuit: if the first step returns none, the chain stops
-- do let x ← (none : Option Nat); return x + 1
-- DOTHIS I odn't undrstand why this works or what it's showing
def failBind : Option Nat :=
  (none : Option Nat) >>= (fun x => pure (x+1) )


-- Combine: parse two strings as numbers, add them
-- Use >>= to chain: try first, try second, combine
def addStrings (a b : String) : Option Nat :=
  a >>= String.toNat? >>= fun n1 =>
  b >>= String.toNat? >>= fun n2 => pure (n1 + n2)

#eval addStrings "2" "3"

-- Don't change below this line!
#guard chainBind == some 10
#guard multiplyBind == some 12
#guard failBind == none
#guard addStrings "3" "4" == some 7
#guard addStrings "3" "abc" == none
#guard addStrings "abc" "4" == none
