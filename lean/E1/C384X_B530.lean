module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5528 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 1 = true := by decide +kernel
theorem okB5529 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5529 1 = true := by decide +kernel
theorem okB5530 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5530 1 = true := by decide +kernel
theorem okB5531 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5531 1 = true := by decide +kernel
theorem okB5532 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5532 1 = true := by decide +kernel
theorem okB5533 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5533 1 = true := by decide +kernel
theorem okB5534 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5534 1 = true := by decide +kernel
theorem okB5535 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5535 1 = true := by decide +kernel
theorem okB5536 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5536 1 = true := by decide +kernel
theorem okG530 : glueChkR lits W 5528 9 = true := by decide +kernel
theorem okM530 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 1 = true := okB5528
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 2 = true := blkChk_join _ _ _ _ _ 5528 1 1 h0 okB5529
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 3 = true := blkChk_join _ _ _ _ _ 5528 2 1 h1 okB5530
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 4 = true := blkChk_join _ _ _ _ _ 5528 3 1 h2 okB5531
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 5 = true := blkChk_join _ _ _ _ _ 5528 4 1 h3 okB5532
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 6 = true := blkChk_join _ _ _ _ _ 5528 5 1 h4 okB5533
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 7 = true := blkChk_join _ _ _ _ _ 5528 6 1 h5 okB5534
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 8 = true := blkChk_join _ _ _ _ _ 5528 7 1 h6 okB5535
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5528 9 = true := blkChk_join _ _ _ _ _ 5528 8 1 h7 okB5536
  exact h8
end E1.C384X
