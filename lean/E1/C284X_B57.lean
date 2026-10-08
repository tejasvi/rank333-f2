module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB499 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB503 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG57 : glueChkR lits W 499 6 = true := by
  rw [← glueChkRN_eq lits W 7747 499 lenT]; decide +kernel
theorem okM57 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 1 = true := okB499
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 2 = true := blkChk_join _ _ _ _ _ 499 1 1 h0 okB500
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 3 = true := blkChk_join _ _ _ _ _ 499 2 1 h1 okB501
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 4 = true := blkChk_join _ _ _ _ _ 499 3 1 h2 okB502
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 5 = true := blkChk_join _ _ _ _ _ 499 4 1 h3 okB503
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 499 6 = true := blkChk_join _ _ _ _ _ 499 5 1 h4 okB504
  exact h5
end E1.C284X
