/- # Dependent Types 3: Proofs with Indexed Families -/

inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons : α → Vec α n → Vec α (n + 1)

def Vec.length : Vec α n → Nat
  | .nil => 0
  | .cons _ xs => 1 + Vec.length xs

theorem Vec.length_eq : (v : Vec α n) → Vec.length v = n
  | .nil => rfl
  | .cons _ xs => by simp [Vec.length, Vec.length_eq xs]; omega

def Vec.mapTwice (f : α → α) : Vec α n → Vec α n
  | .nil => .nil
  | .cons x xs => .cons (f (f x)) (Vec.mapTwice f xs)

def Vec.map (f : α → β) : Vec α n → Vec β n
  | .nil => .nil
  | .cons x xs => .cons (f x) (Vec.map f xs)

theorem Vec.map_id : (v : Vec α n) → Vec.map id v = v
  | .nil => rfl
  | .cons x xs => by simp [Vec.map, Vec.map_id xs]