/- # Type Classes 1: Using Type Classes

A type class is NOT a data type — it's an interface.
`inductive` and `structure` define what values LOOK like;
`class` defines what operations a type SUPPORTS.

Type classes provide overloaded operations :

  • `ToString α` — convert to String via `toString`
  • `Repr α` — display with `#eval` via `repr`
  • `BEq α` — equality check via `==`

  You can add these automatically with `deriving` :

    structure Foo where
      x : Nat
      deriving Repr, BEq

Or define instances manually :

    instance : ToString Foo where
      toString f := s!"Foo({f.x})"

  TODO : Add a `ToString` instance for `Color`.
  -/

inductive Color where
  | red
  | green
  | blue
deriving Repr, BEq

-- TODO: Implement ToString for Color
instance : ToString Color where
  /- toString := fun r => match r with  -/
  /-  | .red => s!"Color: red" -/
  /-  | .green => s!"Color: red" -/
  /-  | .blue => s!"Color: red" -/
  toString := fun
   | .red => s!"Color: red"
   | .green => s!"Color: green"
   | .blue => s!"Color: blue"
-- TODO: Implement ToString for Color