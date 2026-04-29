/- # Subtypes 1: Refinement Types

Lean lets you attach a **proof obligation** to a type using
subtypes. The notation `{x : T // P x}` means "a value of
type T, together with a proof that P holds for that value."

The underlying structure has two fields :
  `.val` — the wrapped value
  `.property` — the proof that the predicate holds

You construct subtypes with angle brackets :
  `⟨value, proof⟩`

For example :
  def PosNat := {n : Nat // n > 0}
  def three : PosNat := ⟨3, by omega⟩
  #eval three.val -- 3

The proof is checked at compile time — you CANNOT create
an invalid subtype value. `⟨0, by omega⟩ : PosNat` fails!

TODO : Replace each `sorry` with the correct implementation.
-/

-- A positive natural number: value must be > 0
def PosNat := {n : Nat // n > 0}

-- Construct a PosNat holding the value 5.
-- Hint: ⟨value, proof⟩ where proof can be `by omega`
def five : PosNat := sorry

-- A bounded byte: value must be < 256
def Byte := {n : Nat // n < 256}

-- Construct a Byte holding the value 42.
def fortyTwo : Byte := sorry

-- Extract the value from a PosNat and double it.
-- Note: the result is just a Nat, no proof needed.
def doubleVal (p : PosNat) : Nat := sorry

-- Extract and add two PosNat values.
def addVals (a b : PosNat) : Nat := sorry

#guard (five.val == 5)
#guard (fortyTwo.val == 42)
#guard (doubleVal ⟨3, by omega⟩ == 6)
#guard (addVals ⟨2, by omega⟩ ⟨3, by omega⟩ == 5)