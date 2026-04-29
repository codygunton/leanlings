def myDouble (n : Nat) : Nat := n + n
def myTriple (n : Nat) : Nat := n + n + n

theorem myDouble_def (n : Nat) : myDouble n = n + n := by
  unfold myDouble; rfl

-- Strategy: unfold to get linear arithmetic, then omega
theorem myTriple_eq (n : Nat) : myTriple n = 3 * n := by
  unfold myTriple; omega

-- Strategy: simp unfolds all occurrences of myDouble, omega finishes
theorem myDouble_succ (n : Nat) :
    myDouble (n + 1) = myDouble n + 2 := by
  simp [myDouble]; omega

-- Strategy: both sides reduce to n + n + n after unfolding
theorem triple_vs_double (n : Nat) :
    myTriple n = myDouble n + n := by
  simp [myTriple, myDouble]