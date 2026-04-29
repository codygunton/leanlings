def doubleAll (l : List Nat) : List Nat :=
  (· * 2) <$> l

def showOption (o : Option Nat) : Option String :=
  toString <$> o

-- Strategy: map a lambda that transforms only the second element
def mapSeconds (f : Nat → Nat) (l : List (String × Nat)) :
    List (String × Nat) :=
  (fun (a, b) => (a, f b)) <$> l

-- Strategy: compose two <$> applications
def doubleAndShow (l : List Nat) : List String :=
  toString <$> ((· * 2) <$> l)

#guard doubleAll [1, 2, 3] == [2, 4, 6]
#guard doubleAll [] == []
#guard showOption (some 42) == some "42"
#guard showOption none == none
#guard mapSeconds (· * 10) [("a", 1), ("b", 2)] == [("a", 10), ("b", 20)]
#guard doubleAndShow [1, 2, 3] == ["2", "4", "6"]
#guard doubleAndShow [] == []