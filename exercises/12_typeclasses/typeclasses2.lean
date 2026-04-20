/- # Type Classes 2: Defining Instances

You can define your own type classes :

    class Describable (α : Type) where
      describe : α → String

  And provide instances for specific types :

    instance : Describable Nat where
      describe n := s!"the number {n}"

  TODO : 1. Implement the `BEq` instance for `Suit`.
        2. Implement the `Describable` instance for `Suit`.
  -/

inductive Suit where
  | hearts
  | diamonds
  | clubs
  | spades
deriving Repr

class Describable (α : Type) where
  describe : α → String

-- TODO: Implement BEq for Suit
instance : BEq Suit where
  beq := fun
  | .hearts => fun | .hearts => true | _ => false
  | .diamonds => fun | .diamonds => true | _ => false
  | .clubs => fun | .clubs => true | _ => false
  | .spades => fun | .spades => true | _ => false

-- TODO: Implement Describable for Suit
instance : Describable Suit where
  describe := fun
  | .hearts => "hearts"
  | .diamonds => "diamonds"
  | .clubs => "clubs"
  | .spades => "spades"

-- Don't change below this line!
#guard (Suit.hearts == Suit.hearts) == true
#guard (Suit.hearts == Suit.diamonds) == false
#guard (Suit.clubs == Suit.spades) == false
open Describable in
#guard (describe Suit.hearts).length > 0
open Describable in
#guard (describe Suit.diamonds).length > 0