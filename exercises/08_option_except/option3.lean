/- # Option 3: Chaining with map and bind

Both `.map` and `.bind` propagate `none` automatically.
They differ in what `f` returns :

  `.map (f : α → β) : Option α → Option β`
  `.bind (f : α → Option β) : Option α → Option β`

Use `.map` when `f` can't fail (plain value).
Use `.bind` when `f` can also fail (returns Option).

  (some 5).map (· + 1) = some 6
  (some 5).bind (fun n => if n > 3 then some n else none) = some 5
  none.map (· + 1) = none
  none.bind (fun _ => some 1) = none

`|>` (pipe) passes the left side as input to the right :
  x |> f is the same as f x

TODO : Implement using `.map` and `.bind`.
-/

-- Use `.map` to add 10 to the value inside an Option.
def addTen (o : Option Nat) : Option Nat :=
  o.map (· + 10)

-- Use `.bind` to chain two lookups.
-- Given a list of (key, value) pairs, look up a key.
def lookup (key : String) (pairs : List (String × Nat)) : Option Nat :=
  pairs.find? (·.1 == key) |>.map (·.2)

-- Input: a map that may contain "name" and "age" keys.
-- Return the age if present and ≥ 18, otherwise `none`.
def findAdult (pairs : List (String × Nat)) : Option Nat :=
  let o := lookup "age" pairs
  o.bind (fun a => if a ≥ 18 then some a else none)

-- Input: a map that may contain "width" and "height" keys.
-- Compute the area, or `none` if either key is missing.
def computeArea (config : List (String × Nat)) : Option Nat :=
  let ow := lookup "width" config
  let oh := lookup "height" config
  ow.bind (fun w => oh.map (w * ·))

#guard addTen (some 5) == some 15
#guard addTen none == none
#guard findAdult [("name", 0), ("age", 25)] == some 25
#guard findAdult [("name", 0), ("age", 12)] == none
#guard findAdult [("name", 0)] == none
#guard computeArea [("width", 10), ("height", 5)] == some 50
#guard computeArea [("width", 10)] == none
#guard computeArea [] == none