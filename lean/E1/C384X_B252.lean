module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2687 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 1 = true := by decide +kernel
theorem okB2688 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2688 1 = true := by decide +kernel
theorem okB2689 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2689 1 = true := by decide +kernel
theorem okB2690 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2690 1 = true := by decide +kernel
theorem okB2691 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2691 1 = true := by decide +kernel
theorem okB2692 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2692 1 = true := by decide +kernel
theorem okB2693 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2693 1 = true := by decide +kernel
theorem okB2694 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2694 1 = true := by decide +kernel
theorem okG252 : glueChkR lits W 2687 8 = true := by decide +kernel
theorem okM252 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 1 = true := okB2687
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 2 = true := blkChk_join _ _ _ _ _ 2687 1 1 h0 okB2688
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 3 = true := blkChk_join _ _ _ _ _ 2687 2 1 h1 okB2689
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 4 = true := blkChk_join _ _ _ _ _ 2687 3 1 h2 okB2690
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 5 = true := blkChk_join _ _ _ _ _ 2687 4 1 h3 okB2691
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 6 = true := blkChk_join _ _ _ _ _ 2687 5 1 h4 okB2692
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 7 = true := blkChk_join _ _ _ _ _ 2687 6 1 h5 okB2693
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2687 8 = true := blkChk_join _ _ _ _ _ 2687 7 1 h6 okB2694
  exact h7
end E1.C384X
