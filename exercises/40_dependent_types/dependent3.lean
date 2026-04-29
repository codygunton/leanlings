/- # Dependent Types 3: Proofs with Indexed Families

Because the length lives in the type, many properties that
require *proofs* for ordinary lists are *free* for Vec :

  - `Vec.head` doesn't need `Option` — the type says it's non-empty
  - `Vec.zip` can't receive mismatched lengths — it's a type error
  - `Vec.map` preserves length *by construction*

You can also write functions that compute a Nat and prove
it matches the index. And you can prove theorems about Vec
operations using the same induction techniques as for List.

TODO : Replace each `sorry` with the correct implementation or proof.
-/

inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons : α → Vec α n → Vec α (n + 1)

-- Count the elements in a Vec (returns a plain Nat).
-- Match: nil → 0, cons _ xs → 1 + recurse.
def Vec.length : Vec α n → Nat := sorry

-- Prove that Vec.length always returns n (the type index).
-- Induction on v: nil case is rfl. cons case uses
-- `simp [Vec.length, ih]; omega` to handle 1 + n✝ = n✝ + 1.
theorem Vec.length_eq : (v : Vec α n) → Vec.length v = n := sorry

-- Apply a function twice to every element.
def Vec.mapTwice (f : α → α) : Vec α n → Vec α n
  | .nil => .nil
  | .cons x xs => .cons (f (f x)) (Vec.mapTwice f xs)

-- Prove that mapping id gives back the same Vec.
-- Hint: induction on v, then `simp [Vec.map]` in each case.
def Vec.map (f : α → β) : Vec α n → Vec β n
  | .nil => .nil
  | .cons x xs => .cons (f x) (Vec.map f xs)

theorem Vec.map_id : (v : Vec α n) → Vec.map id v = v := sorry