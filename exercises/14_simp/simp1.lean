/- # Simplification 1: The @[simp] Lemma Database

`simp` applies a database of simplification lemmas. Many
standard library lemmas are tagged with `@[simp]` :

  @[simp] theorem List.append_nil : l ++ [] = l
  @[simp] theorem List.nil_append : [] ++ l = l
  @[simp] theorem List.length_nil : [].length = 0
  @[simp] theorem Nat.add_zero : n + 0 = n

When you write `simp`, Lean tries ALL tagged lemmas and
applies whichever ones simplify the goal. It repeats
until nothing changes.

Compare with other tactics :
  • `rfl` — only when both sides are definitionally equal
  • `omega` — only arithmetic (does NOT know about lists)
  • `simp` — applies lemma database, much more general

`simp` is powerful but NOT omniscient. It only knows lemmas
that someone tagged `@[simp]`. Custom definitions and
complex goals may need help.

TODO : Complete the proofs. All can be solved with `simp`.
-/

-- simp knows: l ++ [] = l  (List.append_nil)
-- InfoView shows: ⊢ l ++ [] = l
theorem append_nil (l : List Nat) : l ++ [] = l := by
  sorry

-- simp knows: [] ++ l = l  (List.nil_append)
-- InfoView shows: ⊢ [] ++ l = l
theorem nil_append (l : List Nat) : [] ++ l = l := by
  sorry

-- simp applies both lemmas in sequence!
-- InfoView shows: ⊢ [] ++ l ++ [] = l
-- simp simplifies [] ++ l → l, then l ++ [] → l.
theorem both_sides (l : List Nat) : [] ++ l ++ [] = l := by
  sorry

-- simp knows List.length_append — it handles length distributing over ++.
-- This is a real library lemma, not just definitional equality.
theorem length_append (l₁ l₂ : List Nat) :
    (l₁ ++ l₂).length = l₁.length + l₂.length := by
  sorry