module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3808 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3809 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3810 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3811 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3812 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3813 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG398 : glueChkR lits W 3808 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3808 lenT]; decide +kernel
theorem okM398 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 1 = true := okB3808
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 2 = true := blkChk_join _ _ _ _ _ 3808 1 1 h0 okB3809
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 3 = true := blkChk_join _ _ _ _ _ 3808 2 1 h1 okB3810
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 4 = true := blkChk_join _ _ _ _ _ 3808 3 1 h2 okB3811
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 5 = true := blkChk_join _ _ _ _ _ 3808 4 1 h3 okB3812
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3808 6 = true := blkChk_join _ _ _ _ _ 3808 5 1 h4 okB3813
  exact h5
end E1.C284X
