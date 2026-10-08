module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4278 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4279 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4279 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4280 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4280 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4281 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4281 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4282 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4282 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4283 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4283 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4284 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG455 : glueChkR lits W 4278 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4278 lenT]; decide +kernel
theorem okM455 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 1 = true := okB4278
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 2 = true := blkChk_join _ _ _ _ _ 4278 1 1 h0 okB4279
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 3 = true := blkChk_join _ _ _ _ _ 4278 2 1 h1 okB4280
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 4 = true := blkChk_join _ _ _ _ _ 4278 3 1 h2 okB4281
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 5 = true := blkChk_join _ _ _ _ _ 4278 4 1 h3 okB4282
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 6 = true := blkChk_join _ _ _ _ _ 4278 5 1 h4 okB4283
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 7 = true := blkChk_join _ _ _ _ _ 4278 6 1 h5 okB4284
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4278 8 = true := blkChk_join _ _ _ _ _ 4278 7 1 h6 okB4285
  exact h7
end E1.C284X
