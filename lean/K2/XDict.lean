module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import MisF.Packed
public import K2.XStep
public import K2.XNode
/-! # The node record: dictionary rows bound to a row table, and the node matrix

* `dictOK T P d`: every entry `(id, r, m)` has `m` = the label mask of `T id` (bits 0..510) and its residual claim `r` holds at
  the prefix mask `P`: `cap ≤ r` or `|P ∩ m| ≥ cap - r` (counted by lowest-bit removals), where `cap = T id >>> 511`
  (`RT.K3eDL.entry` has this layout).  **`dictOK_sound`**: with the row facts `|P' ∩ U| + |C ∩ U| ≤ cap` at the child prefix
  `P' = P ∪ {u}`, every entry meets the child's completion `C` at most `r - [u ∈ m]` times.
* `nodeAOK`: the node matrix equals `N'` with the cliques of the node rows, diagonal cleared.  **`matrix_indep`** /
  **`nodeA_sound`**: if `N'` holds only conflicts of `C` and every row meets `C` at most once, the matrix holds no pair of `C`.
-/
@[expose] public section
set_option exponentiation.threshold 1024
set_option maxRecDepth 10000
namespace K2
open MisF Finset

def M511N : ℕ := 2 ^ 511 - 1

/-- the residual claim of a table slot `e` at the prefix mask `P` -/
def resOK (P e r : ℕ) : Bool :=
  Nat.ble (Nat.shiftRight e 511) r || !(Nat.beq (remB (Nat.land P e) (Nat.sub (Nat.sub (Nat.shiftRight e 511) r) 1)) 0)
def rowOK (P e r m : ℕ) : Bool := Nat.beq (Nat.land e M511N) m && resOK P e r
/-- dictionary entries `(id, residual, mask)` against the table `T` -/
noncomputable def dictOK (T : ℕ → ℕ) (P : ℕ) (d : List (ℕ × ℕ × ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun x _ ih => rowOK P (T x.1) x.2.1 x.2.2 && ih) d

theorem card_ge_of_remB (B x d : ℕ) (hB : x < 2 ^ B) (h : remB x (d - 1) ≠ 0) : d ≤ (bitsB B x).card := by
  have h1 := card_bits_remB B x (d - 1) hB
  have h2 := card_bits_pos B _ h (remB_lt B x (d - 1) hB)
  omega

theorem dictOK_mem (T : ℕ → ℕ) (P : ℕ) (d : List (ℕ × ℕ × ℕ)) (h : dictOK T P d = true) :
    ∀ x ∈ d, rowOK P (T x.1) x.2.1 x.2.2 = true := by
  induction d with
  | nil => intro x hx; cases hx
  | cons a d ih =>
    change (rowOK P (T a.1) a.2.1 a.2.2 && dictOK T P d) = true at h
    rw [Bool.and_eq_true] at h
    intro x hx
    rcases List.mem_cons.mp hx with rfl | hx
    · exact h.1
    · exact ih h.2 x hx

/-- **Soundness of the dictionary.** `Pl`: the prefix (labels, all below 511, with mask `P`); `u ∉ Pl` the child's point;
`C` the child's completion.  Row facts at `Pl ∪ {u}` give the residual bound of every entry. -/
theorem dictOK_sound (T : ℕ → ℕ) (P u : ℕ) (d : List (ℕ × ℕ × ℕ)) (h : dictOK T P d = true)
    (Pl C : Finset ℕ) (hP : ∀ a, a ∈ Pl ↔ (a < 511 ∧ P.testBit a = true)) (hPlt : P < 2 ^ 511) (hu : u < 511) (huP : u ∉ Pl)
    (hrow : ∀ i, ((insert u Pl).filter (fun a => (T i).testBit a = true)).card +
      (C.filter (fun a => (T i).testBit a = true)).card ≤ T i >>> 511)
    (hC : ∀ a ∈ C, a < 511) :
    ∀ x ∈ d, (C.filter (fun a => x.2.2.testBit a = true)).card + (if x.2.2.testBit u then 1 else 0) ≤ x.2.1 := by
  intro x hx
  obtain ⟨id, r, m⟩ := x
  have hr := dictOK_mem T P d h _ hx
  simp only at hr ⊢
  unfold rowOK at hr
  rw [Bool.and_eq_true] at hr
  obtain ⟨hm, hres⟩ := hr
  have hm' : (T id) &&& M511N = m := Nat.eq_of_beq_eq_true hm
  have hmb : ∀ a, a < 511 → m.testBit a = (T id).testBit a := by
    intro a ha; rw [← hm']
    rw [Nat.testBit_and, show M511N = 2 ^ 511 - 1 from rfl, Nat.testBit_two_pow_sub_one]; simp [ha]
  have hfC : C.filter (fun a => m.testBit a = true) = C.filter (fun a => (T id).testBit a = true) := by
    apply Finset.filter_congr; intro a ha; rw [hmb a (hC a ha)]
  have hrw := hrow id
  have hins : ((insert u Pl).filter (fun a => (T id).testBit a = true)).card =
      (Pl.filter (fun a => (T id).testBit a = true)).card + (if m.testBit u then 1 else 0) := by
    rw [Finset.filter_insert, hmb u hu]
    split
    · rw [Finset.card_insert_of_notMem (fun h' => huP (Finset.mem_filter.mp h').1)]
    · simp
  rw [hins] at hrw
  rw [hfC]
  unfold resOK at hres
  rw [Bool.or_eq_true] at hres
  rcases hres with hle | hne
  · have h1 : Nat.shiftRight (T id) 511 ≤ r := Nat.le_of_ble_eq_true hle
    have h2 : T id >>> 511 ≤ r := h1
    omega
  · have hne' : remB (Nat.land P (T id)) (Nat.shiftRight (T id) 511 - r - 1) ≠ 0 := by
      intro h0
      have : (!(Nat.beq (remB (Nat.land P (T id)) (Nat.sub (Nat.sub (Nat.shiftRight (T id) 511) r) 1)) 0)) = true := hne
      change (!(Nat.beq (remB (Nat.land P (T id)) (Nat.shiftRight (T id) 511 - r - 1)) 0)) = true at this
      rw [h0] at this; exact absurd this (by decide)
    have hlt : P &&& T id < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_left hPlt
    have hk : Nat.shiftRight (T id) 511 - r ≤ (bitsB 511 (P &&& T id)).card :=
      card_ge_of_remB 511 (P &&& T id) (Nat.shiftRight (T id) 511 - r) hlt hne'
    have hbits : bitsB 511 (P &&& T id) = Pl.filter (fun a => (T id).testBit a = true) := by
      ext a; rw [mem_bitsB, Finset.mem_filter, hP, Nat.testBit_and, Bool.and_eq_true]; tauto
    rw [hbits] at hk
    have h3 : (T id >>> 511) = Nat.shiftRight (T id) 511 := rfl
    omega

/-! ## Matrices from residual-1 rows -/

theorem matrix_indep (S n A0 REPm REP DIAG : ℕ) (rows : List ℕ) (hS : n + 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hREPm : REPm = pk (S - 1) (fun _ => 1) n) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n)
    (hlt : ∀ m ∈ rows, m < 2 ^ n) (C : Finset ℕ) (hCn : ∀ v ∈ C, v < n)
    (hA0 : ∀ v ∈ C, ∀ w ∈ C, v ≠ w → (dig S A0 v).testBit w = false)
    (hrows : ∀ m ∈ rows, (C.filter (fun a => m.testBit a = true)).card ≤ 1) :
    ∀ v ∈ C, ∀ w ∈ C, (dig S (clrD (addCl A0 REPm REP rows) DIAG) v).testBit w = false := by
  intro w1 hw1 w2 hw2
  have h1n := hCn w1 hw1
  have h2n := hCn w2 hw2
  rw [testBit_clrD S n _ DIAG hS hDIAG w1 w2 h1n (by omega)]
  by_cases he : w1 = w2
  · simp [he]
  · simp only [he, decide_false, Bool.not_false, Bool.and_true]
    cases hX : (dig S (addCl A0 REPm REP rows) w1).testBit w2 with
    | false => rfl
    | true =>
      exfalso
      rw [testBit_dig S _ w1 w2 (by omega)] at hX
      rcases testBit_addCl_imp _ REPm REP _ rows hX with hA | ⟨m, hm, hO⟩
      · rw [← testBit_dig S _ w1 w2 (by omega), hA0 w1 hw1 w2 hw2 he] at hA; exact absurd hA (by decide)
      · rw [testBit_outer S n m REPm REP hS (hlt m hm) hREPm hREP w1 w2 h1n (by omega), Bool.and_eq_true] at hO
        have hsub : ({w1, w2} : Finset ℕ) ⊆ C.filter (fun a => m.testBit a = true) := by
          intro x hx
          simp only [Finset.mem_insert, Finset.mem_singleton] at hx
          rw [Finset.mem_filter]
          rcases hx with rfl | rfl
          · exact ⟨hw1, hO.1⟩
          · exact ⟨hw2, hO.2⟩
        have := Finset.card_le_card hsub
        rw [Finset.card_pair he] at this
        have := hrows m hm
        omega

