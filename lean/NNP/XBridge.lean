module
public import R22Port.U_d41d8cd98f00
public import NNP.Item
public import NNP.Cut
public import XTP.Sound
public import XTP.R3
public import XTP.Cut
/-! # NNP.XBridge: the X tier's children are dead (discharges `nodeFn_sound`'s `hXT` and `deadR3_sound`'s `hCut`)

For any label order `O` with the X tier's mask table `npW` (`KD.NpOK O (XTP.npV npW)`; at `LO123`, `XTP.npOK_nperpTab` for
`XT.nperpTab`):
* **`xBridge`**: `XTP.checkR3_sound` (an accepted X part gives `KD.xpartC` on its views, with the native child labels) composed with
  `KD.xpartC_soundO` (bulk-peel children dead, given the child frame, the dictionary facts and the cap-2 tables' facts);
* **`cutBridge`**: the same for node cuts 5 / 6 through `XTP.checkCut_sound` (one child, the cut node). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

theorem natL_empty (n : ℕ) : natL #[] 0 n = 0 := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [natL_testBit, Nat.zero_testBit]
  have : (#[] : Array UInt64)[0 + i / 64]! = 0 := rfl
  rw [this]; simp

/-- the cap-2 table views agree -/
theorem xc2tV_eq (st : Statics) (l : ℕ) : XTP.c2tV st.c2t l = c2tV st l := by
  unfold XTP.c2tV c2tV; rw [Array.getElem!_eq_getD]; rfl

/-- every label's cap-2 table is valid (empty beyond the 511 labels) -/
theorem c2OK_all (st : Statics) (hsz : st.c2t.size = 511) (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV st l)) (l : ℕ) :
    C2OK O Ω l (XTP.c2tV st.c2t l) := by
  rw [xc2tV_eq]
  by_cases hl : l < 511
  · exact hC2 l hl
  · have h0 : c2tV st l = 0 := by unfold c2tV; rw [getD_ge _ _ _ (by omega), natL_empty]
    rw [h0]
    intro v w _ _ _ _ hb
    simp at hb

theorem cpn_consts (n : ℕ) (hn : n ≤ 511) : KD.CPn n (XTP.consts n) := by
  unfold KD.CPn XTP.consts
  dsimp only
  exact ⟨KD.REPn_eq n hn, KD.REPmn_eq n hn, KD.GRDn_eq n hn, KD.LOWSn_eq n hn, KD.DIAGn_eq n hn⟩

/-- the static facts of an X record's views -/
theorem xviews_ok (st : Statics) (hsz : st.c2t.size = 511) (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV st l))
    (mk : ℕ → ℕ) (x : XT.XRec) :
    (∀ ag ∈ XTP.aggsV st.c2t mk x, KD.C2OKO O Ω ag.1 ag.2.1) ∧ (∀ c ∈ XTP.kidsV st.c2t x, KD.KidXOKO O Ω c) := by
  refine ⟨fun ag hag => ?_, fun c hc => ?_⟩
  · unfold XTP.aggsV at hag
    obtain ⟨a, _, rfl⟩ := List.mem_map.mp hag
    exact c2OK_all st hsz hC2 a.x
  · unfold XTP.kidsV at hc
    obtain ⟨k, _, rfl⟩ := List.mem_map.mp hc
    exact ⟨c2OK_all st hsz hC2 k.u, cpn_consts _ (le_trans (Nat.sub_le 510 _) (by norm_num))⟩

