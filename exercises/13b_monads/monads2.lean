/- # Monads 2: Bind for Except

  `Except ε α` is like `Option α` but carries an error value :
    • `.ok value` — success
    • `.error msg` — failure with a message

  Its monad operations :
    • `pure x = .ok x`
    • `bind (.ok x) f = f x`
    • `bind (.error e) f = .error e` -- short-circuits with error

  Notice the pattern : `bind` always means "if the previous step
  succeeded, feed its result to the next step; otherwise propagate
  the failure." The *kind* of failure (none vs .error) depends on
  the monad.

  DOTHIS : is this a narrow framing? Maybe we should also touch on IO monad?

  TODO : Implement bind and pure for Except, then chain them.
-/

-- Manual pure for Except
def exceptPure (x : α) : Except ε α := .ok x

-- Manual bind for Except
def exceptBind (x : Except ε α) (f : α → Except ε β) : Except ε β :=
  match x with
  | .ok v => f v
  | .error e => .error e

-- Some validation functions
def checkPositive (n : Int) : Except String Int :=
  if n > 0 then .ok n else .error "not positive"

def checkSmall (n : Int) : Except String Int :=
  if n < 100 then .ok n else .error "too large"

-- Chain the two checks using your exceptBind.
-- Validate that n is positive, then that it's small.
def validate (n : Int) : Except String Int :=
  (exceptBind (checkPositive n) checkSmall )

-- Don't change below this line!
deriving instance BEq for Except
#guard exceptPure 42 == (.ok 42 : Except String Nat)
#guard exceptBind (.ok 5 : Except String Nat) (fun x => .ok (x + 1)) == .ok 6
#guard exceptBind (.error "bad" : Except String Nat) (fun x => .ok (x + 1)) == .error "bad"
#guard validate 50 == .ok 50
#guard validate (-1) == .error "not positive"
#guard validate 200 == .error "too large"
