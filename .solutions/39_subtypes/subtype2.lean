/- # Subtypes 2: Smart Constructors and Guards -/

def PosNat := {n : Nat // n > 0}
def Byte := {n : Nat // n < 256}

def mkPos (n : Nat) : Option PosNat :=
  if h : n > 0 then some ⟨n, h⟩ else none

def mkByte (n : Nat) : Option Byte :=
  if h : n < 256 then some ⟨n, h⟩ else none

def doublePosNat (p : PosNat) : PosNat :=
  ⟨p.val * 2, by have := p.property; omega⟩

def NEList (α : Type) := {l : List α // l ≠ []}

def singleton (x : α) : NEList α := ⟨[x], by simp⟩

def headNE (l : NEList α) : α :=
  match l.val, l.property with
  | x :: _, _ => x

#guard (mkPos 3).isSome
#guard (mkPos 0).isNone
#guard (mkByte 42).isSome
#guard (mkByte 300).isNone
#guard (doublePosNat ⟨4, by omega⟩).val == 8
#guard headNE (singleton "hello") == "hello"