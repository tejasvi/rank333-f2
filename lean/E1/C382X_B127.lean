module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1401 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 1 = true := by decide +kernel
theorem okB1402 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1402 1 = true := by decide +kernel
theorem okB1403 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1403 1 = true := by decide +kernel
theorem okB1404 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1404 1 = true := by decide +kernel
theorem okB1405 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1405 1 = true := by decide +kernel
theorem okB1406 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1406 1 = true := by decide +kernel
theorem okB1407 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1407 1 = true := by decide +kernel
theorem okB1408 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1408 1 = true := by decide +kernel
theorem okB1409 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1409 1 = true := by decide +kernel
theorem okG127 : glueChkR lits W 1401 9 = true := by decide +kernel
theorem okM127 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 1 = true := okB1401
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 2 = true := blkChk_join _ _ _ _ _ 1401 1 1 h0 okB1402
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 3 = true := blkChk_join _ _ _ _ _ 1401 2 1 h1 okB1403
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 4 = true := blkChk_join _ _ _ _ _ 1401 3 1 h2 okB1404
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 5 = true := blkChk_join _ _ _ _ _ 1401 4 1 h3 okB1405
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 6 = true := blkChk_join _ _ _ _ _ 1401 5 1 h4 okB1406
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 7 = true := blkChk_join _ _ _ _ _ 1401 6 1 h5 okB1407
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 8 = true := blkChk_join _ _ _ _ _ 1401 7 1 h6 okB1408
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1401 9 = true := blkChk_join _ _ _ _ _ 1401 8 1 h7 okB1409
  exact h8
end E1.C382X
