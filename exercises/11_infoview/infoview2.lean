/- # InfoView 2: Watching Tactics Transform Goals

Each tactic changes the proof state. Mastering proofs means
predicting what a tactic will do BEFORE you run it, then
confirming in InfoView.

Key patterns to watch for :

  `unfold f` — replaces `f x` with its definition body
               (InfoView : `f x` disappears, the body appears)

  `simp [f]` — unfolds `f` AND simplifies the result
               (InfoView : goal gets simpler or closes entirely)

  `omega` — closes arithmetic goals
               (InfoView : "No goals" — the proof is done!)

HOW TO DO THIS EXERCISE :
  Each proof has a FIRST step already filled in.
  Place your cursor AFTER that step and read InfoView.
  Then replace `sorry` with the tactic that closes the goal.

TODO : Replace each `sorry` with the right tactic.
       Always check InfoView between steps.
-/

def double (n : Nat) : Nat := n + n

-- Step 1 unfolds `double n` → `n + n`.
-- After unfold, InfoView shows: ⊢ n + n = n + n
-- What closes a goal where both sides are identical?
theorem double_self (n : Nat) : double n = n + n := by
  unfold double
  rfl

-- Step 1 unfolds `double`.
-- After unfold, InfoView shows: ⊢ n + n = 2 * n
-- What handles arithmetic with variables?
theorem double_two_mul (n : Nat) : double n = 2 * n := by
  unfold double
  omega

-- simp [double] unfolds AND simplifies in one step.
-- But here the arithmetic isn't trivial enough for simp alone.
-- After simp, InfoView shows something like: ⊢ n + n + (n + n) = 4 * n
-- What tactic finishes arithmetic?
theorem double_double (n : Nat) : double (double n) = 4 * n := by
  simp [double]
  omega

-- Now YOU write both steps.
-- Hint: use `simp [triple, double]` to unfold both definitions, then check InfoView.
def triple (n : Nat) : Nat := 3 * n

theorem triple_vs_double (n : Nat) : triple n = double n + n := by
  unfold triple
  unfold double
  omega
