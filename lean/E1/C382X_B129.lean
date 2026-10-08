module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1425 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 1 = true := by decide +kernel
theorem okB1426 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1426 1 = true := by decide +kernel
theorem okB1427 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1427 1 = true := by decide +kernel
theorem okB1428 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1428 1 = true := by decide +kernel
theorem okB1429 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1429 1 = true := by decide +kernel
theorem okB1430 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1430 1 = true := by decide +kernel
theorem okB1431 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1431 1 = true := by decide +kernel
theorem okB1432 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1432 1 = true := by decide +kernel
theorem okB1433 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1433 1 = true := by decide +kernel
theorem okB1434 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1434 1 = true := by decide +kernel
theorem okG129 : glueChkR lits W 1425 10 = true := by decide +kernel
theorem okM129 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 1 = true := okB1425
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 2 = true := blkChk_join _ _ _ _ _ 1425 1 1 h0 okB1426
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 3 = true := blkChk_join _ _ _ _ _ 1425 2 1 h1 okB1427
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 4 = true := blkChk_join _ _ _ _ _ 1425 3 1 h2 okB1428
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 5 = true := blkChk_join _ _ _ _ _ 1425 4 1 h3 okB1429
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 6 = true := blkChk_join _ _ _ _ _ 1425 5 1 h4 okB1430
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 7 = true := blkChk_join _ _ _ _ _ 1425 6 1 h5 okB1431
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 8 = true := blkChk_join _ _ _ _ _ 1425 7 1 h6 okB1432
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 9 = true := blkChk_join _ _ _ _ _ 1425 8 1 h7 okB1433
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1425 10 = true := blkChk_join _ _ _ _ _ 1425 9 1 h8 okB1434
  exact h9
end E1.C382X
