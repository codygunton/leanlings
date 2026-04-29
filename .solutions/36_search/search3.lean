import Mathlib.Tactic

/- # Search 3: Review — Pick Your Tactic -/

theorem p1 (x : Int) : (x - 1) * (x + 1) = x ^ 2 - 1 := by ring

theorem p2 (a b : Int) (h1 : a ≤ b) (h2 : b ≤ a + 2) : b - a ≤ 2 := by linarith

theorem p3 : (123 : Int) * 456 = 56088 := by norm_num

theorem p4 : (fun n : Nat => n * 1) = (fun n => n) := by ext n; omega

theorem p5 : ¬ ∀ n : Nat, n * n < n := by push_neg; exact ⟨0, le_refl _⟩

theorem p6 (h : P ∧ (Q ∨ R)) : (P ∧ Q) ∨ (P ∧ R) := by
  rcases h with ⟨hp, hq | hr⟩
  · left; exact ⟨hp, hq⟩
  · right; exact ⟨hp, hr⟩

theorem p7 (n : Nat) : 0 ≤ n * n := by positivity