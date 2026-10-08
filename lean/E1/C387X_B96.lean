module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB1044 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 1 = true := by decide +kernel
theorem okB1045 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1045 1 = true := by decide +kernel
theorem okB1046 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1046 1 = true := by decide +kernel
theorem okB1047 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1047 1 = true := by decide +kernel
theorem okB1048 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1048 1 = true := by decide +kernel
theorem okB1049 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1049 1 = true := by decide +kernel
theorem okB1050 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1050 1 = true := by decide +kernel
theorem okB1051 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1051 1 = true := by decide +kernel
theorem okB1052 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1052 1 = true := by decide +kernel
theorem okG96 : glueChkR lits W 1044 9 = true := by decide +kernel
theorem okM96 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 9 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 1 = true := okB1044
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 2 = true := blkChk_join _ _ _ _ _ 1044 1 1 h0 okB1045
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 3 = true := blkChk_join _ _ _ _ _ 1044 2 1 h1 okB1046
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 4 = true := blkChk_join _ _ _ _ _ 1044 3 1 h2 okB1047
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 5 = true := blkChk_join _ _ _ _ _ 1044 4 1 h3 okB1048
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 6 = true := blkChk_join _ _ _ _ _ 1044 5 1 h4 okB1049
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 7 = true := blkChk_join _ _ _ _ _ 1044 6 1 h5 okB1050
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 8 = true := blkChk_join _ _ _ _ _ 1044 7 1 h6 okB1051
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1044 9 = true := blkChk_join _ _ _ _ _ 1044 8 1 h7 okB1052
  exact h8
end E1.C387X
