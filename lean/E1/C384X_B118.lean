module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1277 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 1 = true := by decide +kernel
theorem okB1278 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1278 1 = true := by decide +kernel
theorem okB1279 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1279 1 = true := by decide +kernel
theorem okB1280 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1280 1 = true := by decide +kernel
theorem okB1281 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1281 1 = true := by decide +kernel
theorem okB1282 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1282 1 = true := by decide +kernel
theorem okB1283 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1283 1 = true := by decide +kernel
theorem okB1284 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1284 1 = true := by decide +kernel
theorem okG118 : glueChkR lits W 1277 8 = true := by decide +kernel
theorem okM118 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 1 = true := okB1277
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 2 = true := blkChk_join _ _ _ _ _ 1277 1 1 h0 okB1278
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 3 = true := blkChk_join _ _ _ _ _ 1277 2 1 h1 okB1279
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 4 = true := blkChk_join _ _ _ _ _ 1277 3 1 h2 okB1280
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 5 = true := blkChk_join _ _ _ _ _ 1277 4 1 h3 okB1281
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 6 = true := blkChk_join _ _ _ _ _ 1277 5 1 h4 okB1282
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 7 = true := blkChk_join _ _ _ _ _ 1277 6 1 h5 okB1283
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1277 8 = true := blkChk_join _ _ _ _ _ 1277 7 1 h6 okB1284
  exact h7
end E1.C384X
