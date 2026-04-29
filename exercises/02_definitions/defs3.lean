/- # Definitions 3: Let Bindings

`let` introduces local definitions within an expression :

    let x := 5
    let y := x + 1
    y * 2 -- evaluates to 12

  Each `let` binding is followed by the expression that uses it.

  TODO : Use let bindings to compute (a + b) * (a - b)
        where a = 10 and b = 3.
-/

def difference_of_squares : Nat :=
  let a := 10
  let b := 3
  (a + b) * (a - b)

-- Don't change below this line!
#guard difference_of_squares == 91