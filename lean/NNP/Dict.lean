module
public import R22Port.U_4e436d0714bd
public import NNP.Core
public import NN.Node
public import KD.XBatch
public import R3RT.SpecO
/-! # NNP.Dict: views of the native frames, the per-job table and the node dictionary

Stated over the spec revision 6a (`R3RT.SpecO`: a label order `O` and a universe `Ω`); revision 5 is `O = LO123`, `Ω = ΩT`.
* `rowT`, `tabV`: the per-job table as `TabOK` sees it; `rowOK_tab`: `TabOK` gives every row its cap.
* `popRowS_eq`: the native row popcount is `L5.pcnt 512 (row &&& S')`.
* `rowsOK_spec`: an accepted id list has `cap ≥ r` and popcount `cap - r` for every id.
* `dict_ok`: every dictionary row is valid with its residual class (`RowOK row (pcnt(row ∩ S') + r)`). -/
@[expose] public section
set_option maxHeartbeats 1000000
namespace NNP
open NN
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## Views -/

/-- row `i` of the per-job table (0 past the table) -/
def rowT (tab : Tab) (i : Nat) : Nat := if 8 * i + 8 ≤ tab.rows.size then natL tab.rows (8 * i) 8 else 0

/-- entry `i` of the per-job table: `mask | cap << 511 | id << 520` -/
def tabV (tab : Tab) (i : Nat) : Nat := rowT tab i + capOf tab i * 2 ^ 511 + tab.ids.getD i 0 * 2 ^ 520

/-- dictionary row `p` (0 past the dictionary) -/
def dictRowV (tab : Tab) (ids : Array Nat) (p : Nat) : Nat := if p < ids.size then rowT tab (ids.getD p 0) else 0

/-- a frame as `KD.batchX` sees it -/
def frameV (fr : Frame) : ℕ × ℕ × ℕ × ℕ × ℕ := (natL fr.S 0 8, natL fr.D 0 8, natL fr.N 0 4096, natU fr.U, fr.d)

