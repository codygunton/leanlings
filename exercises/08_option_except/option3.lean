/- # Option 3: Chaining with map, bind, and do

When you have several operations that might fail, chaining
them with pattern matching gets deeply nested. Lean provides
cleaner tools :

  `Option.map f o` — apply `f` to the value inside, if any
    (some 5).map (· + 1) = some 6
    none.map (· + 1) = none

  `Option.bind o f` — chain : if `o` is `some x`, run `f x`
    (some 5).bind (fun n => if n > 3 then some n else none)

  `do` notation — syntactic sugar for bind :
    do let x ← someOption -- extract, or short-circuit
       let y ← anotherOption
       pure (x + y) -- wrap result in `some`

TODO : Implement using `.map`, `.bind`, or `do` notation.
-/

-- Use `.map` to add 10 to the value inside an Option.
def addTen (o : Option Nat) : Option Nat := sorry

-- Use `.bind` to chain two lookups.
-- Given a list of (key, value) pairs, look up a key.
def lookup (key : String) (pairs : List (String × Nat)) : Option Nat :=
  pairs.find? (·.1 == key) |>.map (·.2)

-- Use `lookup` twice: first find "age", then check if it's ≥ 18.
-- Return `none` if the key is missing OR the age is under 18.
def findAdult (pairs : List (String × Nat)) : Option Nat := sorry

-- Use `do` notation to chain three Option operations.
-- Parse a "config": look up "width" and "height", return their product.
-- Return `none` if either key is missing.
def computeArea (config : List (String × Nat)) : Option Nat := sorry

#guard addTen (some 5) == some 15
#guard addTen none == none
#guard findAdult [("name", 0), ("age", 25)] == some 25
#guard findAdult [("name", 0), ("age", 12)] == none
#guard findAdult [("name", 0)] == none
#guard computeArea [("width", 10), ("height", 5)] == some 50
#guard computeArea [("width", 10)] == none
#guard computeArea [] == none