module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1195 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 1 = true := by decide +kernel
theorem okB1196 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1196 1 = true := by decide +kernel
theorem okB1197 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1197 1 = true := by decide +kernel
theorem okB1198 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1198 1 = true := by decide +kernel
theorem okB1199 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1199 1 = true := by decide +kernel
theorem okB1200 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1200 1 = true := by decide +kernel
theorem okB1201 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1201 1 = true := by decide +kernel
theorem okB1202 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1202 1 = true := by decide +kernel
theorem okB1203 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1203 1 = true := by decide +kernel
theorem okB1204 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1204 1 = true := by decide +kernel
theorem okB1205 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1205 1 = true := by decide +kernel
theorem okG111 : glueChkR lits W 1195 11 = true := by decide +kernel
theorem okM111 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 1 = true := okB1195
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 2 = true := blkChk_join _ _ _ _ _ 1195 1 1 h0 okB1196
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 3 = true := blkChk_join _ _ _ _ _ 1195 2 1 h1 okB1197
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 4 = true := blkChk_join _ _ _ _ _ 1195 3 1 h2 okB1198
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 5 = true := blkChk_join _ _ _ _ _ 1195 4 1 h3 okB1199
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 6 = true := blkChk_join _ _ _ _ _ 1195 5 1 h4 okB1200
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 7 = true := blkChk_join _ _ _ _ _ 1195 6 1 h5 okB1201
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 8 = true := blkChk_join _ _ _ _ _ 1195 7 1 h6 okB1202
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 9 = true := blkChk_join _ _ _ _ _ 1195 8 1 h7 okB1203
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 10 = true := blkChk_join _ _ _ _ _ 1195 9 1 h8 okB1204
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1195 11 = true := blkChk_join _ _ _ _ _ 1195 10 1 h9 okB1205
  exact h10
end E1.C384X