/-- the static tables of label `l` -/
def c2tV (st : Statics) (l : Nat) : Nat := natL (st.c2t.getD l #[]) 0 4096
def hV (st : Statics) (l : Nat) : Nat := natU (st.h.getD l ByteArray.empty)
def sufV (st : Statics) (l : Nat) : Nat := natU (st.suf.getD l ByteArray.empty)

/-- a kill record as a Nat -/
def killV (kr : Array UInt64) : Nat := natL kr 0 kr.size

/-- the well-formedness facts of a per-job table (checked once per job with `TabOK`) -/
structure TabWF (tab : Tab) : Prop where
  rows : tab.rows.size = 8 * tab.caps.size
  bit511 : ∀ i, (tab.rows.getD (8 * i + 7) 0).toNat < 2 ^ 63
  caps : ∀ i, tab.caps.getD i 0 < 256
  ids : tab.ids.size = tab.caps.size
  idlt : ∀ i, tab.ids.getD i 0 < 2 ^ 32

/-! ## Table rows -/

theorem natF_tW (tab : Tab) (i : Nat) : natF (tW tab i) 8 = rowT tab i := by
  unfold rowT tW
  split
  · rename_i h; rw [natL_eq_natF]
  · exact natF_zero 8

theorem rowT_testBit (tab : Tab) (i l : Nat) :
    (rowT tab i).testBit l = (decide (l < 512) && (tW tab i (l / 64)).toNat.testBit (l % 64)) := by
  rw [← natF_tW, natF_testBit]

theorem rowT_lt (tab : Tab) (hW : TabWF tab) (i : Nat) : rowT tab i < 2 ^ 511 := by
  apply Nat.lt_pow_two_of_testBit; intro l hl
  rw [rowT_testBit]
  by_cases hl2 : l < 512
  · rw [decide_eq_true hl2, Bool.true_and]
    have hl3 : l = 511 := by omega
    subst hl3
    unfold tW; split
    · have h := hW.bit511 i
      rw [show 511 / 64 = 7 by norm_num, show 511 % 64 = 63 by norm_num]
      exact Nat.testBit_lt_two_pow h
    · simp
  · rw [decide_eq_false hl2, Bool.false_and]

theorem pow520 (x : Nat) : x * 2 ^ 520 = 2 ^ 511 * (x * 2 ^ 9) := by
  rw [show (520 : ℕ) = 511 + 9 by norm_num, pow_add]; ring

theorem tabV_row (tab : Tab) (hW : TabWF tab) (i : Nat) : tabV tab i % 2 ^ 511 = rowT tab i := by
  unfold tabV
  rw [show capOf tab i * 2 ^ 511 = 2 ^ 511 * capOf tab i by ring, pow520, Nat.add_assoc, ← Nat.mul_add,
    Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (rowT_lt tab hW i)]

theorem tabV_cap (tab : Tab) (hW : TabWF tab) (i : Nat) : (tabV tab i >>> 511) % 512 = capOf tab i := by
  unfold tabV
  rw [Nat.shiftRight_eq_div_pow, show capOf tab i * 2 ^ 511 = 2 ^ 511 * capOf tab i by ring, pow520,
    Nat.add_assoc, ← Nat.mul_add,
    Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt (rowT_lt tab hW i), Nat.zero_add,
    show tab.ids.getD i 0 * 2 ^ 9 = 512 * tab.ids.getD i 0 by ring, Nat.add_mul_mod_self_left]
  exact Nat.mod_eq_of_lt (lt_of_lt_of_le (hW.caps i) (by norm_num))

/-- **the table's rows are valid with their caps** -/
theorem rowOK_tab (tab : Tab) (hT : R3RT.SpecO.TabOK O Ω (tabV tab)) (hW : TabWF tab) (i : Nat) :
    R3RT.SpecO.RowOK O Ω (rowT tab i) (capOf tab i) := by
  have h := (hT i).2
  rwa [tabV_row tab hW, tabV_cap tab hW] at h

/-! ## Row popcounts -/

theorem popRowS_eq (tab : Tab) (S' : Array UInt64) (i : Nat) :
    popRowS tab S' i = L5.pcnt 512 (rowT tab i &&& natL S' 0 8) := by
  unfold popRowS
  have e : ∀ k, (let s := S'.getD k 0; if s == 0 then 0 else pop64 (tW tab i k &&& s)) = pop64 (tW tab i k &&& S'.getD k 0) := by
    intro k
    simp only []
    split
    · rename_i h; simp only [beq_iff_eq] at h; rw [h]; simp [pop64]
    · rfl
  simp only [e]
  rw [sumN_eq, sum_pop_eq]
  congr 1
  apply Nat.eq_of_testBit_eq; intro l
  rw [natF_testBit, Nat.testBit_and, rowT_testBit, natL_testBit, tb_and, Array.getElem!_eq_getD, Nat.zero_add]
  by_cases hl : l < 512
  · simp [hl]; rfl
  · simp [hl]

theorem rowsOK_spec (tab : Tab) (S' : Array UInt64) (r : Nat) (ids : Array Nat) (h : rowsOK tab S' r ids = true) :
    ∀ j < ids.size, r ≤ capOf tab (ids.getD j 0) ∧
      L5.pcnt 512 (rowT tab (ids.getD j 0) &&& natL S' 0 8) + r = capOf tab (ids.getD j 0) := by
  intro j hj
  unfold rowsOK at h
  have := (allN_iff _ _).mp h j hj
  simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at this
  obtain ⟨h1, h2⟩ := this
  rw [popRowS_eq] at h2
  exact ⟨h1, by omega⟩

/-! ## The dictionary -/

theorem getD_append {α : Type} (a b : Array α) (i : Nat) (d : α) :
    (a ++ b).getD i d = if i < a.size then a.getD i d else b.getD (i - a.size) d := by
  by_cases h : i < a.size
  · rw [if_pos h, getD_lt _ _ _ (by simp; omega), getD_lt _ _ _ h, Array.getElem_append_left h]
  · rw [if_neg h]
    by_cases h2 : i < (a ++ b).size
    · rw [getD_lt _ _ _ h2, getD_lt _ _ _ (by simp at h2; omega), Array.getElem_append_right (by omega)]
    · rw [getD_ge _ _ _ (by omega), getD_ge _ _ _ (by simp at h2; omega)]

theorem getD_reverse {α : Type} (a : Array α) (i : Nat) (d : α) :
    a.reverse.getD i d = if i < a.size then a.getD (a.size - 1 - i) d else d := by
  by_cases h : i < a.size
  · rw [if_pos h, getD_lt _ _ _ (by simpa using h), getD_lt _ _ _ (by omega), Array.getElem_reverse]
  · rw [if_neg h, getD_ge _ _ _ (by simp; omega)]

/-- the residual class of dictionary position `p` (V 0, R1 1, R2 2, X1 1, X2 2) -/
def resid (nV n1 n2 nx1 p : Nat) : Nat :=
  if p < nV then 0 else if p < nV + n1 then 1 else if p < nV + n1 + n2 then 2 else if p < nV + n1 + n2 + nx1 then 1 else 2

theorem resid_le_rposB (nV n1 n2 nx1 p : Nat) :
    resid nV n1 n2 nx1 p ≤ KD.rposB (nV + n1) (nV + n1 + n2) (nV + n1 + n2 + nx1) p := by
  unfold resid KD.rposB; split_ifs <;> omega

/-- the dictionary position `p` cites an id of the list of its class, at a valid index -/
theorem dictIds_getD (nd : NodeRec) (p : Nat) :
    (dictIds nd).getD p 0 =
      if p < nd.r0.size then nd.r0.getD (nd.r0.size - 1 - p) 0
      else if p < nd.r0.size + nd.r1.size then nd.r1.getD (nd.r1.size - 1 - (p - nd.r0.size)) 0
      else if p < nd.r0.size + nd.r1.size + nd.r2.size then
        nd.r2.getD (nd.r2.size - 1 - (p - (nd.r0.size + nd.r1.size))) 0
      else if p < nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size then
        nd.x1.getD (nd.x1.size - 1 - (p - (nd.r0.size + nd.r1.size + nd.r2.size))) 0
      else if p < nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size + nd.x2.size then
        nd.x2.getD (nd.x2.size - 1 - (p - (nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size))) 0
      else 0 := by
  unfold dictIds
  simp only [getD_append, getD_reverse, Array.size_append, Array.size_reverse]
  split_ifs <;> first | rfl | (exfalso; omega)

theorem dictIds_size (nd : NodeRec) :
    (dictIds nd).size = nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size + nd.x2.size := by
  unfold dictIds; simp only [Array.size_append, Array.size_reverse]

/-- **every dictionary row is valid with its residual class** -/
theorem dict_ok (tab : Tab) (hT : R3RT.SpecO.TabOK O Ω (tabV tab)) (hW : TabWF tab) (nd : NodeRec) (S' : Array UInt64)
    (h0 : rowsOK tab S' 0 nd.r0 = true) (h1 : rowsOK tab S' 1 nd.r1 = true) (h2 : rowsOK tab S' 2 nd.r2 = true)
    (hx1 : rowsOK tab S' 1 nd.x1 = true) (hx2 : rowsOK tab S' 2 nd.x2 = true) :
    ∀ p, R3RT.SpecO.RowOK O Ω (dictRowV tab (dictIds nd) p)
      (L5.pcnt 512 (dictRowV tab (dictIds nd) p &&& natL S' 0 8) +
        resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p) := by
  intro p
  unfold dictRowV
  rw [dictIds_size]
  split
  · rename_i hp
    have key : ∀ (L : Array Nat) (r j : Nat), rowsOK tab S' r L = true → j < L.size →
        resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p = r → (dictIds nd).getD p 0 = L.getD j 0 →
        R3RT.SpecO.RowOK O Ω (rowT tab ((dictIds nd).getD p 0))
          (L5.pcnt 512 (rowT tab ((dictIds nd).getD p 0) &&& natL S' 0 8) + resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p) := by
      intro L r j hL hj hr he
      obtain ⟨_, hc⟩ := rowsOK_spec tab S' r L hL j hj
      rw [hr, he, hc]
      exact rowOK_tab tab hT hW _
    have hr0 := dictIds_getD nd p
    by_cases c1 : p < nd.r0.size
    · rw [if_pos c1] at hr0
      exact key nd.r0 0 _ h0 (by omega) (by unfold resid; rw [if_pos c1]) hr0
    rw [if_neg c1] at hr0
    by_cases c2 : p < nd.r0.size + nd.r1.size
    · rw [if_pos c2] at hr0
      exact key nd.r1 1 _ h1 (by omega) (by unfold resid; rw [if_neg c1, if_pos c2]) hr0
    rw [if_neg c2] at hr0
    by_cases c3 : p < nd.r0.size + nd.r1.size + nd.r2.size
    · rw [if_pos c3] at hr0
      exact key nd.r2 2 _ h2 (by omega) (by unfold resid; rw [if_neg c1, if_neg c2, if_pos c3]) hr0
    rw [if_neg c3] at hr0
    by_cases c4 : p < nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size
    · rw [if_pos c4] at hr0
      exact key nd.x1 1 _ hx1 (by omega) (by unfold resid; rw [if_neg c1, if_neg c2, if_neg c3, if_pos c4]) hr0
    rw [if_neg c4, if_pos hp] at hr0
    exact key nd.x2 2 _ hx2 (by omega) (by unfold resid; rw [if_neg c1, if_neg c2, if_neg c3, if_neg c4]) hr0
  · intro A _; simp [R3RT.SpecO.inMask]

theorem dictRowV_lt (tab : Tab) (hW : TabWF tab) (ids : Array Nat) (p : Nat) : dictRowV tab ids p < 2 ^ 511 := by
  unfold dictRowV; split
  · exact rowT_lt tab hW _
  · positivity

/-- the X tier's limb dictionary has the dictionary rows as its rows -/
theorem rowV_mkDict (tab : Tab) (ids : Array Nat) (p : Nat) : rowV (mkDict tab ids) p = dictRowV tab ids p := by
  have hs : (mkDict tab ids).size = 8 * ids.size := by unfold mkDict; exact size_range_map _ _
  have hg : ∀ j, (mkDict tab ids).getD j 0 = if j < 8 * ids.size then tW tab (ids.getD (j / 8) 0) (j % 8) else 0 :=
    fun j => getD_range_map _ _ j 0
  unfold rowV dictRowV
  rw [hs]
  by_cases hp : p < ids.size
  · rw [if_pos (by omega), if_pos hp, ← natF_tW, natL_eq_natF]
    apply natF_congr; intro k hk
    rw [hg, if_pos (by omega), show (8 * p + k) / 8 = p by omega, show (8 * p + k) % 8 = k by omega]
  · rw [if_neg (by omega), if_neg hp]

end NNP
