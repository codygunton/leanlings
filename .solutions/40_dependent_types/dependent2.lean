/- # Dependent Types 2: Indexed Families -/

inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons : α → Vec α n → Vec α (n + 1)

def Vec.head : Vec α (n + 1) → α
  | .cons x _ => x

def Vec.tail : Vec α (n + 1) → Vec α n
  | .cons _ t => t

def Vec.replicate : (n : Nat) → α → Vec α n
  | 0, _ => .nil
  | n + 1, x => .cons x (Vec.replicate n x)

def Vec.map (f : α → β) : Vec α n → Vec β n
  | .nil => .nil
  | .cons x xs => .cons (f x) (Vec.map f xs)

def Vec.zip : Vec α n → Vec β n → Vec (α × β) n
  | .nil, .nil => .nil
  | .cons a as, .cons b bs => .cons (a, b) (Vec.zip as bs)

def v123 : Vec Nat 3 := .cons 1 (.cons 2 (.cons 3 .nil))
def vABC : Vec String 3 := .cons "a" (.cons "b" (.cons "c" .nil))

#guard Vec.head v123 == 1
#guard Vec.head vABC == "a"