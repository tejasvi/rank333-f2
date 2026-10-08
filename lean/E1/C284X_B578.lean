module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5451 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5452 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5452 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5453 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5453 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5454 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5454 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5455 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5455 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5456 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5456 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5457 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5457 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5458 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5458 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5459 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5459 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG578 : glueChkR lits W 5451 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5451 lenT]; decide +kernel
theorem okM578 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 1 = true := okB5451
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 2 = true := blkChk_join _ _ _ _ _ 5451 1 1 h0 okB5452
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 3 = true := blkChk_join _ _ _ _ _ 5451 2 1 h1 okB5453
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 4 = true := blkChk_join _ _ _ _ _ 5451 3 1 h2 okB5454
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 5 = true := blkChk_join _ _ _ _ _ 5451 4 1 h3 okB5455
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 6 = true := blkChk_join _ _ _ _ _ 5451 5 1 h4 okB5456
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 7 = true := blkChk_join _ _ _ _ _ 5451 6 1 h5 okB5457
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 8 = true := blkChk_join _ _ _ _ _ 5451 7 1 h6 okB5458
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5451 9 = true := blkChk_join _ _ _ _ _ 5451 8 1 h7 okB5459
  exact h8
end E1.C284X
