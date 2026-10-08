module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1076 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 1 = true := by decide +kernel
theorem okB1077 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1077 1 = true := by decide +kernel
theorem okB1078 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1078 1 = true := by decide +kernel
theorem okB1079 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1079 1 = true := by decide +kernel
theorem okB1080 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1080 1 = true := by decide +kernel
theorem okB1081 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1081 1 = true := by decide +kernel
theorem okB1082 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1082 1 = true := by decide +kernel
theorem okB1083 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1083 1 = true := by decide +kernel
theorem okB1084 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1084 1 = true := by decide +kernel
theorem okB1085 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1085 1 = true := by decide +kernel
theorem okB1086 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1086 1 = true := by decide +kernel
theorem okG95 : glueChkR lits W 1076 11 = true := by decide +kernel
theorem okM95 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 11 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 1 = true := okB1076
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 2 = true := blkChk_join _ _ _ _ _ 1076 1 1 h0 okB1077
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 3 = true := blkChk_join _ _ _ _ _ 1076 2 1 h1 okB1078
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 4 = true := blkChk_join _ _ _ _ _ 1076 3 1 h2 okB1079
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 5 = true := blkChk_join _ _ _ _ _ 1076 4 1 h3 okB1080
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 6 = true := blkChk_join _ _ _ _ _ 1076 5 1 h4 okB1081
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 7 = true := blkChk_join _ _ _ _ _ 1076 6 1 h5 okB1082
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 8 = true := blkChk_join _ _ _ _ _ 1076 7 1 h6 okB1083
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 9 = true := blkChk_join _ _ _ _ _ 1076 8 1 h7 okB1084
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 10 = true := blkChk_join _ _ _ _ _ 1076 9 1 h8 okB1085
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1076 11 = true := blkChk_join _ _ _ _ _ 1076 10 1 h9 okB1086
  exact h10
end E1.C382X
