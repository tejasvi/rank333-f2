module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1361 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 1 = true := by decide +kernel
theorem okB1362 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1362 1 = true := by decide +kernel
theorem okB1363 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1363 1 = true := by decide +kernel
theorem okB1364 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1364 1 = true := by decide +kernel
theorem okB1365 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1365 1 = true := by decide +kernel
theorem okB1366 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1366 1 = true := by decide +kernel
theorem okB1367 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1367 1 = true := by decide +kernel
theorem okB1368 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1368 1 = true := by decide +kernel
theorem okB1369 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1369 1 = true := by decide +kernel
theorem okB1370 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1370 1 = true := by decide +kernel
theorem okG126 : glueChkR lits W 1361 10 = true := by decide +kernel
theorem okM126 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 1 = true := okB1361
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 2 = true := blkChk_join _ _ _ _ _ 1361 1 1 h0 okB1362
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 3 = true := blkChk_join _ _ _ _ _ 1361 2 1 h1 okB1363
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 4 = true := blkChk_join _ _ _ _ _ 1361 3 1 h2 okB1364
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 5 = true := blkChk_join _ _ _ _ _ 1361 4 1 h3 okB1365
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 6 = true := blkChk_join _ _ _ _ _ 1361 5 1 h4 okB1366
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 7 = true := blkChk_join _ _ _ _ _ 1361 6 1 h5 okB1367
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 8 = true := blkChk_join _ _ _ _ _ 1361 7 1 h6 okB1368
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 9 = true := blkChk_join _ _ _ _ _ 1361 8 1 h7 okB1369
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1361 10 = true := blkChk_join _ _ _ _ _ 1361 9 1 h8 okB1370
  exact h9
end E1.C384X
