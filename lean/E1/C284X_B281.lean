module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2599 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2600 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2600 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2601 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2601 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2602 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2602 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2603 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2603 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2604 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG281 : glueChkR lits W 2599 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2599 lenT]; decide +kernel
theorem okM281 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 1 = true := okB2599
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 2 = true := blkChk_join _ _ _ _ _ 2599 1 1 h0 okB2600
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 3 = true := blkChk_join _ _ _ _ _ 2599 2 1 h1 okB2601
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 4 = true := blkChk_join _ _ _ _ _ 2599 3 1 h2 okB2602
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 5 = true := blkChk_join _ _ _ _ _ 2599 4 1 h3 okB2603
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2599 6 = true := blkChk_join _ _ _ _ _ 2599 5 1 h4 okB2604
  exact h5
end E1.C284X
