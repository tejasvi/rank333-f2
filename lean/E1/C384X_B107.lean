module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1152 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 1 = true := by decide +kernel
theorem okB1153 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1153 1 = true := by decide +kernel
theorem okB1154 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1154 1 = true := by decide +kernel
theorem okB1155 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1155 1 = true := by decide +kernel
theorem okB1156 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1156 1 = true := by decide +kernel
theorem okB1157 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1157 1 = true := by decide +kernel
theorem okB1158 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1158 1 = true := by decide +kernel
theorem okB1159 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1159 1 = true := by decide +kernel
theorem okB1160 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1160 1 = true := by decide +kernel
theorem okB1161 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1161 1 = true := by decide +kernel
theorem okG107 : glueChkR lits W 1152 10 = true := by decide +kernel
theorem okM107 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 1 = true := okB1152
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 2 = true := blkChk_join _ _ _ _ _ 1152 1 1 h0 okB1153
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 3 = true := blkChk_join _ _ _ _ _ 1152 2 1 h1 okB1154
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 4 = true := blkChk_join _ _ _ _ _ 1152 3 1 h2 okB1155
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 5 = true := blkChk_join _ _ _ _ _ 1152 4 1 h3 okB1156
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 6 = true := blkChk_join _ _ _ _ _ 1152 5 1 h4 okB1157
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 7 = true := blkChk_join _ _ _ _ _ 1152 6 1 h5 okB1158
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 8 = true := blkChk_join _ _ _ _ _ 1152 7 1 h6 okB1159
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 9 = true := blkChk_join _ _ _ _ _ 1152 8 1 h7 okB1160
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1152 10 = true := blkChk_join _ _ _ _ _ 1152 9 1 h8 okB1161
  exact h9
end E1.C384X
