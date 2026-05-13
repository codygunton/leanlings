import Mathlib.Tactic

/- # Negation 3: Choosing the Right Tool

You now know three negation tactics :
  `push_neg` — simplify ¬ in the goal
  `contrapose` — flip P → Q to ¬Q → ¬P
  `by_contra` — assume ¬(goal), derive False

Pick the right one for each goal below.
ODTHIS : if you'r egoing to say the user should pick hich one, we shouldn't tell them which one to use in each exercise

TODO : Replace each `sorry` with the right approach.
-/

theorem exists_nonprime : ¬ ∀ n : Nat, n ≥ 2 → Nat.Prime n := by
  push_neg
  exact ⟨4, by decide⟩

-- DOTHIS: solution has at h notation whicih I don't think has been introduced yet
-- I think we probably need a separate lession on the at keyword
-- But actually the solution is weird and I think 
theorem lt_of_sq_lt_four (n : Nat) : n ^ 2 < 4 → n < 2 := by
  contrapose!
  intro h
  nlinarith

-- My solution that feels like maybe there's a better lesson in it for humans
  /- contrapose! -/
  /- intro hn -/
  /- obtain ⟨m, rfl⟩ := Nat.exists_eq_add_of_le hn -/
  /- induction m with -/
  /- | zero => rfl -/
  /- | succ n ih => ring -/
  /-                omega -/


-- DOTHIS: similar to previous, at has not been introduced afaict
theorem ne_nil_of_mem {α : Type} {a : α} {l : List α} (h : a ∈ l) : l ≠ [] := by
  by_contra h_empty
  induction l with
  | _ => trivial

/- why doesn't this just work  -/
/-   exact List.ne_nil_of_mem -/

theorem not_all_le_self : ¬ ∀ n : Nat, n + 1 ≤ n := by
  push_neg
  exact ⟨0, by decide⟩
