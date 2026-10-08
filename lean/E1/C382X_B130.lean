module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1435 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 1 = true := by decide +kernel
theorem okB1436 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1436 1 = true := by decide +kernel
theorem okB1437 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1437 1 = true := by decide +kernel
theorem okB1438 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1438 1 = true := by decide +kernel
theorem okB1439 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1439 1 = true := by decide +kernel
theorem okB1440 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1440 1 = true := by decide +kernel
theorem okB1441 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1441 1 = true := by decide +kernel
theorem okB1442 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1442 1 = true := by decide +kernel
theorem okG130 : glueChkR lits W 1435 8 = true := by decide +kernel
theorem okM130 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 1 = true := okB1435
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 2 = true := blkChk_join _ _ _ _ _ 1435 1 1 h0 okB1436
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 3 = true := blkChk_join _ _ _ _ _ 1435 2 1 h1 okB1437
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 4 = true := blkChk_join _ _ _ _ _ 1435 3 1 h2 okB1438
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 5 = true := blkChk_join _ _ _ _ _ 1435 4 1 h3 okB1439
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 6 = true := blkChk_join _ _ _ _ _ 1435 5 1 h4 okB1440
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 7 = true := blkChk_join _ _ _ _ _ 1435 6 1 h5 okB1441
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1435 8 = true := blkChk_join _ _ _ _ _ 1435 7 1 h6 okB1442
  exact h7
end E1.C382X
