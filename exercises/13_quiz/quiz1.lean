/- # Quiz 1: Library Catalog

  Build a small library catalog system! This quiz combines
  concepts from the first twelve units. There are no hints —
  you have all the tools you need.

  TODO: Complete all definitions and proofs.
-/

-- =============================================
-- Part 1: Types (Units 5, 6, 12)
-- =============================================

-- Here are the types for our catalog.

inductive Genre where
  | fiction
  | science
  | history
  | fantasy
  deriving Repr

inductive Rating where
  | stars (n : Nat)
  | unrated
  deriving Repr

structure Book where
  title  : String
  author : String
  pages  : Nat
  genre  : Genre
  rating : Rating := .unrated
  deriving Repr

-- 1. Implement BEq for Genre.
instance : BEq Genre where
  beq := sorry

-- 2. Implement ToString for Rating:
--    stars 5 => "5 stars", stars 1 => "1 star", unrated => "unrated"
instance : ToString Rating where
  toString := sorry

-- =============================================
-- Part 2: Functions (Units 2, 3, 4)
-- =============================================

-- 3. Return the genre name as a String.
def Genre.name : Genre → String := sorry

-- 4. Extract the star count from a Rating (0 if unrated).
def Rating.toNat : Rating → Nat := sorry

-- 5. Is a book "long"? (more than 300 pages)
def Book.isLong (b : Book) : Bool := sorry

-- 6. Is a book worth reading? A book is worth reading
--    if it has more than 3 stars, or is a long science book.
def Book.isWorthReading (b : Book) : Bool := sorry

-- 7. Describe a book: "<title> by <author> (<pages> pages, <genre>)"
def Book.describe (b : Book) : String := sorry

-- 8. Return a copy of the book with a new rating.
def Book.withRating (b : Book) (r : Rating) : Book := sorry

-- 9. Find a book by title. Return none if not found.
def findBook (title : String) : List Book → Option Book := sorry

-- =============================================
-- Part 3: Higher-Order & Recursive (Units 3, 7)
-- =============================================

-- 10. Keep only books of a given genre.
def booksOfGenre (g : Genre) (books : List Book) : List Book := sorry

-- 11. Extract all book titles from a catalog.
def titles (books : List Book) : List String := sorry

-- 12. Compute the total page count for a catalog.
def totalPages (books : List Book) : Nat := sorry

-- 13. Repeat a string n times: repeatStr "ab" 3 = "ababab"
def repeatStr (s : String) : Nat → String := sorry

-- =============================================
-- Part 4: Proofs (Units 8, 9, 10, 11)
-- =============================================

-- 14. A book with 0 pages is not long.
theorem zero_not_long (b : Book) (h : b.pages = 0) :
    b.isLong = false := by
  sorry

-- 15. False implies anything.
theorem false_elim {P : Prop} (h : False) : P :=
  sorry

-- 16. Disjunction is symmetric.
theorem or_swap {A B : Prop} : A ∨ B → B ∨ A := by
  sorry

-- 17. Given implications to B and C, prove their conjunction.
theorem and_of_implies {A B C : Prop} (f : A → B) (g : A → C) :
    A → B ∧ C := by
  sorry

-- For the induction proofs below:
def double : Nat → Nat
  | 0 => 0
  | n + 1 => 2 + double n

def countItems : List α → Nat
  | [] => 0
  | _ :: xs => 1 + countItems xs

-- 18. Doubling gives the same result as adding to itself.
theorem double_is_add_self (n : Nat) : double n = n + n := by
  sorry

-- 19. countItems distributes over append.
theorem countItems_append (l1 l2 : List α) :
    countItems (l1 ++ l2) = countItems l1 + countItems l2 := by
  sorry

-- =============================================
-- Don't change below this line!
-- =============================================

def catalog : List Book := [
  ⟨"Dune", "Herbert", 412, .science, .stars 5⟩,
  ⟨"1984", "Orwell", 328, .fiction, .stars 4⟩,
  { title := "Cosmos", author := "Sagan", pages := 365, genre := .science },
  ⟨"Hobbit", "Tolkien", 310, .fantasy, .stars 5⟩,
  ⟨"Sapiens", "Harari", 443, .history, .stars 3⟩
]

#guard Genre.fiction == Genre.fiction
#guard Genre.fiction != Genre.science
#guard toString (Rating.stars 5) == "5 stars"
#guard toString (Rating.stars 1) == "1 star"
#guard toString Rating.unrated == "unrated"
#guard Genre.name .fiction == "fiction"
#guard Genre.name .science == "science"
#guard Genre.name .history == "history"
#guard Genre.name .fantasy == "fantasy"
#guard (Rating.stars 5).toNat == 5
#guard Rating.unrated.toNat == 0
#guard (⟨"Big", "A", 500, .fiction, .unrated⟩ : Book).isLong == true
#guard (⟨"Small", "B", 100, .fiction, .unrated⟩ : Book).isLong == false
#guard (⟨"Edge", "C", 300, .fiction, .unrated⟩ : Book).isLong == false
#guard ({ title := "A", author := "B", pages := 500, genre := .science } : Book).isWorthReading == true
#guard (⟨"A", "B", 100, .fiction, .stars 5⟩ : Book).isWorthReading == true
#guard ({ title := "A", author := "B", pages := 100, genre := .fiction } : Book).isWorthReading == false
#guard Book.describe ⟨"Test", "Author", 100, .fiction, .unrated⟩
    == "Test by Author (100 pages, fiction)"
#guard ((⟨"X", "Y", 100, .fiction, .unrated⟩ : Book).withRating (.stars 4)).rating.toNat == 4
#guard (findBook "Cosmos" catalog).isSome == true
#guard (findBook "Moby Dick" catalog).isSome == false
#guard (findBook "Dune" catalog).map (·.pages) == some 412
#guard (booksOfGenre .science catalog).length == 2
#guard (booksOfGenre .fantasy catalog).length == 1
#guard titles catalog == ["Dune", "1984", "Cosmos", "Hobbit", "Sapiens"]
#guard totalPages [] == 0
#guard totalPages catalog == 1858
#guard repeatStr "ab" 3 == "ababab"
#guard repeatStr "x" 0 == ""
