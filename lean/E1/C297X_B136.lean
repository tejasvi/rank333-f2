module
public import R22Port.U_d41d8cd98f00
public import E1.C297X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C297X
open E1S
theorem okB1511 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 1 = true := by decide +kernel
theorem okB1512 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1512 1 = true := by decide +kernel
theorem okB1513 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1513 1 = true := by decide +kernel
theorem okB1514 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1514 1 = true := by decide +kernel
theorem okB1515 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1515 1 = true := by decide +kernel
theorem okB1516 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1516 1 = true := by decide +kernel
theorem okB1517 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1517 1 = true := by decide +kernel
theorem okB1518 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1518 1 = true := by decide +kernel
theorem okB1519 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1519 1 = true := by decide +kernel
theorem okB1520 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1520 1 = true := by decide +kernel
theorem okG136 : glueChkR lits W 1511 10 = true := by decide +kernel
theorem okM136 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 10 = true := by
  have h0 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 1 = true := okB1511
  have h1 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 2 = true := blkChk_join _ _ _ _ _ 1511 1 1 h0 okB1512
  have h2 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 3 = true := blkChk_join _ _ _ _ _ 1511 2 1 h1 okB1513
  have h3 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 4 = true := blkChk_join _ _ _ _ _ 1511 3 1 h2 okB1514
  have h4 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 5 = true := blkChk_join _ _ _ _ _ 1511 4 1 h3 okB1515
  have h5 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 6 = true := blkChk_join _ _ _ _ _ 1511 5 1 h4 okB1516
  have h6 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 7 = true := blkChk_join _ _ _ _ _ 1511 6 1 h5 okB1517
  have h7 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 8 = true := blkChk_join _ _ _ _ _ 1511 7 1 h6 okB1518
  have h8 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 9 = true := blkChk_join _ _ _ _ _ 1511 8 1 h7 okB1519
  have h9 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1511 10 = true := blkChk_join _ _ _ _ _ 1511 9 1 h8 okB1520
  exact h9
end E1.C297X
