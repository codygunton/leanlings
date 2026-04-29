/- # Cases and Have 3: Cases on Data Types

`cases` works on any inductive type, not just propositions :

    cases n with
    | zero => ...
    | succ m => ... -- m is the predecessor

  For Bool :
    cases b with
    | true => ...
    | false => ...

    This is tactic-mode pattern matching.

    Tip : `<;>` applies a tactic to ALL resulting subgoals at once :
    cases b <;> rfl -- tries `rfl` in every branch

      TODO : Prove these using `cases`.
      -/

--- QUESTION: Nat is an inductive type? Does that mean its definition is thorugh induction? what is the def?
-- A number is either zero or positive
theorem zero_or_pos (n : Nat) : n = 0 ∨ n > 0 := by
  cases n with
  | zero => trivial
  | succ m => omega

-- Boolean and is commutative
theorem bool_and_comm (a b : Bool) : (a && b) = (b && a) := by
  cases a with
  | true => simp
  | false => simp