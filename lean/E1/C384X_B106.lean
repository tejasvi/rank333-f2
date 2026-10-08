module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1141 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 1 = true := by decide +kernel
theorem okB1142 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1142 1 = true := by decide +kernel
theorem okB1143 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1143 1 = true := by decide +kernel
theorem okB1144 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1144 1 = true := by decide +kernel
theorem okB1145 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1145 1 = true := by decide +kernel
theorem okB1146 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1146 1 = true := by decide +kernel
theorem okB1147 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1147 1 = true := by decide +kernel
theorem okB1148 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1148 1 = true := by decide +kernel
theorem okB1149 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1149 1 = true := by decide +kernel
theorem okB1150 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1150 1 = true := by decide +kernel
theorem okB1151 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1151 1 = true := by decide +kernel
theorem okG106 : glueChkR lits W 1141 11 = true := by decide +kernel
theorem okM106 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 1 = true := okB1141
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 2 = true := blkChk_join _ _ _ _ _ 1141 1 1 h0 okB1142
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 3 = true := blkChk_join _ _ _ _ _ 1141 2 1 h1 okB1143
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 4 = true := blkChk_join _ _ _ _ _ 1141 3 1 h2 okB1144
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 5 = true := blkChk_join _ _ _ _ _ 1141 4 1 h3 okB1145
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 6 = true := blkChk_join _ _ _ _ _ 1141 5 1 h4 okB1146
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 7 = true := blkChk_join _ _ _ _ _ 1141 6 1 h5 okB1147
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 8 = true := blkChk_join _ _ _ _ _ 1141 7 1 h6 okB1148
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 9 = true := blkChk_join _ _ _ _ _ 1141 8 1 h7 okB1149
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 10 = true := blkChk_join _ _ _ _ _ 1141 9 1 h8 okB1150
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1141 11 = true := blkChk_join _ _ _ _ _ 1141 10 1 h9 okB1151
  exact h10
end E1.C384X
