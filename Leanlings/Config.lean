import Leanlings.Exercise

namespace Leanlings.Config

def exercises : Array Exercise := #[
  -- 00_intro
  { name := "intro1", dir := "00_intro",
    hint := "In Lean, strings are written between double quotes, like \"hello\".\nWhat string does the #guard check for?" },
  { name := "intro2", dir := "00_intro",
    hint := "Look at the type after the colon — it says `Nat` (natural number).\nWhat kind of value is \"seven\"? Change it to match the type." },
  { name := "intro3", dir := "00_intro",
    hint := "Read each error message carefully. It tells you what Lean expected\nvs. what it got. Fix each value or type to resolve the mismatch." },

  -- 01_basics
  { name := "basics1", dir := "01_basics",
    hint := "Lean supports arithmetic operators: +, -, *, /, ^.\nCan you write expressions that evaluate to the right values?\nTry `#eval 6 * 7` in your editor to check." },
  { name := "basics2", dir := "01_basics",
    hint := "Each type needs a value of that type:\n`Nat` → numbers like 0, 1, 42\n`String` → text in quotes like \"hello\"\n`Bool` → true or false\nMake sure your string isn't empty!" },
  { name := "basics3", dir := "01_basics",
    hint := "Use `++` to concatenate strings: \"Hello, \" ++ \"Lean!\".\nUse `s!\"...{variable}...\"` for string interpolation." },
  { name := "basics4", dir := "01_basics",
    hint := "Boolean operators combine Bool values.\nWhat does AND (&&) do? What does OR (||) do? What does NOT (!) do?\nThink through the truth table." },

  -- 02_definitions
  { name := "defs1", dir := "02_definitions",
    hint := "Use `#eval` in your editor to compute values.\nFor example, try `#eval 2 ^ 10` to see what it gives." },
  { name := "defs2", dir := "02_definitions",
    hint := "A function takes parameters before the return type.\nWhat expression using the parameter gives the right result?" },
  { name := "defs3", dir := "02_definitions",
    hint := "The `let` keyword creates a local name for a value.\nThe final expression in the block is what gets returned." },

  -- 03_functions
  { name := "functions1", dir := "03_functions",
    hint := "How would you multiply a number by 3? There are several ways." },
  { name := "functions2", dir := "03_functions",
    hint := "Use both parameters in the function body to compute the result." },
  { name := "functions3", dir := "03_functions",
    hint := "Anonymous functions start with `fun`, followed by parameters, then `=>`.\nFor example: `fun x => x + 1`." },
  { name := "functions4", dir := "03_functions",
    hint := "`.map` applies a function to each element.\n`.filter` keeps elements matching a predicate.\n`.foldl f init` combines elements: `foldl (· + ·) 0` sums a list.\nThe `·` shorthand represents the argument." },

  -- 04_control_flow
  { name := "if1", dir := "04_control_flow",
    hint := "`if/then/else` in Lean: `if condition then value1 else value2`.\nBoth branches must return the same type.\nWhat condition distinguishes negative from non-negative numbers?" },
  { name := "if2", dir := "04_control_flow",
    hint := "You can chain `if/then/else`.\nCheck each condition in order from most specific to most general." },
  { name := "match1", dir := "04_control_flow",
    hint := "`Option` has two constructors: `some val` and `none`.\nMatch on both cases and handle them differently." },

  -- 05_structures
  { name := "structs1", dir := "05_structures",
    hint := "Create a struct with `{ fieldName := value, ... }` syntax.\nWhat fields does the structure have?" },
  { name := "structs2", dir := "05_structures",
    hint := "Access fields with dot notation: `p.firstName`, `p.age`.\nFor `birthday`, use update syntax: `{ p with age := ... }`." },
  { name := "structs3", dir := "05_structures",
    hint := "When a field has a default value, you can omit it.\nWhat happens if you omit all fields? What about overriding just one?" },

  -- 06_inductive
  { name := "inductive1", dir := "06_inductive",
    hint := "Pattern match on each constructor.\nThe `.` prefix (like `.north`) works when Lean knows the expected type." },
  { name := "inductive2", dir := "06_inductive",
    hint := "Pattern match to extract data from constructors.\nUse `_` to ignore data you don't need." },
  { name := "inductive3", dir := "06_inductive",
    hint := "For `isNum`, check if the top-level constructor is `.num`.\nFor `sampleExpr`, build the expression tree using the constructors." },

  -- 07_recursion
  { name := "recursion1", dir := "07_recursion",
    hint := "Every recursive function on Nat needs two cases:\n• base case (0): what should it return?\n• recursive case (n+1): how does it relate to the result for n?\nLean requires structurally decreasing recursion." },
  { name := "recursion2", dir := "07_recursion",
    hint := "Recursion on List also needs two cases:\n• empty list []: what's the base value?\n• head :: tail: how do you combine the head with the recursive result?" },
  { name := "recursion3", dir := "07_recursion",
    hint := "The accumulator starts empty and builds up the result.\nFor reversing, what should you do with each head element?" },
  { name := "recursion4", dir := "07_recursion",
    hint := "Match on each constructor: `.num n`, `.add a b`, `.mul a b`.\nFor recursive constructors, call the function on each sub-expression.\nThis is structural recursion — every call is on a smaller piece." },

  -- 08_option_except
  { name := "option1", dir := "08_option_except",
    hint := "Return `none` for failure, `some x` for success.\nUse `if/then/else` for conditions, `match` for pattern matching.\nRemember: `safeLast` needs recursion on the list." },
  { name := "option2", dir := "08_option_except",
    hint := "`Except` has `.ok x` for success and `.error e` for failure.\nUse `if/then/else` to choose which to return.\n`.isOk` checks whether an Except is a success." },
  { name := "option3", dir := "08_option_except",
    hint := "`.map f` applies `f` inside an Option: `(some 5).map (· + 1) = some 6`.\n`.bind` chains: return `none` to short-circuit.\n`do` notation with `←` is sugar for `.bind`." },

  -- 09_proving_code
  { name := "proving1", dir := "09_proving_code",
    hint := "`rfl` proves that two expressions are equal when they\ncompute to the same value. Just try it!" },
  { name := "proving2", dir := "09_proving_code",
    hint := "`rfl` works when both sides compute to the same value.\nFor arithmetic with variables, try `omega`.\nCheck the Lean InfoView panel to see your current goal." },
  { name := "proving3", dir := "09_proving_code",
    hint := "`simp [f]` unfolds your function definition.\nAfter unfolding, `omega` handles the arithmetic.\nCheck InfoView after `simp [double]` to see the transformed goal." },

  -- 10_propositions
  { name := "props1", dir := "10_propositions",
    hint := "`True.intro` proves `True`. `rfl` proves `a = a`.\nBoth are simple — just provide the right proof term." },
  { name := "props2", dir := "10_propositions",
    hint := "For `A ∧ B`, provide both proofs with `⟨proof_a, proof_b⟩`.\nFor `A ∨ B`, choose one side with `Or.inl` or `Or.inr`." },
  { name := "props3", dir := "10_propositions",
    hint := "A proof of `A → B` is a function: `fun (h : A) => ...proof of B...`.\nNegation `¬A` means `A → False`.\n`absurd h hn` derives anything from `h : P` and `hn : ¬P`." },

  -- 11_infoview
  { name := "infoview1", dir := "11_infoview",
    hint := "Read the InfoView goal before choosing a tactic.\nIf both sides are the same value → `rfl`.\nIf there are variables and arithmetic → `omega`." },
  { name := "infoview2", dir := "11_infoview",
    hint := "`unfold f` replaces `f x` with its definition in the goal.\n`simp [f]` unfolds AND simplifies.\nCheck InfoView after the first step to pick the second." },
  { name := "infoview3", dir := "11_infoview",
    hint := "Hypotheses appear above ⊢ in InfoView.\n`intro h` moves an assumption from the goal into context.\n`exact h` closes the goal when `h` matches it exactly." },

  -- 12_tactics
  { name := "tactics1", dir := "12_tactics",
    hint := "`intro` moves a hypothesis from the goal into your context.\n`exact` closes the goal with a term of the right type.\nStart with `intro`, end with `exact`." },
  { name := "tactics2", dir := "12_tactics",
    hint := "`apply f` works backwards from the goal.\n`constructor` splits `A ∧ B` into two subgoals.\nUse `h.left` and `h.right` (or `h.1`, `h.2`) for conjunction parts." },
  { name := "tactics3", dir := "12_tactics",
    hint := "`rw [h]` replaces the left side of `h` with the right side in your goal.\n`rw [← h]` goes the other direction." },
  { name := "tactics4", dir := "12_tactics",
    hint := "You already know `omega` and `simp` from unit 8.\n`decide` is new — it works on concrete, finite propositions.\nTry the wrong tactic on each goal to see what happens." },

  -- 13_rewriting
  { name := "rewrite1", dir := "13_rewriting",
    hint := "`rw [Nat.add_comm]` swaps `a + b` to `b + a`.\nProvide arguments like `rw [Nat.add_comm a b]` to target a specific sum.\nChain rewrites: `rw [lemma1, lemma2]`." },
  { name := "rewrite2", dir := "13_rewriting",
    hint := "`rw [← h]` rewrites backwards (right to left).\n`rw [h]; rfl` or `rw [h]; omega` — rewrite then close.\nCheck InfoView after each rw to see the transformation." },
  { name := "rewrite3", dir := "13_rewriting",
    hint := "`unfold f` replaces `f x` with its definition body.\n`simp [f]` unfolds AND simplifies — often more convenient.\nAfter unfolding, `rfl` or `omega` can close the goal." },

  -- 14_simp
  { name := "simp1", dir := "14_simp",
    hint := "`simp` uses a database of @[simp] lemmas.\nMany standard library facts about lists and arithmetic are tagged.\nJust write `simp` and let it try everything it knows." },
  { name := "simp2", dir := "14_simp",
    hint := "`simp [f]` adds `f`'s definition to simp's knowledge.\n`simp only [lemma]` uses ONLY the lemmas you specify.\nCombine: `simp [f]; omega` for unfold + arithmetic." },
  { name := "simp3", dir := "14_simp",
    hint := "`simp?` runs simp and tells you which lemmas it used.\nReplace `simp?` with the suggested `simp only [...]` for precision.\nPick the right tool: simp for lemmas, omega for arithmetic, rw for targeted changes." },

  -- 15_decision
  { name := "decision1", dir := "15_decision",
    hint := "`omega` solves linear arithmetic: +, -, ≤, <, const × var.\nIt reads ALL hypotheses from context automatically.\nDoesn't handle variable × variable or exponents." },
  { name := "decision2", dir := "15_decision",
    hint := "`decide` evaluates concrete, finite propositions.\nWorks on booleans, strings, enums — not just numbers.\nFails with variables — use `omega` for those." },
  { name := "decision3", dir := "15_decision",
    hint := "No hints for this one! Read each goal and pick the right tactic.\nrfl, omega, decide, simp, rw — you know them all.\nTry the wrong one to see why it fails." },

  -- 16_induction
  { name := "induction1", dir := "16_induction",
    hint := "The first theorem is true by definition — try `rfl`.\nFor the second, use `induction n with`, then handle the\n`zero` and `succ` cases separately." },
  { name := "induction2", dir := "16_induction",
    hint := "Induct on the first list. In each case, try `simp [myLength]`\nand use the induction hypothesis." },

  -- 17_typeclasses
  { name := "typeclasses1", dir := "17_typeclasses",
    hint := "Implement `toString` by pattern matching on each constructor.\nReturn a descriptive string for each one." },
  { name := "typeclasses2", dir := "17_typeclasses",
    hint := "`beq` should return `true` when both values are the same\nconstructor, `false` otherwise. Use nested pattern matching." },

  -- 18_quiz
  { name := "quiz1", dir := "18_quiz",
    hint := "This quiz has no hints — read each comment carefully.\nYou have all the tools: structs, inductives, pattern matching,\nrecursion, higher-order functions, typeclasses, and tactic proofs." },

  -- 19_do_notation
  { name := "do1", dir := "19_do_notation",
    hint := "Use `←` to extract values from Option in a `do` block.\nIf any step returns `none`, the whole block returns `none`." },
  { name := "do2", dir := "19_do_notation",
    hint := "Chain the two checks with `do` notation.\nThe `←` operator short-circuits on `none`." },
  { name := "do3", dir := "19_do_notation",
    hint := "Use `let mut` for a mutable variable,\n`for x in list do` for iteration,\nand `return` for the final value." },

  -- 20_io
  { name := "io1", dir := "20_io",
    hint := "`s!\"text {variable} text\"` is string interpolation.\n`IO.println` prints a line to the console." },
  { name := "io2", dir := "20_io",
    hint := "`List.range n` gives `[0, 1, ..., n-1]`.\nUse a `for` loop to iterate over it and print." },

  -- 21_implicit
  { name := "implicit1", dir := "21_implicit",
    hint := "`p.1` is the first element of a pair, `p.2` is the second.\nUse them to build the return value." },
  { name := "implicit2", dir := "21_implicit",
    hint := "Recurse on the list. At each step, check the head\nagainst the target using `==`." },

  -- 22_arrays
  { name := "arrays1", dir := "22_arrays",
    hint := "`.map` transforms each element. `.foldl` combines elements\nleft-to-right with an accumulator. `.filter` keeps elements\nmatching a predicate." },
  { name := "arrays2", dir := "22_arrays",
    hint := "Use `Id.run do` with a `for` loop and `Array.push`\nto build the result array." },

  -- 23_namespaces
  { name := "ns1", dir := "23_namespaces",
    hint := "Define functions inside the namespace.\nUse `open MyMath in` before the definition body to access\nthem without the namespace prefix." },
  { name := "ns2", dir := "23_namespaces",
    hint := "Recurse on the list. Check each head element against the target." },

  -- 24_quiz2
  { name := "quiz2", dir := "24_quiz2",
    hint := "Combine `do` notation, mutable loops, and polymorphic functions.\nEach uses techniques from the last few modules." },

  -- 25_functor
  { name := "functor1", dir := "25_functor",
    hint := "`<$>` is Functor.map: `(· + 1) <$> [1, 2, 3]` = `[2, 3, 4]`.\nIt works on any Functor: List, Option, etc.\nApply the function to values inside the container." },
  { name := "functor2", dir := "25_functor",
    hint := "Implement `map` for each type.\nFor Box: apply `f` to the single value.\nFor Tree: recurse on both subtrees, apply `f` to the node value." },
  { name := "functor3", dir := "25_functor",
    hint := "`pure x` wraps a value: `pure 5 : Option Nat = some 5`.\n`f <*> x` applies a wrapped function to a wrapped value.\n`(· + ·) <$> a <*> b` combines two wrapped values." },

  -- 26_monad
  { name := "monad1", dir := "26_monad",
    hint := "`>>=` chains computations: `some 5 >>= fun x => pure (x + 1)`.\nRewrite do-notation as explicit `>>=` chains.\n`none >>= f` short-circuits to `none`." },
  { name := "monad2", dir := "26_monad",
    hint := "Implement `pure` and `bind` for Writer.\n`pure x` wraps with empty log.\n`bind w f` runs `f w.value` and concatenates both logs." },
  { name := "monad3", dir := "26_monad",
    hint := "Use `[Monad m]` constraint to write polymorphic code.\n`do let x ← mx; pure (f x)` works for any monad.\nFor `forM'`, recurse on the list." },

  -- 27_exists
  { name := "exists1", dir := "27_exists",
    hint := "Provide a witness and proof with `⟨witness, proof⟩`.\nFor `exists_greater`, what number is always greater than `n`?" },
  { name := "exists2", dir := "27_exists",
    hint := "Extract the witness and proof with `let ⟨w, hw⟩ := h`.\nIn tactic mode: `cases h with | intro w hw => ...`" },

  -- 28_cases_have
  { name := "cases1", dir := "28_cases_have",
    hint := "For `And`, `cases` gives you both components.\nFor `Or`, `cases` gives you two branches — one for each side." },
  { name := "have1", dir := "28_cases_have",
    hint := "`have` introduces an intermediate fact:\n`have name := proof`. Build up to the final result step by step." },
  { name := "cases2", dir := "28_cases_have",
    hint := "`cases` on a Nat gives `zero` and `succ`.\n`cases` on a Bool gives `true` and `false`.\nTry `<;>` to apply a tactic to all resulting goals." },

  -- 29_calc
  { name := "calc1", dir := "29_calc",
    hint := "Use `rw [h]` to rewrite with a hypothesis.\nFor the first theorem, the calc skeleton is given — fill in the steps.\nFor the second, write a calc chain: `calc f 5 _ = ... := by rw [h1] ...`" },
  { name := "calc2", dir := "29_calc",
    hint := "For the first theorem, fill in `exact h1` and `exact h2`.\nFor the others, write a calc chain yourself.\nUse `exact h` for inequalities and `rw [h]` for equalities." },

  -- 30_classical
  { name := "classical1", dir := "30_classical",
    hint := "`Classical.em` gives `P ∨ ¬P` for any proposition.\n`Classical.byContradiction` assumes `¬P` and derives `P` from `False`." },
  { name := "classical2", dir := "30_classical",
    hint := "For the constructive direction, use the hypothesis directly.\nFor the classical direction, use `Classical.em` to case-split." },

  -- 31_ring_linarith
  { name := "ring1", dir := "31_ring_linarith",
    hint := "`ring` proves polynomial equalities: `+`, `*`, `-`, `^`.\nJust write `ring` — it handles everything automatically.\nWorks on Int, Nat, Rat, and more." },
  { name := "ring2", dir := "31_ring_linarith",
    hint := "`linarith` proves linear arithmetic with hypotheses.\nIt reads ALL hypotheses automatically.\nFor disjunctions (∨), you need `omega` instead." },
  { name := "ring3", dir := "31_ring_linarith",
    hint := "`norm_num` evaluates concrete numeric expressions.\n`positivity` proves goals like `x^2 ≥ 0`.\n`nlinarith` is `linarith` for nonlinear goals." },

  -- 32_negation
  { name := "negation1", dir := "32_negation",
    hint := "`push_neg` pushes negation inward through ∀, ∃, ∧, ∨.\nAfter push_neg, provide a witness or use `omega`.\n`¬(a < b)` becomes `b ≤ a`." },
  { name := "negation2", dir := "32_negation",
    hint := "`contrapose` flips `P → Q` to `¬Q → ¬P`.\n`contrapose!` also applies `push_neg`.\n`by_contra h` assumes `¬(goal)` as `h`, asks for `False`." },
  { name := "negation3", dir := "32_negation",
    hint := "Choose: `push_neg` to simplify negation, `contrapose` to flip direction,\n`by_contra` to assume the negation and derive contradiction.\nThink about which makes the goal easiest." },

  -- 33_rcases_obtain
  { name := "rcases1", dir := "33_rcases_obtain",
    hint := "`rcases h with ⟨a, b⟩` splits ∧. `rcases h with a | b` splits ∨.\nNest patterns: `⟨⟨a, b⟩, c⟩` for `(P ∧ Q) ∧ R`.\nUse `_` to discard unneeded parts." },
  { name := "rcases2", dir := "33_rcases_obtain",
    hint := "`obtain ⟨a, b⟩ := h` is like `rcases` for forward reasoning.\nIt names components of `h` in one step.\nCombine with `: type` annotation to create witnesses." },
  { name := "rcases3", dir := "33_rcases_obtain",
    hint := "Nest `rcases` patterns: `⟨a, b⟩ | ⟨c, d⟩` for Or-of-And.\n`rfl` inside a pattern substitutes equalities immediately.\nDouble-nested: `⟨n, m, h⟩` for `∃ n, ∃ m, P n m`." },

  -- 34_ext
  { name := "ext1", dir := "34_ext",
    hint := "`ext x` proves function equality by introducing a variable.\nAfter ext, prove `f x = g x` with `omega`, `ring`, or `rfl`.\n`ext ⟨a, b⟩` destructures pair arguments." },
  { name := "ext2", dir := "34_ext",
    hint := "`ext` works on pairs too: splits `(a,b) = (c,d)` into two goals.\n`congr` splits `f a = f b` into `a = b`.\nUse `<;>` to apply a tactic to all goals at once." },
  { name := "ext3", dir := "34_ext",
    hint := "Combine `ext` with `ring`, `simp`, or `rfl` to close the goals.\n`ext x y` introduces two variables at once.\nFor `List.map id`, `simp` knows the lemma." },

  -- 35_conv
  { name := "conv1", dir := "35_conv",
    hint := "`conv_lhs => rw [h]` rewrites only on the left side.\n`conv_lhs => lhs; rw [h]` rewrites inside the left argument.\n`conv_rhs` targets the right side." },
  { name := "conv2", dir := "35_conv",
    hint := "`conv_lhs => ext x; rw [h]` enters a lambda body.\n`arg 1` selects the first argument of a function application.\nChain navigations to reach deeply nested subterms." },
  { name := "conv3", dir := "35_conv",
    hint := "Use `conv` when `rw` would rewrite the wrong occurrence.\n`conv_lhs => lhs; rw [h]` targets just the left-left subterm.\nIf only one occurrence exists, plain `rw` is fine." },

  -- 36_search
  { name := "search1", dir := "36_search",
    hint := "Type `exact?` and wait for the suggestion in InfoView.\nReplace `exact?` with the suggested lemma.\nThis is how you discover library lemmas." },
  { name := "search2", dir := "36_search",
    hint := "`apply?` finds lemmas to apply (may leave subgoals).\n`simp?` reports which simp lemmas were used.\n`rw?` finds rewrite lemmas." },
  { name := "search3", dir := "36_search",
    hint := "No hints! You know ring, linarith, norm_num, push_neg,\nrcases, ext, conv, positivity, decide, simp, omega, rfl.\nRead the goal and pick the right tool." },

  -- 37_nat_proofs
  { name := "nat1", dir := "37_nat_proofs",
    hint := "These are properties of addition on natural numbers.\nTry `omega`, or use named lemmas like `Nat.add_comm`." },
  { name := "nat2", dir := "37_nat_proofs",
    hint := "`omega` handles linear arithmetic inequalities.\nAlternatively, use lemmas from the `Nat` namespace." },
  { name := "nat3", dir := "37_nat_proofs",
    hint := "Use `induction` for `sumTo_formula`. The base case unfolds\ndirectly. The inductive step needs the IH and arithmetic rewriting." },

  -- 38_list_proofs
  { name := "list1", dir := "38_list_proofs",
    hint := "`simp` knows standard list lemmas. Try it first;\nif needed, add `induction`." },
  { name := "list2", dir := "38_list_proofs",
    hint := "`simp` handles `map_length`, `map_id`, and `reverse_length`.\nFor `map_id` you might need `induction`." },
  { name := "list3", dir := "38_list_proofs",
    hint := "Induct on the first list argument.\nIn each case, `simp [myAppend]` unfolds your definition." },

  -- 39_subtypes
  { name := "subtype1", dir := "39_subtypes",
    hint := "Subtypes use `⟨value, proof⟩` syntax.\nUse `by omega` for numeric proofs.\nAccess the value with `.val`." },
  { name := "subtype2", dir := "39_subtypes",
    hint := "`if h : condition` gives you a proof `h` in the then-branch.\nUse `⟨value, h⟩` to construct the subtype with that proof.\nFor NEList proofs, `by simp` works." },
  { name := "subtype3", dir := "39_subtypes",
    hint := "Extract the proof with `have := p.property`.\nThis brings it into scope for `omega`.\nFor the existential, use `⟨witness, proof⟩`." },

  -- 40_dependent_types
  { name := "dependent1", dir := "40_dependent_types",
    hint := "`Fin n` is constructed with `⟨val, proof⟩` where `val < n`.\nNumeric literals work too: `(3 : Fin 5)`.\n`Fin.elim0` handles the impossible `Fin 0` case." },
  { name := "dependent2", dir := "40_dependent_types",
    hint := "Pattern match on Vec constructors: `.nil` and `.cons x xs`.\nFor `head`, the type `Vec α (n+1)` guarantees non-emptiness.\nFor `replicate`, match on n: 0 → .nil, n+1 → .cons x (recurse)." },
  { name := "dependent3", dir := "40_dependent_types",
    hint := "For `Vec.length_eq`, induct on v.\nBase (nil): `rfl`. Step (cons): `simp [Vec.length, ih]; omega`.\nFor `map_id`, induct on v and `simp [Vec.map]`." },

  -- 41_termination
  { name := "termination1", dir := "41_termination",
    hint := "Add `termination_by n` after the function body.\nFor `myDiv`, also add `decreasing_by omega`.\nThe expression after `termination_by` must decrease on every recursive call." },
  { name := "termination2", dir := "41_termination",
    hint := "Use `if h : condition` to get a proof in scope.\n`have : fact := proof` before the recursive call.\nFor GCD: `Nat.mod_lt m (Nat.pos_of_ne_zero h)`." },
  { name := "termination3", dir := "41_termination",
    hint := "`partial def` skips termination checking entirely.\nThe fuel pattern: match on fuel (0 → none, fuel+1 → recurse).\nFor `logBase`, use `Nat.div_lt_self` with `have` before the recursive call." },

  -- 42_final_quiz
  { name := "quiz3", dir := "42_final_quiz",
    hint := "Parts 1-4: Tree functions use recursion; proofs use induction + simp.\nPart 5: Pick the right Mathlib tactic for each goal.\nPart 6: Subtypes need `⟨value, proof⟩` with `by omega`." }
]

