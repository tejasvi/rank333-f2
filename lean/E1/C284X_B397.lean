module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3803 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3804 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3805 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3806 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3807 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG397 : glueChkR lits W 3803 5 = true := by
  rw [← glueChkRN_eq lits W 7747 3803 lenT]; decide +kernel
theorem okM397 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 1 = true := okB3803
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 2 = true := blkChk_join _ _ _ _ _ 3803 1 1 h0 okB3804
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 3 = true := blkChk_join _ _ _ _ _ 3803 2 1 h1 okB3805
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 4 = true := blkChk_join _ _ _ _ _ 3803 3 1 h2 okB3806
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3803 5 = true := blkChk_join _ _ _ _ _ 3803 4 1 h3 okB3807
  exact h4
end E1.C284X
