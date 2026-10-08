module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1371 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 1 = true := by decide +kernel
theorem okB1372 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1372 1 = true := by decide +kernel
theorem okB1373 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1373 1 = true := by decide +kernel
theorem okB1374 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1374 1 = true := by decide +kernel
theorem okB1375 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1375 1 = true := by decide +kernel
theorem okB1376 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1376 1 = true := by decide +kernel
theorem okB1377 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1377 1 = true := by decide +kernel
theorem okB1378 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1378 1 = true := by decide +kernel
theorem okB1379 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1379 1 = true := by decide +kernel
theorem okB1380 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1380 1 = true := by decide +kernel
theorem okB1381 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1381 1 = true := by decide +kernel
theorem okG127 : glueChkR lits W 1371 11 = true := by decide +kernel
theorem okM127 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 1 = true := okB1371
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 2 = true := blkChk_join _ _ _ _ _ 1371 1 1 h0 okB1372
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 3 = true := blkChk_join _ _ _ _ _ 1371 2 1 h1 okB1373
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 4 = true := blkChk_join _ _ _ _ _ 1371 3 1 h2 okB1374
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 5 = true := blkChk_join _ _ _ _ _ 1371 4 1 h3 okB1375
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 6 = true := blkChk_join _ _ _ _ _ 1371 5 1 h4 okB1376
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 7 = true := blkChk_join _ _ _ _ _ 1371 6 1 h5 okB1377
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 8 = true := blkChk_join _ _ _ _ _ 1371 7 1 h6 okB1378
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 9 = true := blkChk_join _ _ _ _ _ 1371 8 1 h7 okB1379
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 10 = true := blkChk_join _ _ _ _ _ 1371 9 1 h8 okB1380
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1371 11 = true := blkChk_join _ _ _ _ _ 1371 10 1 h9 okB1381
  exact h10
end E1.C384X
