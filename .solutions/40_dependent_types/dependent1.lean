/- # Dependent Types 1: Fin — Bounded Natural Numbers -/

def seven : Fin 10 := ⟨7, by omega⟩

def zero3 : Fin 3 := 0

def finToNat (i : Fin n) : Nat := i.val

theorem fin_bound (i : Fin n) : i.val < n := i.isLt

def safeGet (l : List Nat) (i : Fin l.length) : Nat :=
  l[i]

def impossible : Fin 0 → String := Fin.elim0

#guard seven.val == 7
#guard zero3.val == 0
#guard finToNat (⟨3, by omega⟩ : Fin 5) == 3
#guard safeGet [10, 20, 30] ⟨1, by decide⟩ == 20