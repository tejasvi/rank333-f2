module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6420 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6421 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6421 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6422 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6422 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6423 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6423 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6424 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6424 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6425 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6425 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6426 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6426 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6427 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6427 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG669 : glueChkR lits W 6420 8 = true := by
  rw [← glueChkRN_eq lits W 7747 6420 lenT]; decide +kernel
theorem okM669 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 1 = true := okB6420
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 2 = true := blkChk_join _ _ _ _ _ 6420 1 1 h0 okB6421
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 3 = true := blkChk_join _ _ _ _ _ 6420 2 1 h1 okB6422
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 4 = true := blkChk_join _ _ _ _ _ 6420 3 1 h2 okB6423
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 5 = true := blkChk_join _ _ _ _ _ 6420 4 1 h3 okB6424
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 6 = true := blkChk_join _ _ _ _ _ 6420 5 1 h4 okB6425
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 7 = true := blkChk_join _ _ _ _ _ 6420 6 1 h5 okB6426
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6420 8 = true := blkChk_join _ _ _ _ _ 6420 7 1 h6 okB6427
  exact h7
end E1.C284X
