module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2541 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 1 = true := by decide +kernel
theorem okB2542 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2542 1 = true := by decide +kernel
theorem okB2543 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2543 1 = true := by decide +kernel
theorem okB2544 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2544 1 = true := by decide +kernel
theorem okB2545 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2545 1 = true := by decide +kernel
theorem okB2546 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2546 1 = true := by decide +kernel
theorem okB2547 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2547 1 = true := by decide +kernel
theorem okB2548 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2548 1 = true := by decide +kernel
theorem okB2549 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2549 1 = true := by decide +kernel
theorem okB2550 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2550 1 = true := by decide +kernel
theorem okG238 : glueChkR lits W 2541 10 = true := by decide +kernel
theorem okM238 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 1 = true := okB2541
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 2 = true := blkChk_join _ _ _ _ _ 2541 1 1 h0 okB2542
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 3 = true := blkChk_join _ _ _ _ _ 2541 2 1 h1 okB2543
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 4 = true := blkChk_join _ _ _ _ _ 2541 3 1 h2 okB2544
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 5 = true := blkChk_join _ _ _ _ _ 2541 4 1 h3 okB2545
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 6 = true := blkChk_join _ _ _ _ _ 2541 5 1 h4 okB2546
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 7 = true := blkChk_join _ _ _ _ _ 2541 6 1 h5 okB2547
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 8 = true := blkChk_join _ _ _ _ _ 2541 7 1 h6 okB2548
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 9 = true := blkChk_join _ _ _ _ _ 2541 8 1 h7 okB2549
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2541 10 = true := blkChk_join _ _ _ _ _ 2541 9 1 h8 okB2550
  exact h9
end E1.C384X
