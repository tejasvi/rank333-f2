module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5013 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5014 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5015 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5016 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5017 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5018 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5019 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5020 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5020 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG531 : glueChkR lits W 5013 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5013 lenT]; decide +kernel
theorem okM531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 1 = true := okB5013
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 2 = true := blkChk_join _ _ _ _ _ 5013 1 1 h0 okB5014
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 3 = true := blkChk_join _ _ _ _ _ 5013 2 1 h1 okB5015
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 4 = true := blkChk_join _ _ _ _ _ 5013 3 1 h2 okB5016
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 5 = true := blkChk_join _ _ _ _ _ 5013 4 1 h3 okB5017
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 6 = true := blkChk_join _ _ _ _ _ 5013 5 1 h4 okB5018
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 7 = true := blkChk_join _ _ _ _ _ 5013 6 1 h5 okB5019
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5013 8 = true := blkChk_join _ _ _ _ _ 5013 7 1 h6 okB5020
  exact h7
end E1.C284X
