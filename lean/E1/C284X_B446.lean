module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4198 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4199 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4199 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4200 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4200 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4201 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4201 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4202 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4202 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4203 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4203 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG446 : glueChkR lits W 4198 6 = true := by
  rw [← glueChkRN_eq lits W 7747 4198 lenT]; decide +kernel
theorem okM446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 1 = true := okB4198
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 2 = true := blkChk_join _ _ _ _ _ 4198 1 1 h0 okB4199
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 3 = true := blkChk_join _ _ _ _ _ 4198 2 1 h1 okB4200
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 4 = true := blkChk_join _ _ _ _ _ 4198 3 1 h2 okB4201
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 5 = true := blkChk_join _ _ _ _ _ 4198 4 1 h3 okB4202
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4198 6 = true := blkChk_join _ _ _ _ _ 4198 5 1 h4 okB4203
  exact h5
end E1.C284X
