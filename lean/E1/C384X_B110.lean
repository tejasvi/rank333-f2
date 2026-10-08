module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1187 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 1 = true := by decide +kernel
theorem okB1188 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1188 1 = true := by decide +kernel
theorem okB1189 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1189 1 = true := by decide +kernel
theorem okB1190 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1190 1 = true := by decide +kernel
theorem okB1191 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1191 1 = true := by decide +kernel
theorem okB1192 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1192 1 = true := by decide +kernel
theorem okB1193 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1193 1 = true := by decide +kernel
theorem okB1194 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1194 1 = true := by decide +kernel
theorem okG110 : glueChkR lits W 1187 8 = true := by decide +kernel
theorem okM110 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 1 = true := okB1187
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 2 = true := blkChk_join _ _ _ _ _ 1187 1 1 h0 okB1188
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 3 = true := blkChk_join _ _ _ _ _ 1187 2 1 h1 okB1189
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 4 = true := blkChk_join _ _ _ _ _ 1187 3 1 h2 okB1190
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 5 = true := blkChk_join _ _ _ _ _ 1187 4 1 h3 okB1191
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 6 = true := blkChk_join _ _ _ _ _ 1187 5 1 h4 okB1192
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 7 = true := blkChk_join _ _ _ _ _ 1187 6 1 h5 okB1193
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1187 8 = true := blkChk_join _ _ _ _ _ 1187 7 1 h6 okB1194
  exact h7
end E1.C384X
