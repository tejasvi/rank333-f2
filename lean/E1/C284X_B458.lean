module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4305 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4306 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4307 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4308 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4309 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4310 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4311 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4312 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4313 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG458 : glueChkR lits W 4305 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4305 lenT]; decide +kernel
theorem okM458 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 1 = true := okB4305
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 2 = true := blkChk_join _ _ _ _ _ 4305 1 1 h0 okB4306
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 3 = true := blkChk_join _ _ _ _ _ 4305 2 1 h1 okB4307
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 4 = true := blkChk_join _ _ _ _ _ 4305 3 1 h2 okB4308
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 5 = true := blkChk_join _ _ _ _ _ 4305 4 1 h3 okB4309
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 6 = true := blkChk_join _ _ _ _ _ 4305 5 1 h4 okB4310
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 7 = true := blkChk_join _ _ _ _ _ 4305 6 1 h5 okB4311
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 8 = true := blkChk_join _ _ _ _ _ 4305 7 1 h6 okB4312
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4305 9 = true := blkChk_join _ _ _ _ _ 4305 8 1 h7 okB4313
  exact h8
end E1.C284X
