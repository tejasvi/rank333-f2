module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1315 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 1 = true := by decide +kernel
theorem okB1316 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1316 1 = true := by decide +kernel
theorem okB1317 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1317 1 = true := by decide +kernel
theorem okB1318 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1318 1 = true := by decide +kernel
theorem okB1319 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1319 1 = true := by decide +kernel
theorem okB1320 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1320 1 = true := by decide +kernel
theorem okB1321 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1321 1 = true := by decide +kernel
theorem okB1322 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1322 1 = true := by decide +kernel
theorem okB1323 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1323 1 = true := by decide +kernel
theorem okB1324 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1324 1 = true := by decide +kernel
theorem okB1325 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1325 1 = true := by decide +kernel
theorem okB1326 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1326 1 = true := by decide +kernel
theorem okG122 : glueChkR lits W 1315 12 = true := by decide +kernel
theorem okM122 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 1 = true := okB1315
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 2 = true := blkChk_join _ _ _ _ _ 1315 1 1 h0 okB1316
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 3 = true := blkChk_join _ _ _ _ _ 1315 2 1 h1 okB1317
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 4 = true := blkChk_join _ _ _ _ _ 1315 3 1 h2 okB1318
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 5 = true := blkChk_join _ _ _ _ _ 1315 4 1 h3 okB1319
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 6 = true := blkChk_join _ _ _ _ _ 1315 5 1 h4 okB1320
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 7 = true := blkChk_join _ _ _ _ _ 1315 6 1 h5 okB1321
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 8 = true := blkChk_join _ _ _ _ _ 1315 7 1 h6 okB1322
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 9 = true := blkChk_join _ _ _ _ _ 1315 8 1 h7 okB1323
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 10 = true := blkChk_join _ _ _ _ _ 1315 9 1 h8 okB1324
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 11 = true := blkChk_join _ _ _ _ _ 1315 10 1 h9 okB1325
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1315 12 = true := blkChk_join _ _ _ _ _ 1315 11 1 h10 okB1326
  exact h11
end E1.C384X
