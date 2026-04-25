/- # Quiz 1: Library Catalog

Build a small library catalog system! This quiz combines
concepts from the first twelve units. There are no hints —
you have all the tools you need.

TODO : Complete all definitions and proofs.
-/

-- =============================================
-- Part 1: Types (Units 5, 6, 12)
-- =============================================

-- Here are the types for our catalog.

inductive Genre where
  | science
  | history
  | fantasy
deriving Repr

inductive Rating where
  | stars (n : Nat)
  | unrated
deriving Repr

structure Book where
  title : String
  author : String
  pages : Nat
  genre : Genre
  rating : Rating := .unrated
deriving Repr

def eg : Book := {
  title := "Orlanda",
  author := "Harpman",
  pages := 200
  genre := .fantasy
  rating := .stars 5
}

-- 1. Implement BEq for Genre.
-- nb: can match with pars oof params
instance : BEq Genre where
  beq := fun
  | .science => fun | .science => true | _ => false
  | .history => fun | .history => true | _ => false
  | .fantasy => fun | .fantasy => true | _ => false

-- 2. Implement ToString for Rating:
--    stars 5 => "5 stars", stars 1 => "1 star", unrated => "unrated"
instance : ToString Rating where
  toString := fun
  | .stars n => if n == 1 then s!"1 star" else s!"{n} stars"
  | .unrated => "unrated"

-- =============================================
-- Part 2: Functions (Units 2, 3, 4)
-- =============================================

-- 3. Return the genre name as a String.
def f : Genre := .history
#eval f
def Genre.name : Genre → String := fun
| .science => "science"
| .history => "history"
| .fantasy => "fantasy"

-- 4. Extract the star count from a Rating (0 if unrated).
-- ... don't need := fun, can just begin with |
def Rating.toNat : Rating → Nat := fun
| .stars n => n
| .unrated => 0

-- 5. Is a book "long"? (more than 300 pages)
def Book.isLong (b : Book) : Bool := b.pages > 300

-- 6. Is a book worth reading? A book is worth reading
--    if it has more than 3 stars, or is a long science book.
--    TODO: test cases don't inforce the "is a long" part
def Book.isWorthReading (b : Book) : Bool :=
  (b.rating.toNat>3) || (b.genre == Genre.science)

-- 7. Describe a book: "<title> by <author> (<pages> pages, <genre>)"
def Book.describe (b : Book) : String :=
  s!"{b.title} by {b.author} ({b.pages} pages, {b.genre.name})"

-- 8. Return a copy of the book with a new rating.
def Book.withRating (b : Book) (r : Rating) : Book := {b with rating := r}

-- 9. Find a book by title. Return none if not found.
def findBook (title : String) : List Book → Option Book := fun
| [] => none
| b :: tail => if b.title == title then some b else (findBook title tail)

-- =============================================
-- Part 3: Higher-Order & Recursive (Units 3, 7)
-- =============================================

-- 10. Keep only books of a given genre.
def booksOfGenre (g : Genre) (books : List Book) : List Book := books.filter (·.genre == g)

-- 11. Extract all book titles from a catalog.
def titles (books : List Book) : List String := books.map fun b => b.title

-- 12. Compute the total page count for a catalog.
/- def totalPages (books : List Book) : Nat := books.foldl (fun (l: Nat) (r: Book) => l + r.pages) 0 -/
def totalPages (books : List Book) : Nat := books.foldl (· + ·.pages) 0

-- 13. Render a star rating as a string of stars.
--     starBar (.stars 3) = "***", starBar .unrated = ""
def starBar : Rating → String :=
  List.foldl (fun z _ => z ++ "*") "" ∘ List.range ∘ Rating.toNat
  --- missed inuction as in .stars (n+1) => "*" starBar (.stars n)
#eval starBar eg.rating

-- =============================================
-- Part 4: Proofs (Units 8, 9, 10, 11)
-- =============================================

-- 14. A book with 0 pages is not long.
theorem zero_not_long (b : Book) (h : b.pages = 0) :
    b.isLong = false := by
    unfold Book.isLong
    simp
    omega

-- 15. withRating gives back the rating it was given.
theorem withRating_rating (b : Book) (r : Rating) :
    (b.withRating r).rating = r := by
    rfl

-- 16. An unrated book has a star count of 0.
theorem unrated_zero_stars (b : Book) (h : b.rating = .unrated) :
    b.rating.toNat = 0 := by simp [Rating.toNat, h]


