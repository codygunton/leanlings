/- # InfoView 3: Hypotheses in the Proof State

When a theorem has assumptions (like `h : a = b`), they
appear as *hypotheses* above the ⊢ line in InfoView :

    a b : Nat ← variables
    h : a = b ← hypothesis (a fact you can use)
    ⊢ a = b ← goal (what you need to prove)

When the goal is an implication `P → Q`, the tactic
`intro h` moves the assumption into your context :

  BEFORE intro : AFTER intro h :
    ⊢ P → Q h : P
                             ⊢ Q

You'll learn `intro` properly in the next unit. Here,
just observe how it changes the InfoView state.

TODO : Complete the proofs. Check InfoView after EVERY step.
-/

-- The hypothesis `h` is already in context (it's a parameter).
-- InfoView shows:  a b : Nat,  h : a = b  ⊢  a = b
-- What tactic closes a goal that matches a hypothesis exactly?
-- `exact term` closes the goal when `term` has the right type.
-- (This tactic is taught properly in the next unit — see the worked example.)
theorem use_hyp (a b : Nat) (h : a = b) : a = b := by
  exact h

-- InfoView shows:  h : 5 = 5  ⊢  5 = 5
-- Same idea — `exact h` provides the proof.
theorem use_hyp2 (h : 5 = 5) : 5 = 5 := by
  exact h

-- Now with `intro`. Before intro:  ⊢  P → P
-- After `intro h`:  h : P  ⊢  P
-- (P moved from goal to hypothesis!)
-- Place cursor after `intro h` and confirm in InfoView.
theorem self_impl (P : Prop) : P → P := by
  intro h
  exact h

-- Two intros needed: the goal is A → B → B.
-- After `intro ha`: ha : A  ⊢  B → B
-- After `intro hb`: ha : A,  hb : B  ⊢  B
-- Which hypothesis matches the final goal?
theorem use_second_hyp (A B : Prop) : A → B → B := by
  intro ha
  intro hb
  exact hb

-- Now combine omega with a hypothesis.
-- InfoView shows: a b : Nat,  h : a = b  ⊢  a + 1 = b + 1
-- omega can use hypotheses automatically!
theorem shift (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  omega
