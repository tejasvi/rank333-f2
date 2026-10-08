module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1016 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1017 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1018 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1019 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1020 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1020 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1021 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1021 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG108 : glueChkR lits W 1016 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1016 lenT]; decide +kernel
theorem okM108 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 1 = true := okB1016
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 2 = true := blkChk_join _ _ _ _ _ 1016 1 1 h0 okB1017
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 3 = true := blkChk_join _ _ _ _ _ 1016 2 1 h1 okB1018
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 4 = true := blkChk_join _ _ _ _ _ 1016 3 1 h2 okB1019
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 5 = true := blkChk_join _ _ _ _ _ 1016 4 1 h3 okB1020
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1016 6 = true := blkChk_join _ _ _ _ _ 1016 5 1 h4 okB1021
  exact h5
end E1.C284X
