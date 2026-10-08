module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1269 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 1 = true := by decide +kernel
theorem okB1270 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1270 1 = true := by decide +kernel
theorem okB1271 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1271 1 = true := by decide +kernel
theorem okB1272 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1272 1 = true := by decide +kernel
theorem okB1273 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1273 1 = true := by decide +kernel
theorem okB1274 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1274 1 = true := by decide +kernel
theorem okB1275 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1275 1 = true := by decide +kernel
theorem okB1276 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1276 1 = true := by decide +kernel
theorem okG117 : glueChkR lits W 1269 8 = true := by decide +kernel
theorem okM117 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 1 = true := okB1269
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 2 = true := blkChk_join _ _ _ _ _ 1269 1 1 h0 okB1270
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 3 = true := blkChk_join _ _ _ _ _ 1269 2 1 h1 okB1271
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 4 = true := blkChk_join _ _ _ _ _ 1269 3 1 h2 okB1272
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 5 = true := blkChk_join _ _ _ _ _ 1269 4 1 h3 okB1273
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 6 = true := blkChk_join _ _ _ _ _ 1269 5 1 h4 okB1274
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 7 = true := blkChk_join _ _ _ _ _ 1269 6 1 h5 okB1275
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1269 8 = true := blkChk_join _ _ _ _ _ 1269 7 1 h6 okB1276
  exact h7
end E1.C384X
