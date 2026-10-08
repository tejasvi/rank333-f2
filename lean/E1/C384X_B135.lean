module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1456 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 1 = true := by decide +kernel
theorem okB1457 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1457 1 = true := by decide +kernel
theorem okB1458 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1458 1 = true := by decide +kernel
theorem okB1459 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1459 1 = true := by decide +kernel
theorem okB1460 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1460 1 = true := by decide +kernel
theorem okB1461 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1461 1 = true := by decide +kernel
theorem okB1462 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1462 1 = true := by decide +kernel
theorem okB1463 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1463 1 = true := by decide +kernel
theorem okB1464 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1464 1 = true := by decide +kernel
theorem okG135 : glueChkR lits W 1456 9 = true := by decide +kernel
theorem okM135 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 1 = true := okB1456
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 2 = true := blkChk_join _ _ _ _ _ 1456 1 1 h0 okB1457
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 3 = true := blkChk_join _ _ _ _ _ 1456 2 1 h1 okB1458
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 4 = true := blkChk_join _ _ _ _ _ 1456 3 1 h2 okB1459
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 5 = true := blkChk_join _ _ _ _ _ 1456 4 1 h3 okB1460
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 6 = true := blkChk_join _ _ _ _ _ 1456 5 1 h4 okB1461
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 7 = true := blkChk_join _ _ _ _ _ 1456 6 1 h5 okB1462
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 8 = true := blkChk_join _ _ _ _ _ 1456 7 1 h6 okB1463
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1456 9 = true := blkChk_join _ _ _ _ _ 1456 8 1 h7 okB1464
  exact h8
end E1.C384X
