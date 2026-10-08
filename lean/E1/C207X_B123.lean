module
public import R22Port.U_d41d8cd98f00
public import E1.C207X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C207X
open E1S
theorem okB1440 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 1 = true := by decide +kernel
theorem okB1441 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1441 1 = true := by decide +kernel
theorem okB1442 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1442 1 = true := by decide +kernel
theorem okB1443 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1443 1 = true := by decide +kernel
theorem okB1444 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1444 1 = true := by decide +kernel
theorem okB1445 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1445 1 = true := by decide +kernel
theorem okB1446 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1446 1 = true := by decide +kernel
theorem okB1447 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1447 1 = true := by decide +kernel
theorem okB1448 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1448 1 = true := by decide +kernel
theorem okB1449 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1449 1 = true := by decide +kernel
theorem okB1450 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1450 1 = true := by decide +kernel
theorem okB1451 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1451 1 = true := by decide +kernel
theorem okG123 : glueChkR lits W 1440 12 = true := by decide +kernel
theorem okM123 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 12 = true := by
  have h0 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 1 = true := okB1440
  have h1 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 2 = true := blkChk_join _ _ _ _ _ 1440 1 1 h0 okB1441
  have h2 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 3 = true := blkChk_join _ _ _ _ _ 1440 2 1 h1 okB1442
  have h3 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 4 = true := blkChk_join _ _ _ _ _ 1440 3 1 h2 okB1443
  have h4 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 5 = true := blkChk_join _ _ _ _ _ 1440 4 1 h3 okB1444
  have h5 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 6 = true := blkChk_join _ _ _ _ _ 1440 5 1 h4 okB1445
  have h6 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 7 = true := blkChk_join _ _ _ _ _ 1440 6 1 h5 okB1446
  have h7 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 8 = true := blkChk_join _ _ _ _ _ 1440 7 1 h6 okB1447
  have h8 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 9 = true := blkChk_join _ _ _ _ _ 1440 8 1 h7 okB1448
  have h9 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 10 = true := blkChk_join _ _ _ _ _ 1440 9 1 h8 okB1449
  have h10 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 11 = true := blkChk_join _ _ _ _ _ 1440 10 1 h9 okB1450
  have h11 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1440 12 = true := blkChk_join _ _ _ _ _ 1440 11 1 h10 okB1451
  exact h11
end E1.C207X
