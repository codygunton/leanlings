/- # Dependent Types 1: Fin — Bounded Natural Numbers

`Fin n` is a natural number guaranteed to be less than `n`.
It has two fields :

  `.val` — the underlying Nat
  `.isLt` — a proof that `val < n`

`Fin 5` can hold 0, 1, 2, 3, or 4 — but not 5!

Construction :
  (3 : Fin 5) -- numeric literal (Lean checks the bound)
  ⟨3, by omega⟩ : Fin 5 -- explicit proof
  Fin.mk 3 (by omega) -- named constructor

`Fin 0` has NO values — it's an empty type! This is useful :
any function `Fin 0 → α` is trivially total (no cases to handle).

TODO : Replace each `sorry` with the correct implementation.
-/

-- Create a Fin 10 holding the value 7.
-- Use the explicit ⟨val, proof⟩ syntax.
def seven : Fin 10 := sorry

-- Create a Fin 3 holding the value 0.
-- Hint: numeric literals work too.
def zero3 : Fin 3 := sorry

-- Extract the Nat value from a Fin.
def finToNat (i : Fin n) : Nat := sorry

-- Given a Fin n, prove its value is less than n.
-- Hint: the proof is already inside the Fin!
theorem fin_bound (i : Fin n) : i.val < n := sorry

-- Safe array indexing: given a `Fin (List.length l)`,
-- we can always index into `l` without bounds checking.
-- Lean's `l[i]` syntax does this when `i : Fin l.length`.
def safeGet (l : List Nat) (i : Fin l.length) : Nat :=
  sorry

-- Handle the impossible: a function from Fin 0.
-- Hint: `Fin.elim0` eliminates a `Fin 0` value.
def impossible : Fin 0 → String := sorry

#guard seven.val == 7
#guard zero3.val == 0
#guard finToNat (⟨3, by omega⟩ : Fin 5) == 3
#guard safeGet [10, 20, 30] ⟨1, by decide⟩ == 20