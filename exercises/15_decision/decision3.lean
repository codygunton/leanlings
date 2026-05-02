/- # Decision Procedures 3: Choosing Automation

By now you know several automation tactics :

  `rfl` — both sides are definitionally equal
  `omega` — linear arithmetic (Nat/Int, +, -, ≤, <, const *)
  `decide` — concrete finite propositions (no variables)
  `simp` — apply @[simp] lemma database (lists, etc.)
  `rw` — targeted rewriting with an equation

Quick decision guide :
  1. Both sides identical after computation? → `rfl`
  2. Arithmetic with variables? → `omega`
  3. Concrete, no variables? → `decide` (or `rfl`)
  4. List operations or known lemmas? → `simp`
  5. Need to reshape the goal? → `rw [...]`

The WRONG tactic usually gives a clear error. Experiment!

TODO : Choose the right tactic for each goal. No hints!
-/

-- What tactic?
theorem p1 : (10 : Nat) = 10 := by
  rfl

-- What tactic?
theorem p2 (n : Nat) : n + 3 = 3 + n := by
  rw [Nat.add_comm]

-- What tactic?
theorem p3 : [1, 2] ++ [3] = [1, 2, 3] := by
  decide

-- What tactic?
theorem p4 (l : List Nat) : l ++ [] = l := by
  rw [List.append_nil]

-- What tactic?
theorem p5 : ¬(3 = 5) := by
  decide

-- What tactic(s)? (May need more than one)
def f (n : Nat) : Nat := n + 10

theorem p6 (n : Nat) : f n = n + 10 := by
  rfl

-- What tactic? Think about what's in the context.
theorem p7 (a b : Nat) (h1 : a = b) (h2 : b = 0) : a = 0 := by
  simp [h1, h2]