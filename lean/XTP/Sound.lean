module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import KD.XComp
public import NNP.Core
public import XTP.W8
public import XTP.Loops
public import XTP.Views
public import XTP.Node
public import XTP.Agg
public import XTP.NodeB
public import XTP.KStep
public import XTP.Kid
public import XTP.KidB
/-! # XTP.Sound: the refinement theorem of the native X tier

**`XTP.check_sound`**: if `XT.check` accepts a decoded X part (layouts 0 and 2), then `KD.xpartC` holds on its views, with the
frame `(natL S' 0 8, natL D' 0 8, natL N' 0 4096, natU U')` and the dictionary `NN.rowV dict`.  `KD.xpartC_sound` (and so
`KD.batchX_sound`) then applies unchanged. -/
@[expose] public section
namespace XTP
open XT MisF

set_option exponentiation.threshold 1024

theorem aggAt_eq : ∀ (L : List KD.Agg) (k : ℕ), k < L.length → KD.aggAt L k = L[k]!
  | [], k, h => by simp at h
  | a :: L, 0, _ => rfl
  | a :: L, k + 1, h => by
    show KD.aggAt L k = (a :: L)[k + 1]!
    rw [aggAt_eq L k (by simp at h; omega)]
    simp [getElem!_pos L k (by simp at h; omega), getElem!_pos (a :: L) (k + 1) (by simp at h ⊢; omega)]

