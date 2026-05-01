/- # Simplification 2: Controlled Simplification

`simp` uses its built-in database. For YOUR definitions,
you must tell simp about them :

  `simp [f]` — add `f`'s definition to simp's knowledge
  `simp [f, g]` — add multiple definitions

For maximum control :

  `simp only [lemma1, lemma2]` — ONLY use these lemmas

`simp only` is useful when `simp` does too much or you want
to understand exactly which lemmas are being applied.

Common pattern :
  `simp [myDef]` — unfold myDef, simplify the result
  `simp [myDef]; omega` — unfold, then arithmetic finishes

TODO : Complete the proofs using `simp [f]` or `simp only`.
-/

def double (n : Nat) : Nat := n + n
def square (n : Nat) : Nat := n * n

-- `simp [double]` unfolds `double n` → `n + n`
-- Then the goal `n + n = 2 * n` is arithmetic.
-- InfoView after simp: ⊢ n + n = 2 * n (or closes if simp + omega)
theorem double_eq (n : Nat) : double n = 2 * n := by
  simp [double]
  omega

-- `simp [square]` unfolds `square n` → `n * n`
-- Lean can compute 3 * 3 = 9.
theorem square_three : square 3 = 9 := by
  simp [square]

-- Use `simp only [List.append_nil]` — just one specific lemma.
-- Compare: `simp` would also work, but `simp only` is precise.
-- InfoView shows: ⊢ l ++ [] = l
theorem precise_simp (l : List Nat) : l ++ [] = l := by
  simp only [List.append_nil]

-- Unfold both definitions at once with `simp [double, square]`.
-- InfoView after simp: arithmetic involving n + n and n * n.
theorem double_vs_square_zero : double 0 = square 0 := by
  unfold double
  unfold square
  omega
