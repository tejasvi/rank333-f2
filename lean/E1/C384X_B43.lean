module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB434 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 1 = true := by decide +kernel
theorem okB435 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 435 1 = true := by decide +kernel
theorem okB436 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 436 1 = true := by decide +kernel
theorem okB437 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 437 1 = true := by decide +kernel
theorem okB438 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 438 1 = true := by decide +kernel
theorem okB439 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 439 1 = true := by decide +kernel
theorem okB440 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 440 1 = true := by decide +kernel
theorem okB441 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 441 1 = true := by decide +kernel
theorem okB442 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 442 1 = true := by decide +kernel
theorem okG43 : glueChkR lits W 434 9 = true := by decide +kernel
theorem okM43 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 1 = true := okB434
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 2 = true := blkChk_join _ _ _ _ _ 434 1 1 h0 okB435
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 3 = true := blkChk_join _ _ _ _ _ 434 2 1 h1 okB436
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 4 = true := blkChk_join _ _ _ _ _ 434 3 1 h2 okB437
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 5 = true := blkChk_join _ _ _ _ _ 434 4 1 h3 okB438
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 6 = true := blkChk_join _ _ _ _ _ 434 5 1 h4 okB439
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 7 = true := blkChk_join _ _ _ _ _ 434 6 1 h5 okB440
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 8 = true := blkChk_join _ _ _ _ _ 434 7 1 h6 okB441
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 434 9 = true := blkChk_join _ _ _ _ _ 434 8 1 h7 okB442
  exact h8
end E1.C384X
