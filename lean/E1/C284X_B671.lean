module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6441 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6441 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6442 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6443 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6444 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6445 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6447 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6447 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG671 : glueChkR lits W 6440 8 = true := by
  rw [← glueChkRN_eq lits W 7747 6440 lenT]; decide +kernel
theorem okM671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 1 = true := okB6440
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 2 = true := blkChk_join _ _ _ _ _ 6440 1 1 h0 okB6441
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 3 = true := blkChk_join _ _ _ _ _ 6440 2 1 h1 okB6442
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 4 = true := blkChk_join _ _ _ _ _ 6440 3 1 h2 okB6443
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 5 = true := blkChk_join _ _ _ _ _ 6440 4 1 h3 okB6444
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 6 = true := blkChk_join _ _ _ _ _ 6440 5 1 h4 okB6445
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 7 = true := blkChk_join _ _ _ _ _ 6440 6 1 h5 okB6446
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6440 8 = true := blkChk_join _ _ _ _ _ 6440 7 1 h6 okB6447
  exact h7
end E1.C284X
