module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1391 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 1 = true := by decide +kernel
theorem okB1392 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1392 1 = true := by decide +kernel
theorem okB1393 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1393 1 = true := by decide +kernel
theorem okB1394 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1394 1 = true := by decide +kernel
theorem okB1395 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1395 1 = true := by decide +kernel
theorem okB1396 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1396 1 = true := by decide +kernel
theorem okB1397 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1397 1 = true := by decide +kernel
theorem okB1398 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1398 1 = true := by decide +kernel
theorem okB1399 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1399 1 = true := by decide +kernel
theorem okB1400 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1400 1 = true := by decide +kernel
theorem okG126 : glueChkR lits W 1391 10 = true := by decide +kernel
theorem okM126 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 1 = true := okB1391
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 2 = true := blkChk_join _ _ _ _ _ 1391 1 1 h0 okB1392
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 3 = true := blkChk_join _ _ _ _ _ 1391 2 1 h1 okB1393
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 4 = true := blkChk_join _ _ _ _ _ 1391 3 1 h2 okB1394
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 5 = true := blkChk_join _ _ _ _ _ 1391 4 1 h3 okB1395
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 6 = true := blkChk_join _ _ _ _ _ 1391 5 1 h4 okB1396
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 7 = true := blkChk_join _ _ _ _ _ 1391 6 1 h5 okB1397
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 8 = true := blkChk_join _ _ _ _ _ 1391 7 1 h6 okB1398
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 9 = true := blkChk_join _ _ _ _ _ 1391 8 1 h7 okB1399
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1391 10 = true := blkChk_join _ _ _ _ _ 1391 9 1 h8 okB1400
  exact h9
end E1.C382X
