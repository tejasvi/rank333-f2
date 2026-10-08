module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1354 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 1 = true := by decide +kernel
theorem okB1355 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1355 1 = true := by decide +kernel
theorem okB1356 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1356 1 = true := by decide +kernel
theorem okB1357 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1357 1 = true := by decide +kernel
theorem okB1358 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1358 1 = true := by decide +kernel
theorem okB1359 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1359 1 = true := by decide +kernel
theorem okB1360 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1360 1 = true := by decide +kernel
theorem okB1361 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1361 1 = true := by decide +kernel
theorem okB1362 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1362 1 = true := by decide +kernel
theorem okB1363 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1363 1 = true := by decide +kernel
theorem okB1364 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1364 1 = true := by decide +kernel
theorem okG121 : glueChkR lits W 1354 11 = true := by decide +kernel
theorem okM121 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 11 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 1 = true := okB1354
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 2 = true := blkChk_join _ _ _ _ _ 1354 1 1 h0 okB1355
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 3 = true := blkChk_join _ _ _ _ _ 1354 2 1 h1 okB1356
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 4 = true := blkChk_join _ _ _ _ _ 1354 3 1 h2 okB1357
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 5 = true := blkChk_join _ _ _ _ _ 1354 4 1 h3 okB1358
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 6 = true := blkChk_join _ _ _ _ _ 1354 5 1 h4 okB1359
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 7 = true := blkChk_join _ _ _ _ _ 1354 6 1 h5 okB1360
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 8 = true := blkChk_join _ _ _ _ _ 1354 7 1 h6 okB1361
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 9 = true := blkChk_join _ _ _ _ _ 1354 8 1 h7 okB1362
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 10 = true := blkChk_join _ _ _ _ _ 1354 9 1 h8 okB1363
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1354 11 = true := blkChk_join _ _ _ _ _ 1354 10 1 h9 okB1364
  exact h10
end E1.C382X
