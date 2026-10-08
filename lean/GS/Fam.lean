module
public import R22Port.U_d41d8cd98f00
public import GS.Pkd
/-! # Families: members by rank, pairwise compatibility in both orders (`G/Interface.lean`)

* `compat_symm`: `Compat d t s → Compat d s t`;
* `FamOK d t0 L`: the members `L` are valid, compatible with the anchor, pairwise compatible in both orders, with distinct
  first factors;
* `fam_take`: from `Family d (t0 :: F)` and `n ≤ count r F`, a list of `n` members of rank `r` with `FamOK`. -/
@[expose] public section
namespace GS
open G Finset

theorem compat_symm {d : ℕ} {t s : State} (h : Compat d t s) : Compat d s t :=
  ⟨fun e => h.1 e.symm, h.2.2, h.2.1⟩

instance : Inhabited State := ⟨⟨0, 0, 0, 0, 0⟩⟩

/-- members of rank `r`, all valid, compatible with the anchor and with each other -/
structure FamOK (d : ℕ) (t0 : State) (r : ℕ) (L : List State) : Prop where
  valid : ∀ s ∈ L, Valid d s
  rank : ∀ s ∈ L, rk s.a = r
  anchor : ∀ s ∈ L, Compat d t0 s
  pair : ∀ i < L.length, ∀ j < L.length, i ≠ j → Compat d (L.getD i default) (L.getD j default)

theorem pairwise_getD {α : Type} [Inhabited α] {R : α → α → Prop} {L : List α} (h : L.Pairwise R) :
    ∀ i < L.length, ∀ j < L.length, i < j → R (L.getD i default) (L.getD j default) := by
  intro i hi j hj hij
  rw [List.getD_eq_getElem _ _ hi, List.getD_eq_getElem _ _ hj]
  exact List.pairwise_iff_getElem.mp h i j hi hj hij

/-- **members by rank** -/
theorem fam_take {d : ℕ} {t0 : State} {F : List State} (h : Family d (t0 :: F)) (r n : ℕ) (hn : n ≤ count r F) :
    ∃ L : List State, L.length = n ∧ FamOK d t0 r L ∧ (∀ s ∈ L, s ∈ F) := by
  classical
  obtain ⟨hv, hp⟩ := h
  rw [List.pairwise_cons] at hp
  obtain ⟨h0, hF⟩ := hp
  let Fr := F.filter (fun s => rk s.a == r)
  have hFr : n ≤ Fr.length := hn
  let L := Fr.take n
  have hsub : L.Sublist F := (List.take_sublist n Fr).trans List.filter_sublist
  have hmem : ∀ s ∈ L, s ∈ F := fun s hs => hsub.subset hs
  have hrk : ∀ s ∈ L, rk s.a = r := by
    intro s hs
    have : s ∈ Fr := List.mem_of_mem_take hs
    simpa [Fr] using (List.mem_filter.mp this).2
  have hLp : L.Pairwise (Compat d) := hF.sublist hsub
  refine ⟨L, by simp [L, List.length_take, hFr], ⟨fun s hs => hv s (List.mem_cons_of_mem _ (hmem s hs)), hrk,
    fun s hs => h0 s (hmem s hs), ?_⟩, hmem⟩
  intro i hi j hj hij
  rcases Nat.lt_or_gt_of_ne hij with hlt | hgt
  · exact pairwise_getD hLp i hi j hj hlt
  · exact compat_symm (pairwise_getD hLp j hj i hi hgt)

theorem famOK_mem {d : ℕ} {t0 : State} {r : ℕ} {L : List State} (h : FamOK d t0 r L) {i : ℕ} (hi : i < L.length) :
    L.getD i default ∈ L := by
  rw [List.getD_eq_getElem _ _ hi]; exact List.getElem_mem hi

/-- distinct members have distinct first factors -/
theorem famOK_a_ne {d : ℕ} {t0 : State} {r : ℕ} {L : List State} (h : FamOK d t0 r L) {i j : ℕ} (hi : i < L.length)
    (hj : j < L.length) (hij : i ≠ j) : (L.getD i default).a ≠ (L.getD j default).a := (h.pair i hi j hj hij).1

end GS

#print axioms GS.fam_take