def nodeAOK (REPm REP DIAG N' A : ℕ) (rows : List ℕ) : Bool :=
  Nat.beq (clrD (addCl N' REPm REP rows) DIAG) A

/-- **The node matrix.** Label layout (511 slots of stride 512). -/
theorem nodeA_sound (REPm REP DIAG N' A : ℕ) (rows : List ℕ) (h : nodeAOK REPm REP DIAG N' A rows = true)
    (hREP : REP = pk 512 (fun _ => 1) 511) (hREPm : REPm = pk 511 (fun _ => 1) 511) (hDIAG : DIAG = pk 512 (fun i => 2 ^ i) 511)
    (hlt : ∀ m ∈ rows, m < 2 ^ 511) (C : Finset ℕ) (hCn : ∀ v ∈ C, v < 511)
    (hN : ∀ v ∈ C, ∀ w ∈ C, v ≠ w → (dig 512 N' v).testBit w = false)
    (hrows : ∀ m ∈ rows, (C.filter (fun a => m.testBit a = true)).card ≤ 1) :
    ∀ v ∈ C, ∀ w ∈ C, v ≠ w → (dig 512 A v).testBit w = false := by
  have hA : clrD (addCl N' REPm REP rows) DIAG = A := Nat.eq_of_beq_eq_true h
  have hREPm' : REPm = pk (512 - 1) (fun _ => 1) 511 := hREPm
  have key := matrix_indep 512 511 N' REPm REP DIAG rows (by norm_num) hREP hREPm' hDIAG hlt C hCn hN hrows
  rw [hA] at key
  intro v hv w hw _
  exact key v hv w hw

end K2
