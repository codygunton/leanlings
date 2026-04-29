def mapM' [Monad m] (f : α → β) (mx : m α) : m β := do
  let x ← mx
  pure (f x)

def seqM [Monad m] (ma : m α) (mb : m β) : m β := do
  let _ ← ma
  mb

def forM' [Monad m] (f : α → m β) : List α → m (List β)
  | [] => pure []
  | x :: xs => do
    let y ← f x
    let ys ← forM' f xs
    pure (y :: ys)

#guard mapM' (· + 1) (some 5) == some 6
#guard mapM' (· + 1) (none : Option Nat) == none

#guard seqM (some 1) (some 2) == some 2
#guard seqM (none : Option Nat) (some 2) == (none : Option Nat)

def safeDouble (n : Nat) : Option Nat :=
  if n > 100 then none else some (n * 2)

#guard forM' safeDouble [1, 2, 3] == some [2, 4, 6]
#guard forM' safeDouble [1, 200, 3] == none
#guard forM' safeDouble ([] : List Nat) == some []