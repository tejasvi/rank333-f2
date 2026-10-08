module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3454 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3455 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3455 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3456 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3456 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3457 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3457 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3458 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3458 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3459 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3459 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG367 : glueChkR lits W 3454 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3454 lenT]; decide +kernel
theorem okM367 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 1 = true := okB3454
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 2 = true := blkChk_join _ _ _ _ _ 3454 1 1 h0 okB3455
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 3 = true := blkChk_join _ _ _ _ _ 3454 2 1 h1 okB3456
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 4 = true := blkChk_join _ _ _ _ _ 3454 3 1 h2 okB3457
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 5 = true := blkChk_join _ _ _ _ _ 3454 4 1 h3 okB3458
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3454 6 = true := blkChk_join _ _ _ _ _ 3454 5 1 h4 okB3459
  exact h5
end E1.C284X
