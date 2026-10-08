module
public import R22Port.U_d41d8cd98f00
public import GS.PhV2
public import GS.PhW
/-! # Track V, part 5: shape Q (d = 2, (18,1,3)): a rank-3 partner and one rank-2 member

* `sMask_bit`: a member compatible with the rank-3 partner `w` has its bit in `sMask p (rep32 p.m) w`;
* `shapeQ_mem`: an accepted `shapeQ` gives, for every listed partner, the member list `ss` (exactly the `sMask` bits) and
  the core certificates;
* `GS.shapeQ_of`, and `GS.shapeThm2_of : ShapeThm2` with `GS.shapeC3_of`. -/
@[expose] public section
namespace GS.V
open G G.V2 G.D2 G.A2 G.Acc Finset

/-- a member compatible with a rank-3 term `w` is in `sMask` -/
theorem sMask_bit (p : Packs) (w k : ℕ) (hk : k < p.m) (hwR : fR w = 3)
    (hY0 : fld p.Y0 k < 2 ^ 29) (hY1 : fld p.Y1 k < 2 ^ 29) (hX0 : fld p.X0 k < 2 ^ 29) (hX1 : fld p.X1 k < 2 ^ 29)
    (hA : fld p.A k < 512) (hcp : CP w (memTerm p k)) :
    (sMask p (rep32 p.m) w).testBit (32 * k) = true := by
  have hm : memTerm p k = T2 (fld p.Y0 k) (fld p.Y1 k) (fld p.X0 k) (fld p.X1 k) (fld p.A k) := by
    rw [memTerm_eq]; simp only [get32_eq]
  obtain ⟨-, hc1, hc2⟩ := CP_cross hcp
  rw [hm] at hc1 hc2
  rw [fR_T2 _ _ _ _ _ hY0 hY1 hX0 hX1, hwR] at hc1 hc2
  have eY0 := fYU_T2_0 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have eY1 := fYU_T2_1 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have eX0 := fXV_T2_0 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have eX1 := fXV_T2_1 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have hy : ∀ q, fYU w q < 2 ^ 32 := fun q => lt_trans (fYU_lt w q) (by norm_num)
  have hx : ∀ q, fXV w q < 2 ^ 32 := fun q => lt_trans (fXV_lt w q) (by norm_num)
  -- B-direction: par (X_f[k] &&& YU_w[q]) = 0
  have bx0 : ∀ q < 3, parZ (fld p.X0 k &&& fYU w q) = 0 := by
    intro q hq; have := hc1 0 (by norm_num) q hq; rw [eX0] at this; exact parZ_zero_of this
  have bx1 : ∀ q < 3, parZ (fld p.X1 k &&& fYU w q) = 0 := by
    intro q hq; have := hc1 1 (by norm_num) q hq; rw [eX1] at this; exact parZ_zero_of this
  -- C-direction: par (Y_f[k] &&& XV_w[q]) = 0
  have cy0 : ∀ q < 3, parZ (fld p.Y0 k &&& fXV w q) = 0 := by
    intro q hq; have := hc2 q hq 0 (by norm_num); rw [eY0] at this; exact parZ_zero_of' this
  have cy1 : ∀ q < 3, parZ (fld p.Y1 k &&& fXV w q) = 0 := by
    intro q hq; have := hc2 q hq 1 (by norm_num); rw [eY1] at this; exact parZ_zero_of' this
  unfold sMask
  simp only []
  rw [testBit_xor', testBit_land', testBit_lor', testBit_lor', testBit_lor', testBit_lor', testBit_lor',
    testBit_lor', testBit_lor', testBit_lor', testBit_lor', testBit_lor', testBit_lor',
    swarPar_bit_false _ _ _ _ (hy 0) (bx0 0 (by norm_num)), swarPar_bit_false _ _ _ _ (hy 0) (bx1 0 (by norm_num)),
    swarPar_bit_false _ _ _ _ (hy 1) (bx0 1 (by norm_num)), swarPar_bit_false _ _ _ _ (hy 1) (bx1 1 (by norm_num)),
    swarPar_bit_false _ _ _ _ (hy 2) (bx0 2 (by norm_num)), swarPar_bit_false _ _ _ _ (hy 2) (bx1 2 (by norm_num)),
    swarPar_bit_false _ _ _ _ (hx 0) (cy0 0 (by norm_num)), swarPar_bit_false _ _ _ _ (hx 0) (cy1 0 (by norm_num)),
    swarPar_bit_false _ _ _ _ (hx 1) (cy0 1 (by norm_num)), swarPar_bit_false _ _ _ _ (hx 1) (cy1 1 (by norm_num)),
    swarPar_bit_false _ _ _ _ (hx 2) (cy0 2 (by norm_num)), swarPar_bit_false _ _ _ _ (hx 2) (cy1 2 (by norm_num))]
  have hR : (rep32 p.m).testBit (32 * k) = true := by
    rw [testBit_rep32]; simp only [Bool.and_eq_true, decide_eq_true_eq]; omega
  rw [hR]; rfl

