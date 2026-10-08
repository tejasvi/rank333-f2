module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB563 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 1 = true := by decide +kernel
theorem okB564 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 564 1 = true := by decide +kernel
theorem okB565 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 565 1 = true := by decide +kernel
theorem okB566 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 566 1 = true := by decide +kernel
theorem okB567 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 567 1 = true := by decide +kernel
theorem okB568 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 568 1 = true := by decide +kernel
theorem okB569 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 569 1 = true := by decide +kernel
theorem okB570 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 570 1 = true := by decide +kernel
theorem okB571 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 571 1 = true := by decide +kernel
theorem okB572 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 572 1 = true := by decide +kernel
theorem okG55 : glueChkR lits W 563 10 = true := by decide +kernel
theorem okM55 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 1 = true := okB563
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 2 = true := blkChk_join _ _ _ _ _ 563 1 1 h0 okB564
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 3 = true := blkChk_join _ _ _ _ _ 563 2 1 h1 okB565
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 4 = true := blkChk_join _ _ _ _ _ 563 3 1 h2 okB566
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 5 = true := blkChk_join _ _ _ _ _ 563 4 1 h3 okB567
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 6 = true := blkChk_join _ _ _ _ _ 563 5 1 h4 okB568
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 7 = true := blkChk_join _ _ _ _ _ 563 6 1 h5 okB569
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 8 = true := blkChk_join _ _ _ _ _ 563 7 1 h6 okB570
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 9 = true := blkChk_join _ _ _ _ _ 563 8 1 h7 okB571
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 563 10 = true := blkChk_join _ _ _ _ _ 563 9 1 h8 okB572
  exact h9
end E1.C384X