/-- **the X children of an accepted X part are dead** -/
theorem xBridge (st : Statics) (hsz : st.c2t.size = 511) (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV st l)) (tab : Tab)
    (c2W : Array (Array XT.W8)) (hc2W : c2W = XT.prepC2 st.c2t) (npW : Array XT.W8) (hnp : KD.NpOK O (XTP.npV npW)) :
    ∀ (out : StepOut) (lab : ℕ) (xpn : ByteArray) (xs : Array (ℕ × ℕ × ℕ × ByteArray)) (pos : Array ℕ),
      XT.checkR3 out.fr.S out.fr.D out.fr.N out.fr.U out.fr.d lab out.b1 out.m out.e1 (mkDict tab out.ids) c2W npW xpn xs
        pos = true →
      FrameOK O Ω (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d →
      natL out.fr.S 0 8 >>> lab = 1 →
      DictSemXO O Ω (natL out.fr.S 0 8) lab (dictRowV tab out.ids) (KD.rposB out.b1 out.m out.e1) →
      (∀ p, dictRowV tab out.ids p < 2 ^ 511) →
      ∀ u ∈ (xs.map (·.1)).toList, ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL out.fr.S 0 8) lab u := by
  intro out lab xpn xs pos hchk hF hS hD hmk u hu A hΩ
  subst hc2W
  have hc := XTP.checkR3_sound out.fr.S out.fr.D out.fr.N out.fr.U out.fr.d lab out.b1 out.m out.e1
    (mkDict tab out.ids) st.c2t npW xpn xs pos hchk
  rcases hc with ⟨x, hx⟩
  have hlab := hx.2.1
  have hxp := hx.2.2
  have hrow : NN.rowV (mkDict tab out.ids) = dictRowV tab out.ids := funext (rowV_mkDict tab out.ids)
  rw [hrow] at hxp
  obtain ⟨hagg, hkids⟩ := xviews_ok st hsz hC2 (dictRowV tab out.ids) x
  have hdead := KD.xpartC_soundO hF hS hD hmk hagg hkids hnp hxp
  have hu' : u ∈ (XT.kidLabels x).toList := by rw [hlab]; simpa using hu
  rw [← XTP.kidLabels_eq st.c2t x] at hu'
  obtain ⟨c, hc, rfl⟩ := List.mem_map.mp hu'
  exact hdead c hc A hΩ

/-- **the cut node of an accepted node cut 5 / 6 is dead** -/
theorem cutBridge (st : Statics) (hsz : st.c2t.size = 511) (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV st l)) (tab : Tab)
    (c2W : Array (Array XT.W8)) (hc2W : c2W = XT.prepC2 st.c2t) (npW : Array XT.W8) (hnp : KD.NpOK O (XTP.npV npW)) :
    ∀ (fr : Frame) (u last b1 m : ℕ) (ids : Array ℕ) (nd ce : ByteArray) (pos expos : Array ℕ),
      FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d →
      XT.checkCut fr.S fr.D fr.N fr.U fr.d last b1 m m (mkDict tab ids) c2W npW u nd ce pos expos = true →
      natL fr.S 0 8 >>> last = 1 →
      DictSemXO O Ω (natL fr.S 0 8) last (dictRowV tab ids) (KD.rposB b1 m m) →
      (∀ p, dictRowV tab ids p < 2 ^ 511) →
      ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL fr.S 0 8) last u := by
  intro fr u last b1 m ids nd ce pos expos hF hchk hS hD hmk A hΩ
  subst hc2W
  have hc := XTP.checkCut_sound fr.S fr.D fr.N fr.U fr.d last b1 m m (mkDict tab ids) st.c2t npW u nd ce pos expos hchk
  rcases hc with ⟨x, hx⟩
  have hlab := hx.1
  have hxp := hx.2
  have hrow : NN.rowV (mkDict tab ids) = dictRowV tab ids := funext (rowV_mkDict tab ids)
  rw [hrow] at hxp
  obtain ⟨hagg, hkids⟩ := xviews_ok st hsz hC2 (dictRowV tab ids) x
  have hdead := KD.xpartC_soundO hF hS hD hmk hagg hkids hnp hxp
  have hu' : u ∈ (XT.kidLabels x).toList := by rw [hlab]; simp
  rw [← XTP.kidLabels_eq st.c2t x] at hu'
  obtain ⟨c, hc, hcu⟩ := List.mem_map.mp hu'
  rw [← hcu]
  exact hdead c hc A hΩ

end NNP
