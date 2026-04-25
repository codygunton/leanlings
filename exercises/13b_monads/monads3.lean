/- # Monads 3: The Monad Type Class

  Lean's `Monad` type class provides `pure` and `bind` for any
  monadic type. You don't need to call `optionBind` or
  `exceptBind` by hand — the type class dispatches automatically.

  The real signatures (simplified):
    class Monad (m : Type → Type) where
      pure : α → m α
      bind : m α → (α → m β) → m β

  `Option` and `Except String` are already instances.

  You can call `bind` directly, or use the operator `>>=` :
    bind x f ≡ x >>= f

  The `do` notation you'll learn next is just sugar for `>>=`.
  These are equivalent :
    do let x ← e₁; e₂ x ≡ e₁ >>= fun x => e₂ x

  TODO : Rewrite using >>= to see that it's just bind.
-/

def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

-- Rewrite using >>= (bind operator)
-- Compute 100 / 5 / 4 (should be some 5)
-- Hint: safeDivide 100 5 >>= fun x => ...
def chainDivide : Option Nat :=
  safeDivide 100 5 >>= (safeDivide · 4)

def checkPositive (n : Int) : Except String Int :=
  if n > 0 then .ok n else .error "not positive"

def checkSmall (n : Int) : Except String Int :=
  if n < 100 then .ok n else .error "too large"

-- Rewrite using >>=
-- Chain checkPositive then checkSmall
def validate (n : Int) : Except String Int :=
  checkPositive n >>= checkSmall

-- Don't change below this line!
deriving instance BEq for Except
#guard chainDivide == some 5
#guard validate 50 == .ok 50
#guard validate (-1) == .error "not positive"
#guard validate 200 == .error "too large"
