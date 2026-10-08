module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1382 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 1 = true := by decide +kernel
theorem okB1383 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1383 1 = true := by decide +kernel
theorem okB1384 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1384 1 = true := by decide +kernel
theorem okB1385 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1385 1 = true := by decide +kernel
theorem okB1386 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1386 1 = true := by decide +kernel
theorem okB1387 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1387 1 = true := by decide +kernel
theorem okB1388 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1388 1 = true := by decide +kernel
theorem okB1389 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1389 1 = true := by decide +kernel
theorem okB1390 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1390 1 = true := by decide +kernel
theorem okG125 : glueChkR lits W 1382 9 = true := by decide +kernel
theorem okM125 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 1 = true := okB1382
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 2 = true := blkChk_join _ _ _ _ _ 1382 1 1 h0 okB1383
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 3 = true := blkChk_join _ _ _ _ _ 1382 2 1 h1 okB1384
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 4 = true := blkChk_join _ _ _ _ _ 1382 3 1 h2 okB1385
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 5 = true := blkChk_join _ _ _ _ _ 1382 4 1 h3 okB1386
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 6 = true := blkChk_join _ _ _ _ _ 1382 5 1 h4 okB1387
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 7 = true := blkChk_join _ _ _ _ _ 1382 6 1 h5 okB1388
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 8 = true := blkChk_join _ _ _ _ _ 1382 7 1 h6 okB1389
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1382 9 = true := blkChk_join _ _ _ _ _ 1382 8 1 h7 okB1390
  exact h8
end E1.C382X
