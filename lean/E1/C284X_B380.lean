module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3591 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3592 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3592 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3593 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3593 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3594 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3594 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3595 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3595 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3596 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3596 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG380 : glueChkR lits W 3591 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3591 lenT]; decide +kernel
theorem okM380 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 1 = true := okB3591
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 2 = true := blkChk_join _ _ _ _ _ 3591 1 1 h0 okB3592
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 3 = true := blkChk_join _ _ _ _ _ 3591 2 1 h1 okB3593
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 4 = true := blkChk_join _ _ _ _ _ 3591 3 1 h2 okB3594
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 5 = true := blkChk_join _ _ _ _ _ 3591 4 1 h3 okB3595
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3591 6 = true := blkChk_join _ _ _ _ _ 3591 5 1 h4 okB3596
  exact h5
end E1.C284X
