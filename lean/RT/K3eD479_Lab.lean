module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD479_LabOK0
@[expose] public section
set_option maxRecDepth 100000
/-! # Stored label masks of `K3eD479`: `labMask_spec` -/
namespace RT.K3eD479L
open RT
theorem labOK_all : labOK 0 441 = true := by
  have h0 : labOK 0 441 = true := okM0
  exact h0
/-- the stored label mask of row `i`: bit `l < 511` is bit `vecL l` (the point of label `l`) of the row's point mask -/
theorem labMask_spec (i : Nat) (hi : i < 441) (l : Nat) (hl : l < 511) :
    (entry i).testBit l = (dualM (RT.K3eD479.entry i)).testBit (vecL l) := by
  have h := labOK_spec 0 441 labOK_all i hi
  rw [Nat.zero_add] at h
  rw [h, Nat.testBit_or, Nat.testBit_shiftLeft, labMain_testBit _ _ hl]
  simp [show ¬ (511 ≤ l) by omega]
/-- the stored cap of row `i` (bits 511 ..) is the row's cap -/
theorem capL_spec (i : Nat) (hi : i < 441) : (entry i) >>> 511 = eCap (RT.K3eD479.entry i) := by
  have h := labOK_spec 0 441 labOK_all i hi
  rw [Nat.zero_add] at h
  rw [h, Nat.shiftRight_or_distrib, Nat.shiftLeft_shiftRight]
  have hl : labMain (RT.K3eD479.entry i) >>> 511 = 0 := by
    apply Nat.shiftRight_eq_zero
    exact labMain_lt _
  rw [hl, Nat.zero_or]
end RT.K3eD479L
