module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1344 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 1 = true := by decide +kernel
theorem okB1345 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1345 1 = true := by decide +kernel
theorem okB1346 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1346 1 = true := by decide +kernel
theorem okB1347 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1347 1 = true := by decide +kernel
theorem okB1348 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1348 1 = true := by decide +kernel
theorem okB1349 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1349 1 = true := by decide +kernel
theorem okB1350 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1350 1 = true := by decide +kernel
theorem okB1351 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1351 1 = true := by decide +kernel
theorem okB1352 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1352 1 = true := by decide +kernel
theorem okB1353 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1353 1 = true := by decide +kernel
theorem okG120 : glueChkR lits W 1344 10 = true := by decide +kernel
theorem okM120 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 1 = true := okB1344
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 2 = true := blkChk_join _ _ _ _ _ 1344 1 1 h0 okB1345
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 3 = true := blkChk_join _ _ _ _ _ 1344 2 1 h1 okB1346
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 4 = true := blkChk_join _ _ _ _ _ 1344 3 1 h2 okB1347
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 5 = true := blkChk_join _ _ _ _ _ 1344 4 1 h3 okB1348
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 6 = true := blkChk_join _ _ _ _ _ 1344 5 1 h4 okB1349
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 7 = true := blkChk_join _ _ _ _ _ 1344 6 1 h5 okB1350
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 8 = true := blkChk_join _ _ _ _ _ 1344 7 1 h6 okB1351
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 9 = true := blkChk_join _ _ _ _ _ 1344 8 1 h7 okB1352
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1344 10 = true := blkChk_join _ _ _ _ _ 1344 9 1 h8 okB1353
  exact h9
end E1.C382X