def getExercise (name : String) : Option Exercise :=
  exercises.find? (·.name == name)

def welcomeMessage : String :=
  "Welcome to Leanlings!\n\n" ++
  "Leanlings will teach you Lean 4 through small exercises.\n\n" ++
  "Here's how it works:\n" ++
  "1. Each exercise is a Lean file with something to fix\n" ++
  "2. Open the file in your editor and follow the instructions\n" ++
  "3. Run `lake exe leanlings run` to check your solution\n" ++
  "4. Run `lake exe leanlings next` to advance\n\n" ++
  "Or use `lake exe leanlings watch` for auto-checking!\n"

def finalMessage : String :=
  "Congratulations! You've completed all Leanlings exercises!\n\n" ++
  "You now have a solid foundation in Lean 4, including:\n" ++
  "  - Basic types, definitions, and functions\n" ++
  "  - Control flow and pattern matching\n" ++
  "  - Structures and inductive types\n" ++
  "  - Recursion\n" ++
  "  - Proving properties of your code\n" ++
  "  - Propositions and proofs\n" ++
  "  - Tactic-based proving and induction\n" ++
  "  - Type classes\n" ++
  "  - Do notation and IO\n" ++
  "  - Implicit arguments, arrays, and namespaces\n" ++
  "  - Existential and classical logic\n" ++
  "  - Calculational proofs\n" ++
  "  - Proving properties of Nat and List\n\n" ++
  "Keep exploring! Check out:\n" ++
  "  - Theorem Proving in Lean 4: https://lean-lang.org/theorem_proving_in_lean4/\n" ++
  "  - Functional Programming in Lean: https://lean-lang.org/functional_programming_in_lean/\n" ++
  "  - Mathematics in Lean: https://leanprover-community.github.io/mathematics_in_lean/\n" ++
  "  - Mathlib (Lean's math library): https://leanprover-community.github.io/mathlib4_docs/\n"

end Leanlings.Config
