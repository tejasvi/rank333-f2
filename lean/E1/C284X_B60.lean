module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB525 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG60 : glueChkR lits W 522 10 = true := by
  rw [← glueChkRN_eq lits W 7747 522 lenT]; decide +kernel
theorem okM60 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 1 = true := okB522
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 2 = true := blkChk_join _ _ _ _ _ 522 1 1 h0 okB523
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 3 = true := blkChk_join _ _ _ _ _ 522 2 1 h1 okB524
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 4 = true := blkChk_join _ _ _ _ _ 522 3 1 h2 okB525
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 5 = true := blkChk_join _ _ _ _ _ 522 4 1 h3 okB526
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 6 = true := blkChk_join _ _ _ _ _ 522 5 1 h4 okB527
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 7 = true := blkChk_join _ _ _ _ _ 522 6 1 h5 okB528
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 8 = true := blkChk_join _ _ _ _ _ 522 7 1 h6 okB529
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 9 = true := blkChk_join _ _ _ _ _ 522 8 1 h7 okB530
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 522 10 = true := blkChk_join _ _ _ _ _ 522 9 1 h8 okB531
  exact h9
end E1.C284X
