module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1470 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 1 = true := by decide +kernel
theorem okB1471 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1471 1 = true := by decide +kernel
theorem okB1472 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1472 1 = true := by decide +kernel
theorem okB1473 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1473 1 = true := by decide +kernel
theorem okB1474 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1474 1 = true := by decide +kernel
theorem okB1475 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1475 1 = true := by decide +kernel
theorem okB1476 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1476 1 = true := by decide +kernel
theorem okB1477 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1477 1 = true := by decide +kernel
theorem okB1478 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1478 1 = true := by decide +kernel
theorem okB1479 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1479 1 = true := by decide +kernel
theorem okB1480 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1480 1 = true := by decide +kernel
theorem okB1481 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1481 1 = true := by decide +kernel
theorem okB1482 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1482 1 = true := by decide +kernel
theorem okG134 : glueChkR lits W 1470 13 = true := by decide +kernel
theorem okM134 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 13 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 1 = true := okB1470
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 2 = true := blkChk_join _ _ _ _ _ 1470 1 1 h0 okB1471
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 3 = true := blkChk_join _ _ _ _ _ 1470 2 1 h1 okB1472
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 4 = true := blkChk_join _ _ _ _ _ 1470 3 1 h2 okB1473
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 5 = true := blkChk_join _ _ _ _ _ 1470 4 1 h3 okB1474
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 6 = true := blkChk_join _ _ _ _ _ 1470 5 1 h4 okB1475
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 7 = true := blkChk_join _ _ _ _ _ 1470 6 1 h5 okB1476
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 8 = true := blkChk_join _ _ _ _ _ 1470 7 1 h6 okB1477
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 9 = true := blkChk_join _ _ _ _ _ 1470 8 1 h7 okB1478
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 10 = true := blkChk_join _ _ _ _ _ 1470 9 1 h8 okB1479
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 11 = true := blkChk_join _ _ _ _ _ 1470 10 1 h9 okB1480
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 12 = true := blkChk_join _ _ _ _ _ 1470 11 1 h10 okB1481
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1470 13 = true := blkChk_join _ _ _ _ _ 1470 12 1 h11 okB1482
  exact h12
end E1.C382X
