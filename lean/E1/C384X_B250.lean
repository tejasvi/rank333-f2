module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2665 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 1 = true := by decide +kernel
theorem okB2666 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2666 1 = true := by decide +kernel
theorem okB2667 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2667 1 = true := by decide +kernel
theorem okB2668 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2668 1 = true := by decide +kernel
theorem okB2669 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2669 1 = true := by decide +kernel
theorem okB2670 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2670 1 = true := by decide +kernel
theorem okB2671 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2671 1 = true := by decide +kernel
theorem okB2672 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2672 1 = true := by decide +kernel
theorem okB2673 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2673 1 = true := by decide +kernel
theorem okB2674 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2674 1 = true := by decide +kernel
theorem okG250 : glueChkR lits W 2665 10 = true := by decide +kernel
theorem okM250 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 1 = true := okB2665
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 2 = true := blkChk_join _ _ _ _ _ 2665 1 1 h0 okB2666
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 3 = true := blkChk_join _ _ _ _ _ 2665 2 1 h1 okB2667
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 4 = true := blkChk_join _ _ _ _ _ 2665 3 1 h2 okB2668
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 5 = true := blkChk_join _ _ _ _ _ 2665 4 1 h3 okB2669
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 6 = true := blkChk_join _ _ _ _ _ 2665 5 1 h4 okB2670
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 7 = true := blkChk_join _ _ _ _ _ 2665 6 1 h5 okB2671
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 8 = true := blkChk_join _ _ _ _ _ 2665 7 1 h6 okB2672
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 9 = true := blkChk_join _ _ _ _ _ 2665 8 1 h7 okB2673
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2665 10 = true := blkChk_join _ _ _ _ _ 2665 9 1 h8 okB2674
  exact h9
end E1.C384X