-- 17. Science and history are different genres.
theorem science_ne_history : Genre.science ≠ Genre.history := by
  simp
  /- intro h -/
  /- nomatch h -/


-- 18. Every genre is science, history, or fantasy.
/- TODO: cases notion not introduced before here. Either add less or consider removing -/
/- by keyword to allow solving without tactics / with an explicit function -/
theorem genre_cases (g : Genre) :
    g = .science ∨ g = .history ∨ g = .fantasy := by
  cases g with
  | science => exact Or.inl rfl
  | history => exact Or.inr (Or.inl rfl)
  | fantasy => exact Or.inr (Or.inr rfl)

-- For the induction proofs below:
def pageCount : List Book → Nat
| [] => 0
| b :: bs => b.pages + pageCount bs

def bookTitles : List Book → List String
| [] => []
| b :: bs => b.title :: bookTitles bs

-- 19. pageCount distributes over append.
theorem pageCount_append (l1 l2 : List Book) :
    pageCount (l1 ++ l2) = pageCount l1 + pageCount l2 := by
    induction l1 with
    | nil => simp
             trivial
    | cons h t tih => simp[pageCount, tih]
                      omega

    -- 20. bookTitles distributes over append.
theorem bookTitles_append (l1 l2 : List Book) :
    bookTitles (l1 ++ l2) = bookTitles l1 ++ bookTitles l2 := by
    induction l1 with
    | nil => simp[bookTitles]
    | cons h t tih => simp[bookTitles, tih]

-- =============================================
-- Don't change below this line!
-- =============================================

def catalog : List Book := [
  ⟨"Dune", "Herbert", 412, .science, .stars 5⟩,
  ⟨"Sapiens", "Harari", 443, .history, .stars 4⟩,
  { title := "Cosmos", author := "Sagan", pages := 365, genre := .science },
  ⟨"The Hobbit", "Tolkien", 310, .fantasy, .stars 5⟩,
  ⟨"SPQR", "Beard", 606, .history, .stars 3⟩
]

#guard Genre.science == Genre.science
#guard Genre.history == Genre.history
#guard Genre.fantasy == Genre.fantasy
#guard Genre.science != Genre.history
#guard Genre.fantasy != Genre.science
#guard toString (Rating.stars 5) == "5 stars"
#guard toString (Rating.stars 2) == "2 stars"
#guard toString (Rating.stars 1) == "1 star"
#guard toString Rating.unrated == "unrated"
#guard Genre.name .science == "science"
#guard Genre.name .history == "history"
#guard Genre.name .fantasy == "fantasy"
#guard (Rating.stars 5).toNat == 5
#guard (Rating.stars 0).toNat == 0
#guard Rating.unrated.toNat == 0
#guard (⟨"Big", "A", 500, .fantasy, .unrated⟩ : Book).isLong == true
#guard (⟨"Small", "B", 100, .fantasy, .unrated⟩ : Book).isLong == false
#guard (⟨"Edge", "C", 300, .fantasy, .unrated⟩ : Book).isLong == false
#guard ({ title := "A", author := "B", pages := 500, genre :=
  .science } : Book).isWorthReading == true
#guard (⟨"A", "B", 100, .fantasy, .stars 5⟩ : Book).isWorthReading == true
#guard ({ title := "A", author := "B", pages := 100, genre :=
  .fantasy } : Book).isWorthReading == false
#guard (⟨"A", "B", 500, .fantasy, .stars 2⟩ : Book).isWorthReading == false
#guard Book.describe ⟨"Test", "Author", 100, .fantasy, .unrated⟩
    == "Test by Author (100 pages, fantasy)"
#guard ((⟨"X", "Y", 100, .fantasy, .unrated⟩ : Book).withRating (.stars 4)).rating.toNat == 4
#guard (findBook "Cosmos" catalog).isSome == true
#guard (findBook "Moby Dick" catalog).isSome == false
#guard (findBook "Dune" catalog).map (·.pages) == some 412
#guard (booksOfGenre .science catalog).length == 2
#guard (booksOfGenre .fantasy catalog).length == 1
#guard titles catalog == ["Dune", "Sapiens", "Cosmos", "The Hobbit", "SPQR"]
#guard totalPages [] == 0
#guard totalPages catalog == 2136
#guard starBar (.stars 3) == "***"
#guard starBar (.stars 1) == "*"
#guard starBar (.stars 0) == ""
#guard starBar .unrated == ""
