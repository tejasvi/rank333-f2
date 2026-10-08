module
public import R22Port.U_74e108bfcdcb
public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Fintype.Card
public import Mathlib.Data.Set.Finite.Basic
public import Mathlib.Order.WellFounded
/-! # Orderly generation: the lex order of key-sorted sets, canonical sets, prefixes

Points are natural numbers ordered by an injective `key` (for prof7: the label order of `--rord 123`, `C3.Act.labK`).
A set is compared with another by sorting both by key: `LexLt A B` holds when some `m ∈ A \ B` has every element of `B`
with a smaller key in `A`.  For sets of equal size this is exactly "the first difference of the sorted sequences is smaller in
`A`", i.e. prof7's `fullCheck(g, l) < 0` with `A = g(T)`, `B = T`.

* `lexLt_of_prefix`: if a map `g` makes a key-prefix `T = S ∩ {key < c}` smaller, it makes `S` smaller.  No hypothesis on `g`:
  the image of `T` has at most `|T|` elements, so the decisive element `m` has a key below `c`.
* `canon_prefix`: a key-prefix of a canonical set is canonical (for any set of maps `G`).
* `exists_canon`: if `G` is finite, nonempty and closed under composition on a domain `D ⊇ S`, some `g(S)` is canonical. -/
@[expose] public section
namespace C3

variable (key : ℕ → ℕ)

/-- `A` precedes `B` in the lex order of `key`-sorted sets. -/
def LexLt (A B : Finset ℕ) : Prop := ∃ m ∈ A, m ∉ B ∧ ∀ x ∈ B, key x < key m → x ∈ A

/-- `S` is canonical for the maps `G`: no `g ∈ G` makes it lex-smaller. -/
def Canon (G : Set (ℕ → ℕ)) (S : Finset ℕ) : Prop := ∀ g ∈ G, ¬ LexLt key (S.image g) S

theorem lexLt_irrefl (A : Finset ℕ) : ¬ LexLt key A A := fun ⟨_, hm, hm', _⟩ => hm' hm

theorem lexLt_trans (hk : Function.Injective key) {A B C : Finset ℕ} (h1 : LexLt key A B) (h2 : LexLt key B C) :
    LexLt key A C := by
  obtain ⟨m1, h1A, h1B, h1⟩ := h1
  obtain ⟨m2, h2B, h2C, h2⟩ := h2
  rcases lt_trichotomy (key m1) (key m2) with h | h | h
  · exact ⟨m1, h1A, fun hC => h1B (h2 m1 hC h), fun x hx hlt => h1 x (h2 x hx (lt_trans hlt h)) hlt⟩
  · exact absurd (hk h ▸ h2B) h1B
  · exact ⟨m2, h1 m2 h2B h, h2C, fun x hx hlt => h1 x (h2 x hx hlt) (lt_trans hlt h)⟩

/-- **Prefix lemma.** A map that makes the key-prefix `S ∩ {key < c}` lex-smaller makes `S` lex-smaller. -/
theorem lexLt_of_prefix (g : ℕ → ℕ) (S : Finset ℕ) (c : ℕ)
    (h : LexLt key ((S.filter (fun x => key x < c)).image g) (S.filter (fun x => key x < c))) :
    LexLt key (S.image g) S := by
  obtain ⟨m, hmI, hmT, hlow⟩ := h
  have hmc : key m < c := by
    by_contra hc'
    have hc : c ≤ key m := not_lt.mp hc'
    have hsub : insert m (S.filter (fun x => key x < c)) ⊆ (S.filter (fun x => key x < c)).image g := by
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hmI
      · exact hlow x hx (lt_of_lt_of_le (Finset.mem_filter.mp hx).2 hc)
    have h1 := Finset.card_le_card hsub
    rw [Finset.card_insert_of_notMem hmT] at h1
    have h2 := Finset.card_image_le (s := S.filter (fun x => key x < c)) (f := g)
    omega
  have hsub : (S.filter (fun x => key x < c)).image g ⊆ S.image g :=
    Finset.image_subset_image (Finset.filter_subset _ _)
  refine ⟨m, hsub hmI, fun hmS => hmT (Finset.mem_filter.mpr ⟨hmS, hmc⟩), fun x hx hlt => ?_⟩
  exact hsub (hlow x (Finset.mem_filter.mpr ⟨hx, lt_trans hlt hmc⟩) hlt)

/-- **Prefixes of canonical sets are canonical.** -/
theorem canon_prefix {G : Set (ℕ → ℕ)} {S : Finset ℕ} (hS : Canon key G S) (c : ℕ) :
    Canon key G (S.filter (fun x => key x < c)) :=
  fun g hg h => hS g hg (lexLt_of_prefix key g S c h)

/-- **Witness form.** If some `g ∈ G` makes `T` lex-smaller, no canonical set has `T` as a key-prefix. -/
theorem not_canon_of_prefix {G : Set (ℕ → ℕ)} {T : Finset ℕ} {g : ℕ → ℕ} (hg : g ∈ G) (hw : LexLt key (T.image g) T)
    (S : Finset ℕ) (hS : Canon key G S) (c : ℕ) (hT : S.filter (fun x => key x < c) = T) : False := by
  have := canon_prefix key hS c g hg
  rw [hT] at this
  exact this hw

/-- **Canonical representatives exist.** -/
theorem exists_canon (hk : Function.Injective key) (G : Set (ℕ → ℕ)) (D : Set ℕ) (hfin : G.Finite)
    (hne : G.Nonempty) (hcomp : ∀ g ∈ G, ∀ h ∈ G, ∃ k ∈ G, ∀ x ∈ D, h (g x) = k x)
    (S : Finset ℕ) (hS : ∀ x ∈ S, x ∈ D) : ∃ g ∈ G, Canon key G (S.image g) := by
  let O : Set (Finset ℕ) := (fun g => S.image g) '' G
  have hOfin : O.Finite := hfin.image _
  haveI : Finite O := hOfin.to_subtype
  let r : O → O → Prop := fun a b => LexLt key a.1 b.1
  haveI : IsTrans O r := ⟨fun _ _ _ h1 h2 => lexLt_trans key hk h1 h2⟩
  haveI : Std.Irrefl r := ⟨fun a h => lexLt_irrefl key a.1 h⟩
  have hwf : WellFounded r := Finite.wellFounded_of_trans_of_irrefl r
  obtain ⟨g0, hg0⟩ := hne
  obtain ⟨⟨T, hT⟩, -, hmin⟩ := hwf.has_min Set.univ ⟨⟨S.image g0, g0, hg0, rfl⟩, trivial⟩
  obtain ⟨g, hg, rfl⟩ := hT
  refine ⟨g, hg, fun h hh hlt => ?_⟩
  obtain ⟨k, hk', hkx⟩ := hcomp g hg h hh
  have e : (S.image g).image h = S.image k := by
    rw [Finset.image_image]
    apply Finset.image_congr
    intro x hx
    exact hkx x (hS x hx)
  have hlt' : LexLt key (S.image k) (S.image g) := by rw [← e]; exact hlt
  exact hmin ⟨S.image k, k, hk', rfl⟩ trivial hlt'

end C3
