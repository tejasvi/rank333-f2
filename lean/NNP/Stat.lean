module
public import R22Port.U_9ca2afdeab08
public import NNP.Case321
public import NNP.Statics
public import XTP.W8
public import NN.Stat
/-! # NNP.Stat: the premises of the item theorems from facts about the static constants

For `S = mkIStat c2tN conf1N hN sufN vec rk3 gl`:
* `mkIStat_size`, `mkIStat_c2W`: the structural premises (`staticsOK` checked natively once);
* `mkIStat_ks`: `KStatOK O` from `vec` = the order's codes on labels and `rk3` = `3 rkOf`;
* `mkIStat_np`: `KD.NpOK O (XTP.npV S.npW)` from `vec` = the order's codes;
* `mkIStat_c1`, `mkIStat_c2`, `mkIStat_h`: the cap-1 / cap-2 / hyperplane views are the constants. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical RootSound
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

theorem mkIStat_size (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) : (mkIStat c2tN conf1N hN sufN vec rk3 gl).st.c2t.size = 511 := by
  obtain ⟨h1, _⟩ := staticsOK_spec h
  simp [mkIStat, buildStatics, h1]

theorem mkIStat_c2W (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray) :
    (mkIStat c2tN conf1N hN sufN vec rk3 gl).c2W = XT.prepC2 (mkIStat c2tN conf1N hN sufN vec rk3 gl).st.c2t := rfl

theorem mkIStat_ks (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray)
    (hvec : ∀ l, l < 511 → vec.getD l 0 = O.vec l) (hrk : ∀ X, X < 512 → (rk3.get! X).toNat = 3 * rkOf X) :
    KStatOK O (mkIStat c2tN conf1N hN sufN vec rk3 gl).ks := by
  refine ⟨hvec, fun X hX => ?_, hrk⟩
  show ((Array.range 512).map (npOf vec)).getD X #[] = npOf vec X
  rw [getD_range_map, if_pos hX]

theorem mkIStat_gl (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray) :
    (mkIStat c2tN conf1N hN sufN vec rk3 gl).ks.gl = gl := rfl

theorem mkIStat_np (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray)
    (hvec : ∀ l, l < 511 → vec.getD l 0 = O.vec l) :
    KD.NpOK O (XTP.npV (mkIStat c2tN conf1N hN sufN vec rk3 gl).npW) := by
  intro X _ hX l hl
  show ((((Array.range 512).map fun X => XT.W8.ofLimbs (npOf vec X) 0)[X]!).view).testBit l = _
  rw [Array.getElem!_eq_getD, getD_range_map, if_pos hX, XTP.W8.view_ofLimbs, npOf_bit, decide_eq_true hl, Bool.true_and,
    hvec l hl, parN_eq _ (lt_of_le_of_lt Nat.and_le_right hX)]

theorem mkIStat_c1 (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) :
    natL (mkIStat c2tN conf1N hN sufN vec rk3 gl).st.conf1 0 4096 = conf1N := by
  obtain ⟨_, _, _, _, h5, _⟩ := staticsOK_spec h
  show natL (limbsOfNat conf1N 4096) 0 4096 = conf1N
  rw [natL_limbsOfNat, Nat.mod_eq_of_lt h5]

theorem mkIStat_c2 (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) (l : ℕ) (hl : l < 511) :
    c2tV (mkIStat c2tN conf1N hN sufN vec rk3 gl).st l = c2tN.getD l 0 := c2tV_build rk3 h l hl

theorem mkIStat_h (c2tN : Array ℕ) (conf1N : ℕ) (hN sufN vec : Array ℕ) (rk3 gl : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) (l : ℕ) (hl : l < 511) :
    hV (mkIStat c2tN conf1N hN sufN vec rk3 gl).st l = hN.getD l 0 := hV_build rk3 h l hl

/-! ## The kinds tables from the packed constants -/

theorem vecOf_getD (V l : ℕ) (hl : l < 511) : (vecOf V).getD l 0 = (V >>> (9 * l)) % 512 := by
  unfold vecOf; rw [getD_range_map, if_pos hl]

theorem vecOf_123 (l : ℕ) (hl : l < 511) : (vecOf R3RT.VECL).getD l 0 = LO123.vec l := by
  rw [vecOf_getD _ _ hl]; rfl

theorem vecOf_321 (l : ℕ) (hl : l < 511) : (vecOf RT.O321.VECL).getD l 0 = Top321.O.vec l := by
  rw [vecOf_getD _ _ hl]; rfl

theorem rk3Of_get (X : ℕ) (hX : X < 512) : ((rk3Of RootCheck.RKT).get! X).toNat = 3 * rkOf X := by
  show (((Array.range 512).map fun X => (3 * ((RootCheck.RKT >>> (2 * X)) % 4)).toUInt8)[X]!).toNat = _
  rw [Array.getElem!_eq_getD, getD_range_map, if_pos hX]
  have h4 : (RootCheck.RKT >>> (2 * X)) % 4 < 4 := Nat.mod_lt _ (by norm_num)
  unfold rkOf
  rw [Nat.toUInt8_eq, UInt8.toNat_ofNat', Nat.mod_eq_of_lt (by omega)]

theorem glOf_spec (P : ℕ) (hP : P < 512) (h : (glOf C3.GLM).get! P = 1) : C3.isGL P = true := by
  have e : (glOf C3.GLM).get! P = if C3.GLM.testBit P then (1 : UInt8) else 0 := by
    show ((Array.range 512).map fun P => if C3.GLM.testBit P then (1 : UInt8) else 0)[P]! = _
    rw [Array.getElem!_eq_getD, getD_range_map, if_pos hP]
  rw [e] at h
  unfold C3.isGL
  split at h
  · assumption
  · exact absurd h (by decide)

end NNP
