module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1015 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1016 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1017 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1018 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1019 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1020 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1020 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1021 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1021 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1022 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1022 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1023 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1023 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG96 : glueChkR lits W 1015 9 = true := by
  rw [← glueChkRN_eq lits W 8596 1015 lenT]; decide +kernel
theorem okM96 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 1 = true := okB1015
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 2 = true := blkChk_join _ _ _ _ _ 1015 1 1 h0 okB1016
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 3 = true := blkChk_join _ _ _ _ _ 1015 2 1 h1 okB1017
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 4 = true := blkChk_join _ _ _ _ _ 1015 3 1 h2 okB1018
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 5 = true := blkChk_join _ _ _ _ _ 1015 4 1 h3 okB1019
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 6 = true := blkChk_join _ _ _ _ _ 1015 5 1 h4 okB1020
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 7 = true := blkChk_join _ _ _ _ _ 1015 6 1 h5 okB1021
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 8 = true := blkChk_join _ _ _ _ _ 1015 7 1 h6 okB1022
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1015 9 = true := blkChk_join _ _ _ _ _ 1015 8 1 h7 okB1023
  exact h8
end E1.C236X
