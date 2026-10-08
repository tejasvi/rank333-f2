module
public import R22Port.U_d41d8cd98f00
public import E1.C297X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C297X
open E1S
theorem okB1534 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 1 = true := by decide +kernel
theorem okB1535 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1535 1 = true := by decide +kernel
theorem okB1536 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1536 1 = true := by decide +kernel
theorem okB1537 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1537 1 = true := by decide +kernel
theorem okB1538 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1538 1 = true := by decide +kernel
theorem okB1539 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1539 1 = true := by decide +kernel
theorem okB1540 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1540 1 = true := by decide +kernel
theorem okB1541 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1541 1 = true := by decide +kernel
theorem okG138 : glueChkR lits W 1534 8 = true := by decide +kernel
theorem okM138 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 8 = true := by
  have h0 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 1 = true := okB1534
  have h1 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 2 = true := blkChk_join _ _ _ _ _ 1534 1 1 h0 okB1535
  have h2 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 3 = true := blkChk_join _ _ _ _ _ 1534 2 1 h1 okB1536
  have h3 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 4 = true := blkChk_join _ _ _ _ _ 1534 3 1 h2 okB1537
  have h4 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 5 = true := blkChk_join _ _ _ _ _ 1534 4 1 h3 okB1538
  have h5 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 6 = true := blkChk_join _ _ _ _ _ 1534 5 1 h4 okB1539
  have h6 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 7 = true := blkChk_join _ _ _ _ _ 1534 6 1 h5 okB1540
  have h7 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 1534 8 = true := blkChk_join _ _ _ _ _ 1534 7 1 h6 okB1541
  exact h7
end E1.C297X
