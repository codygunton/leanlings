def addTen (o : Option Nat) : Option Nat :=
  o.map (· + 10)

def lookup (key : String) (pairs : List (String × Nat)) : Option Nat :=
  pairs.find? (·.1 == key) |>.map (·.2)

-- Strategy: bind lookup result into a check
def findAdult (pairs : List (String × Nat)) : Option Nat :=
  (lookup "age" pairs).bind (fun age =>
    if age >= 18 then some age else none)

-- Strategy: bind chains two lookups
def computeArea (config : List (String × Nat)) : Option Nat :=
  (lookup "width" config).bind (fun w =>
    (lookup "height" config).map (w * ·))

#guard addTen (some 5) == some 15
#guard addTen none == none
#guard findAdult [("name", 0), ("age", 25)] == some 25
#guard findAdult [("name", 0), ("age", 12)] == none
#guard findAdult [("name", 0)] == none
#guard computeArea [("width", 10), ("height", 5)] == some 50
#guard computeArea [("width", 10)] == none
#guard computeArea [] == none