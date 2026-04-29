/- # Subtypes 1: Refinement Types -/

def PosNat := {n : Nat // n > 0}

def five : PosNat := ⟨5, by omega⟩

def Byte := {n : Nat // n < 256}

def fortyTwo : Byte := ⟨42, by omega⟩

def doubleVal (p : PosNat) : Nat := p.val * 2

def addVals (a b : PosNat) : Nat := a.val + b.val

#guard (five.val == 5)
#guard (fortyTwo.val == 42)
#guard (doubleVal ⟨3, by omega⟩ == 6)
#guard (addVals ⟨2, by omega⟩ ⟨3, by omega⟩ == 5)