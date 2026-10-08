module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG480 : glueChkR lits W 4530 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4530 lenT]; decide +kernel
theorem okM480 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 1 = true := okB4530
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 2 = true := blkChk_join _ _ _ _ _ 4530 1 1 h0 okB4531
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 3 = true := blkChk_join _ _ _ _ _ 4530 2 1 h1 okB4532
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 4 = true := blkChk_join _ _ _ _ _ 4530 3 1 h2 okB4533
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 5 = true := blkChk_join _ _ _ _ _ 4530 4 1 h3 okB4534
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 6 = true := blkChk_join _ _ _ _ _ 4530 5 1 h4 okB4535
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 7 = true := blkChk_join _ _ _ _ _ 4530 6 1 h5 okB4536
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 8 = true := blkChk_join _ _ _ _ _ 4530 7 1 h6 okB4537
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4530 9 = true := blkChk_join _ _ _ _ _ 4530 8 1 h7 okB4538
  exact h8
end E1.C284X
