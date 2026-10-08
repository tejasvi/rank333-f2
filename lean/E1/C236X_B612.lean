module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6428 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6429 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6429 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6430 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6430 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6431 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6431 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6432 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6432 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6433 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6433 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6434 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6434 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6435 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6435 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6436 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6436 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG612 : glueChkR lits W 6428 9 = true := by
  rw [← glueChkRN_eq lits W 8596 6428 lenT]; decide +kernel
theorem okM612 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 1 = true := okB6428
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 2 = true := blkChk_join _ _ _ _ _ 6428 1 1 h0 okB6429
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 3 = true := blkChk_join _ _ _ _ _ 6428 2 1 h1 okB6430
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 4 = true := blkChk_join _ _ _ _ _ 6428 3 1 h2 okB6431
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 5 = true := blkChk_join _ _ _ _ _ 6428 4 1 h3 okB6432
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 6 = true := blkChk_join _ _ _ _ _ 6428 5 1 h4 okB6433
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 7 = true := blkChk_join _ _ _ _ _ 6428 6 1 h5 okB6434
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 8 = true := blkChk_join _ _ _ _ _ 6428 7 1 h6 okB6435
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6428 9 = true := blkChk_join _ _ _ _ _ 6428 8 1 h7 okB6436
  exact h8
end E1.C236X
