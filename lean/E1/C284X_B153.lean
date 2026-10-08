module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1397 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1398 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1398 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1399 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1399 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1400 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1400 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1401 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1401 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1402 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1402 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG153 : glueChkR lits W 1397 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1397 lenT]; decide +kernel
theorem okM153 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 1 = true := okB1397
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 2 = true := blkChk_join _ _ _ _ _ 1397 1 1 h0 okB1398
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 3 = true := blkChk_join _ _ _ _ _ 1397 2 1 h1 okB1399
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 4 = true := blkChk_join _ _ _ _ _ 1397 3 1 h2 okB1400
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 5 = true := blkChk_join _ _ _ _ _ 1397 4 1 h3 okB1401
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1397 6 = true := blkChk_join _ _ _ _ _ 1397 5 1 h4 okB1402
  exact h5
end E1.C284X
