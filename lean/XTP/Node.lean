module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import KD.XComp
public import NNP.Core
public import XTP.W8
public import XTP.Loops
public import XTP.Views
/-! # XTP.Node: the node part of the native X tier (`XT.prep`) against `KD.xpartC`'s node conjuncts

* `rowOf_view`: the native dictionary rows are `NN.rowV dict`;
* `nrOK_of`: `KD.nrOK`;
* `aggsX_of`: `KD.aggsX` (layouts 0 and 2), via the slot form of `K2.bxOK`'s formula (`bxF_slot` = `XT.brow`);
* `dtOK_of`: `KD.dtOK` (the tables `nperpTab` / `rkTab` are `R3RT.nperpL` / `RootSound.rkOf`);
* `an_slot`: the native node-matrix rows are the slots of `KD.anodeX`. -/
@[expose] public section
namespace XTP
open XT

set_option exponentiation.threshold 1024

/-! ## Literals -/

theorem NPLL_eq : XT.NPLL = R3RT.NPLL := by decide +kernel
theorem NPHL_eq : XT.NPHL = R3RT.NPHL := by decide +kernel
theorem M511_eq : XT.M511 = R3RT.M511 := by decide +kernel
theorem RKT_eq : XT.RKT = RootCheck.RKT := by decide +kernel

theorem nperpL_eq (v : ℕ) : XT.nperpL v = R3RT.nperpL v := by
  unfold XT.nperpL R3RT.nperpL; rw [NPLL_eq, NPHL_eq, M511_eq]

theorem rkOf_eq (X : ℕ) : XT.rkOf X = RootSound.rkOf X := by
  unfold XT.rkOf RootSound.rkOf; rw [RKT_eq]

/-! ## The dictionary -/

theorem size_dictWOf (dict : Array UInt64) : (dictWOf dict).size = dict.size / 8 := by simp [dictWOf]

theorem rowOf_view (dict : Array UInt64) (p : ℕ) : (rowOf (dictWOf dict) p).view = NN.rowV dict p := by
  unfold rowOf NN.rowV
  rw [size_dictWOf]
  by_cases hp : p < dict.size / 8
  · rw [if_pos hp, if_pos (by omega)]
    have : (dictWOf dict)[p]! = W8.ofLimbs dict (8 * p) := by
      rw [getElem!_pos (dictWOf dict) p (by rw [size_dictWOf]; exact hp)]; simp [dictWOf]
    rw [this, W8.view_ofLimbs]
  · rw [if_neg hp, if_neg (by omega), W8.view_zero]

/-! ## Residual classes and node rows -/

theorem r1pos_eq (b1 m e1 p : ℕ) : XT.r1pos b1 m e1 p = KD.r1pos b1 m e1 p := by
  apply Bool.eq_iff_iff.mpr
  simp [XT.r1pos, KD.r1pos, Nat.blt_eq, Nat.ble_eq]

theorem nrOK_of (b1 m e1 : ℕ) (dictW : Array W8) (nrows : Array ℕ) (h : nrowsOK b1 m e1 dictW nrows = true) :
    KD.nrOK b1 m e1 nrows.toList = true := by
  unfold nrowsOK at h
  rw [Array.all_eq_true] at h
  have hl : ∀ p ∈ nrows.toList, XT.r1pos b1 m e1 p = true := by
    intro p hp
    obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hp
    have := h i (by simpa using hi)
    simp only [Array.getElem_toList, Bool.and_eq_true] at this ⊢
    exact this.1
  generalize nrows.toList = L at hl
  induction L with
  | nil => rfl
  | cons p L ih =>
    show (KD.r1pos b1 m e1 p && KD.nrOK b1 m e1 L) = true
    rw [Bool.and_eq_true, ← r1pos_eq]
    exact ⟨hl p (List.mem_cons_self ..), ih (fun q hq => hl q (List.mem_cons_of_mem _ hq))⟩

end XTP