theorem prep_spec (D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (x : XRec) (nc : NodeC) (h : prep D N U du last b1 m e1 dict c2W npW x = some nc) :
    c2W.size ≤ 511 ∧ countersOK U = true ∧ nrowsOK b1 m e1 (dictWOf dict) x.nrows = true ∧
      aggsOK x c2W (dictWOf dict) = true ∧ dtN npW U du x = true ∧
      nc = { dictW := dictWOf dict, b1, m, e1, D := W8.ofLimbs D 0, Hm := x.HP, DEF := x.DEF, J := x.XL.size,
             An := anOf N last (x.nrows.map (rowOf (dictWOf dict))), aggs := x.aggs.map (aggCOf (dictWOf dict)), c2W, last,
             T := 21 - du } := by
  unfold prep at h
  simp only at h
  split at h
  · rename_i hc
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
    obtain ⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩ := hc
    simp only [Option.some.injEq] at h
    exact ⟨h1, h2, h3, h4, h5, h.symm⟩
  · cases h

/-- the node relation of an accepted node -/
theorem nrel_of (c2t : Array (Array UInt64)) (dict D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (x : XRec)
    (npW : Array W8) (hlay : x.lay ≠ 1) (hs : c2t.size ≤ 511) (haggs : aggsOK x (prepC2 c2t) (dictWOf dict) = true)
    (hdt : dtN npW U du x = true) :
    NRel { dictW := dictWOf dict, b1, m, e1, D := W8.ofLimbs D 0, Hm := x.HP, DEF := x.DEF, J := x.XL.size,
           An := anOf N last (x.nrows.map (rowOf (dictWOf dict))), aggs := x.aggs.map (aggCOf (dictWOf dict)),
           c2W := prepC2 c2t, last, T := 21 - du }
      (HPV x) (DEFPV x) (JV x) (aggsV c2t (NN.rowV dict) x) (21 - du) := by
  have hdt' := hdt
  unfold dtN at hdt'
  simp only [Bool.and_eq_true, decide_eq_true_eq, Array.all_eq_true, List.all_eq_true, Bool.not_eq_true'] at hdt'
  obtain ⟨⟨⟨⟨hHP, hDEF⟩, hd⟩, hb⟩, hent⟩ := hdt'
  have hd' : ∀ i : ℕ, x.DEF[i]! < 256 := by
    intro i
    by_cases hi : i < x.DEF.size
    · have := hd i hi; rw [getElem!_pos x.DEF i hi]; simpa using this
    · rw [Array.getElem!_eq_getD, Array.getD, dif_neg hi]; simp
  have hlen : (aggsV c2t (NN.rowV dict) x).length = x.aggs.size := by simp [aggsV]
  have hgetA : ∀ k (hk : k < x.aggs.size), KD.aggAt (aggsV c2t (NN.rowV dict) x) k =
      (x.aggs[k].x, c2tV c2t x.aggs[k].x, aggBV c2t (NN.rowV dict) x.lay x.aggs[k], x.aggs[k].ps.toList) := by
    intro k hk
    rw [aggAt_eq _ k (by rw [hlen]; exact hk), getElem!_pos _ k (by rw [hlen]; exact hk)]
    simp [aggsV]
  have hncA : ∀ k (hk : k < x.aggs.size), (x.aggs.map (aggCOf (dictWOf dict)))[k]! = aggCOf (dictWOf dict) x.aggs[k] := by
    intro k hk; rw [getElem!_pos _ k (by simp; exact hk)]; simp
  refine ⟨rfl, ?_, ?_, ?_, ?_, ?_, ?_, rfl⟩
  · -- the deficit-table slots
    intro j hj
    exact hslot_HPV x j hj (hp511 x hb j)
  · intro j hj; exact byteAt_DEFPV x hd' j hj
  · intro k hk
    simp only [Array.size_map] at hk
    rw [hgetA k hk, hncA k hk]; rfl
  · intro k hk l j hl hj
    simp only [Array.size_map] at hk
    obtain ⟨hrows, hBeq⟩ := agg_facts c2t hs dict x hlay haggs k hk
    rw [hgetA k hk, hncA k hk]
    simp only
    rw [hBeq, ← brow_bit c2t hs dict x.aggs[k] hrows l j hl hj]
  · intro k hk
    simp only [Array.size_map] at hk
    obtain ⟨hrows, hBeq⟩ := agg_facts c2t hs dict x hlay haggs k hk
    rw [hgetA k hk]
    simp only
    rw [hBeq]
    exact bxF_lt _ _ _ (c2tV_lt c2t _) (fun mm hmm => by obtain ⟨p, hp, rfl⟩ := KD.mem_mapL hmm; exact (hrows p hp).1)
  · intro k hk mm hmm
    simp only [Array.size_map] at hk
    rw [hncA k hk] at hmm ⊢
    unfold aggCOf at hmm ⊢
    simp only [Array.toList_map, List.mem_map] at hmm
    obtain ⟨p, _, rfl⟩ := hmm
    rw [W8.testBit_clrBit]; simp

/-- the children: `XT.kidsLoop` gives every child's `KD.kidX` -/
theorem kidsLoop_sound (c2t : Array (Array UInt64)) (dict D N : Array UInt64) (du last b1 m e1 : ℕ) (x : XRec) (nc : NodeC)
    (hdictW : nc.dictW = dictWOf dict) (hD : nc.D = W8.ofLimbs D 0)
    (hAn : nc.An = anOf N last (x.nrows.map (rowOf (dictWOf dict)))) (hc2W : nc.c2W = prepC2 c2t) (hlast : nc.last = last)
    (hb1 : nc.b1 = b1) (hm : nc.m = m) (he1 : nc.e1 = e1)
    (hnr : ∀ p ∈ x.nrows.toList, (NN.rowV dict p).testBit 511 = false)
    (rel : NRel nc (HPV x) (DEFPV x) (JV x) (aggsV c2t (NN.rowV dict) x) (21 - du)) :
    ∀ (k i : ℕ) (rows : Array W8), x.kids.size - i = k → rows.size = 512 → kidsLoop nc x i rows = true →
      ∀ j (hj : j < x.kids.size), i ≤ j →
        KD.kidX (NN.natL D 0 8) last b1 m e1 (KD.anodeX (NN.natL N 0 4096) (NN.rowV dict) x.nrows.toList) (HPV x)
          (DEFPV x) (JV x) (Nat.sub 21 du) (NN.rowV dict) (aggsV c2t (NN.rowV dict) x) (kidV c2t x.kids[j]) = true := by
  intro k
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    intro i rows hk hsz h j hj hij
    rw [kidsLoop] at h
    have hi : i < x.kids.size := by omega
    rw [dif_pos hi] at h
    split at h
    · rename_i kc rows1 hset
      rw [Bool.and_eq_true] at h
      have hsz1 : rows1.size = 512 := by
        obtain ⟨_, _, _, _, hkc, hrows1⟩ := kidSetup_spec nc x.kids[i] rows kc rows1 hset
        rw [hrows1, scatRows_size, setBaseWs_size nc kc _ _ 0 rows rfl, hsz]
      rcases Nat.eq_or_lt_of_le hij with rfl | hlt
      · exact kidX_of c2t dict D N last b1 m e1 du x nc hdictW hD hAn hc2W hlast hb1 hm he1 hnr rel x.kids[i] rows hsz kc
          rows1 hset h.1
      · exact ih (x.kids.size - (i + 1)) (by omega) (i + 1) rows1 rfl hsz1 h.2 j hj hlt
    · cases h

/-- **the refinement theorem**: an X part the native checker accepts satisfies `KD.xpartC` on its views (layouts 0 and 2) -/
theorem check_sound (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : ℕ) (dict : Array UInt64)
    (c2t : Array (Array UInt64)) (npW : Array W8) (x : XRec) (hlay : x.lay ≠ 1)
    (h : XT.check S D N U du last b1 m e1 dict (prepC2 c2t) npW x = true) :
    KD.xpartC (npV npW) (NN.natL S 0 8) (NN.natL D 0 8) (NN.natL N 0 4096) (NN.natU U) du last b1 m e1 (NN.rowV dict)
      (nrowsV x) (aggsV c2t (NN.rowV dict) x) (XLV x) (HPV x) (DEFPV x) (JV x) (kidsV c2t x) = true := by
  unfold XT.check at h
  split at h
  · rename_i nc hprep
    obtain ⟨hs, hU, hnr, haggs, hdt, rfl⟩ := prep_spec D N U du last b1 m e1 dict (prepC2 c2t) npW x _ hprep
    rw [size_prepC2] at hs
    have hnr' : ∀ p ∈ x.nrows.toList, (NN.rowV dict p).testBit 511 = false := by
      unfold nrowsOK at hnr
      rw [Array.all_eq_true] at hnr
      intro p hp
      obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hp
      have := hnr i (by simpa using hi)
      simp only [Bool.and_eq_true, Bool.not_eq_true'] at this
      rw [W8.testBit_eq, rowOf_view] at this
      simpa using this.2
    have rel := nrel_of c2t dict D N U du last b1 m e1 x npW hlay hs haggs hdt
    unfold KD.xpartC
    simp only [Bool.and_eq_true]
    refine ⟨⟨⟨nrOK_of b1 m e1 _ x.nrows hnr, aggsX_of c2t hs dict x hlay haggs⟩, dtOK_of npW U du x hU hdt⟩, ?_⟩
    unfold KD.kidsX kidsV
    apply listRec_and_of
    intro c hc
    rw [List.mem_map] at hc
    obtain ⟨kd, hkd, rfl⟩ := hc
    obtain ⟨j, hj, rfl⟩ := List.getElem_of_mem hkd
    simp only [Array.getElem_toList]
    exact kidsLoop_sound c2t dict D N du last b1 m e1 x _ rfl rfl rfl rfl rfl rfl rfl rfl hnr' rel _ 0 _ rfl
      (by simp) h j (by simpa using hj) (Nat.zero_le _)
  · cases h

/-- the children's labels (for the node agent's coverage) -/
theorem kidLabels_eq (c2t : Array (Array UInt64)) (x : XRec) : (kidsV c2t x).map (·.1) = (kidLabels x).toList := by
  unfold kidsV kidLabels
  simp [kidV]

end XTP
