/- # Subtypes 2: Smart Constructors and Guards

You can't always construct a subtype — the proof might
not hold! Use `Option` to safely attempt construction :

  def safeByte (n : Nat) : Option Byte :=
    if h : n < 256 then some ⟨n, h⟩ else none

The `if h : condition` syntax (note the `h : `) gives you
a *proof* named `h` that the condition holds in the `then`
branch. This is called a "dependent if" or "decidable if".

To build a subtype value from an existing one, you need
to prove the predicate still holds. Use `have` to bring
the original proof into scope for `omega` :

  def double (p : PosNat) : PosNat :=
    ⟨p.val * 2, by have := p.property; omega⟩

TODO : Replace each `sorry` with the correct implementation.
-/

def PosNat := {n : Nat // n > 0}
def Byte := {n : Nat // n < 256}

-- Safely construct a PosNat. Return `none` if n = 0.
-- Use `if h : n > 0 then ... else ...` for the proof.
def mkPos (n : Nat) : Option PosNat := sorry

-- Safely construct a Byte. Return `none` if n ≥ 256.
def mkByte (n : Nat) : Option Byte := sorry

-- Double a PosNat, returning a PosNat (the result is still positive).
-- Hint: ⟨p.val * 2, by have := p.property; omega⟩
def doublePosNat (p : PosNat) : PosNat := sorry

-- A non-empty list: the list must not be [].
def NEList (α : Type) := {l : List α // l ≠ []}

-- Construct a non-empty list from a single element.
-- Hint: the proof that [x] ≠ [] can use `by simp`.
def singleton (x : α) : NEList α := sorry

-- Get the head of a non-empty list (always safe!).
-- Use `match l.val, l.property with | x :: _, _ => x`
def headNE (l : NEList α) : α := sorry

#guard (mkPos 3).isSome
#guard (mkPos 0).isNone
#guard (mkByte 42).isSome
#guard (mkByte 300).isNone
#guard (doublePosNat ⟨4, by omega⟩).val == 8
#guard headNE (singleton "hello") == "hello"