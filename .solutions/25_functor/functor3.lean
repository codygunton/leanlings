def wrapOption (n : Nat) : Option Nat := pure n

def applyOpt (f : Option (Nat → Nat)) (x : Option Nat) : Option Nat :=
  f <*> x

-- Strategy: <$> lifts (· + ·) into the first Option, <*> applies to second
def addOptions (a b : Option Nat) : Option Nat :=
  (· + ·) <$> a <*> b

-- Strategy: chain three-argument function with <$> and two <*>
def volume (w h d : Option Nat) : Option Nat :=
  (fun a b c => a * b * c) <$> w <*> h <*> d

-- Strategy: use <$> and <*> to combine strings
def fullName (first last : Option String) : Option String :=
  (· ++ " " ++ ·) <$> first <*> last

#guard wrapOption 42 == some 42
#guard applyOpt (some (· + 1)) (some 5) == some 6
#guard applyOpt none (some 5) == none
#guard applyOpt (some (· + 1)) none == none
#guard addOptions (some 3) (some 4) == some 7
#guard addOptions none (some 4) == none
#guard addOptions (some 3) none == none
#guard volume (some 2) (some 3) (some 4) == some 24
#guard volume none (some 3) (some 4) == none
#guard volume (some 2) none (some 4) == none
#guard fullName (some "Alice") (some "Smith") == some "Alice Smith"
#guard fullName none (some "Smith") == none
#guard fullName (some "Alice") none == none