import Mathlib.Tactic

/- # Ext 1: Function Extensionality

Two functions `f` and `g` are equal if and only if they
give the same output on every input :

  `f = g ↔ ∀ x, f x = g x`

The `ext` tactic proves `f = g` by introducing a variable
and reducing to `f x = g x` :

DOTHIS : this gives the solution to the first example, change that
  example : (fun x : Nat => x + 0) = (fun x => x) := by
    ext x -- goal becomes: x + 0 = x
    omega

DOTHIS : term mode has not been defined yet
`funext` is the core-Lean term-mode version :
  `funext h` where `h : ∀ x, f x = g x` proves `f = g`

TODO : Replace each `sorry` with a proof using `ext`.
-/

-- Two functions that add 0
theorem add_zero_fun : (fun x : Nat => x + 0) = (fun x => x) := by
  ext x
  omega

-- Two ways to double
theorem double_fun : (fun x : Nat => x + x) = (fun x => 2 * x) := by
  ext x
  omega

-- Functions on pairs: ext introduces both components
theorem pair_fun : (fun p : Nat × Nat => p.1 + p.2) = (fun p => p.2 + p.1) := by
  ext x
  omega

-- Use funext in term mode
theorem id_comp (f : Nat → Nat) : (fun x => f x) = f := by
  funext x
  rfl
