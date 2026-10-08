module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7550 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7551 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7551 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7552 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7552 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7553 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7553 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7554 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7554 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7555 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7555 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7556 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7556 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7557 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7557 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7558 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7558 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG760 : glueChkR lits W 7550 9 = true := by
  rw [← glueChkRN_eq lits W 7747 7550 lenT]; decide +kernel
theorem okM760 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 1 = true := okB7550
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 2 = true := blkChk_join _ _ _ _ _ 7550 1 1 h0 okB7551
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 3 = true := blkChk_join _ _ _ _ _ 7550 2 1 h1 okB7552
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 4 = true := blkChk_join _ _ _ _ _ 7550 3 1 h2 okB7553
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 5 = true := blkChk_join _ _ _ _ _ 7550 4 1 h3 okB7554
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 6 = true := blkChk_join _ _ _ _ _ 7550 5 1 h4 okB7555
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 7 = true := blkChk_join _ _ _ _ _ 7550 6 1 h5 okB7556
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 8 = true := blkChk_join _ _ _ _ _ 7550 7 1 h6 okB7557
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7550 9 = true := blkChk_join _ _ _ _ _ 7550 8 1 h7 okB7558
  exact h8
end E1.C284X
