module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB1014 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 1 = true := by decide +kernel
theorem okB1015 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1015 1 = true := by decide +kernel
theorem okB1016 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1016 1 = true := by decide +kernel
theorem okB1017 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1017 1 = true := by decide +kernel
theorem okB1018 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1018 1 = true := by decide +kernel
theorem okB1019 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1019 1 = true := by decide +kernel
theorem okB1020 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1020 1 = true := by decide +kernel
theorem okB1021 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1021 1 = true := by decide +kernel
theorem okB1022 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1022 1 = true := by decide +kernel
theorem okB1023 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1023 1 = true := by decide +kernel
theorem okG85 : glueChkR lits W 1014 10 = true := by decide +kernel
theorem okM85 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 10 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 1 = true := okB1014
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 2 = true := blkChk_join _ _ _ _ _ 1014 1 1 h0 okB1015
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 3 = true := blkChk_join _ _ _ _ _ 1014 2 1 h1 okB1016
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 4 = true := blkChk_join _ _ _ _ _ 1014 3 1 h2 okB1017
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 5 = true := blkChk_join _ _ _ _ _ 1014 4 1 h3 okB1018
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 6 = true := blkChk_join _ _ _ _ _ 1014 5 1 h4 okB1019
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 7 = true := blkChk_join _ _ _ _ _ 1014 6 1 h5 okB1020
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 8 = true := blkChk_join _ _ _ _ _ 1014 7 1 h6 okB1021
  have h8 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 9 = true := blkChk_join _ _ _ _ _ 1014 8 1 h7 okB1022
  have h9 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1014 10 = true := blkChk_join _ _ _ _ _ 1014 9 1 h8 okB1023
  exact h9
end E1.C267X
