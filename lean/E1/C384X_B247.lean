module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2639 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 1 = true := by decide +kernel
theorem okB2640 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2640 1 = true := by decide +kernel
theorem okB2641 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2641 1 = true := by decide +kernel
theorem okB2642 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2642 1 = true := by decide +kernel
theorem okB2643 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2643 1 = true := by decide +kernel
theorem okB2644 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2644 1 = true := by decide +kernel
theorem okB2645 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2645 1 = true := by decide +kernel
theorem okB2646 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2646 1 = true := by decide +kernel
theorem okG247 : glueChkR lits W 2639 8 = true := by decide +kernel
theorem okM247 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 1 = true := okB2639
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 2 = true := blkChk_join _ _ _ _ _ 2639 1 1 h0 okB2640
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 3 = true := blkChk_join _ _ _ _ _ 2639 2 1 h1 okB2641
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 4 = true := blkChk_join _ _ _ _ _ 2639 3 1 h2 okB2642
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 5 = true := blkChk_join _ _ _ _ _ 2639 4 1 h3 okB2643
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 6 = true := blkChk_join _ _ _ _ _ 2639 5 1 h4 okB2644
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 7 = true := blkChk_join _ _ _ _ _ 2639 6 1 h5 okB2645
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2639 8 = true := blkChk_join _ _ _ _ _ 2639 7 1 h6 okB2646
  exact h7
end E1.C384X