theorem shapeQ_mem (o : Orb2) (need : ℕ) (p : Packs) (R okb okc : ℕ) :
    ∀ qs : List (ℕ × List ℕ × List CoreCert), shapeQ o need p R okb okc qs = true →
      ∀ e ∈ qs, listChk32 e.2.1 (sMask p R (v3term o e.1)) = true ∧
        coresOK o need p (Nat.land okb (okB o.r1 (v3term o e.1))) (Nat.land okc (okC o.r1 (v3term o e.1))) e.2.1 e.2.2 = true
  | [], _, e, he => by simp at he
  | (w, ss, cs) :: rest, h, e, he => by
    have h' : (listChk32 ss (sMask p R (v3term o w)) &&
        coresOK o need p (Nat.land okb (okB o.r1 (v3term o w))) (Nat.land okc (okC o.r1 (v3term o w))) ss cs &&
        shapeQ o need p R okb okc rest) = true := h
    simp only [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp he with rfl | he2
    · exact ⟨h'.1.1, h'.1.2⟩
    · exact shapeQ_mem o need p R okb okc rest h'.2 e he2

end GS.V

namespace GS
open G G.V2 G.D2 G.A2 G.Acc GS.V

/-- **shape Q** (d = 2, (18,1,3)) -/
theorem shapeQ_of (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ) (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 true) (hV : VOK2 o nV3) :
    ShapeQ o nRec nV3 := by
  intro iv hiv iw hiw hlt hvw c j hv h1 h2
  obtain ⟨cert, hcert⟩ := hV iv hiv
  obtain ⟨p, hpb, -, -, -, hws, hwq, hQ⟩ := checkV2_elim o 17 iv _ _ _ _ (allV2_head hcert)
  obtain ⟨M, hM, hmem⟩ := phaseB_member hF hpb
  -- the partner `iw` is listed
  obtain ⟨-, hwsm⟩ := listChk32_spec _ _ hws
  obtain ⟨k0, hk0, he0⟩ := (hwsm (32 * iw)).mp (wMask_bit hF hiv hiw hlt hvw)
  have hk0e : k0 = iw := by omega
  subst hk0e
  rw [hwq] at hk0
  obtain ⟨⟨w', ss, cs⟩, hent, hw'⟩ := List.mem_map.mp hk0
  simp only at hw'
  subst hw'
  obtain ⟨hss, hcores⟩ := shapeQ_mem o 18 p (rep32 p.m) _ _ _ hQ _ hent
  -- the vertex is a member
  obtain ⟨hc1, hc2⟩ := vert_member hF _ hv h1
  obtain ⟨k, hk, hg, ht⟩ := memTerm_of_mem hM (hmem c j hv hc1 hc2)
  -- it is compatible with the partner, hence listed in `ss`
  obtain ⟨fY0, fY1, fX0, fX1, fA'⟩ := mem_fields hM k hk
  obtain ⟨b0, b1, -, x0, x1, ha⟩ := vert_bounds hF hv
  have hwR : fR (v3term o w') = 3 := ((hF.V3 rfl).2 w' hiw).2.2.2.2.2.2.2.1
  have hbit := sMask_bit p (v3term o w') k hk hwR
    (by rw [fY0]; unfold mY0; rw [hg]; exact b0) (by rw [fY1]; unfold mY1; rw [hg]; exact b1)
    (by rw [fX0]; unfold mX0; rw [hg, get32_eq]; exact x0) (by rw [fX1]; unfold mX1; rw [hg, get32_eq]; exact x1)
    (by rw [fA']; unfold mA; rw [hg]; exact ha) (by rw [ht]; exact h2)
  obtain ⟨-, hssm⟩ := listChk32_spec _ _ hss
  obtain ⟨k', hk', he'⟩ := (hssm (32 * k)).mp hbit
  have hkk : k' = k := by omega
  subst hkk
  obtain ⟨c0, hc0⟩ := coresOK_mem o 18 p _ _ ss cs hcores k' hk'
  rw [ht] at hc0
  exact refuted_chain2 o.r1 18 _ _ _ ⟨c0, hc0⟩

/-- **shapes, d = 2** -/
theorem shapeThm2_of : ShapeThm2 := fun o PY0 PY1 nB2 nRec nV3 hF hV =>
  ⟨shapeC3_of o PY0 PY1 nB2 nRec nV3 hF hV, shapeQ_of o PY0 PY1 nB2 nRec nV3 hF hV⟩

end GS

#print axioms GS.shapeQ_of
#print axioms GS.shapeThm2_of
