module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2714 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 1 = true := by decide +kernel
theorem okB2715 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2715 1 = true := by decide +kernel
theorem okB2716 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2716 1 = true := by decide +kernel
theorem okB2717 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2717 1 = true := by decide +kernel
theorem okB2718 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2718 1 = true := by decide +kernel
theorem okB2719 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2719 1 = true := by decide +kernel
theorem okB2720 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2720 1 = true := by decide +kernel
theorem okB2721 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2721 1 = true := by decide +kernel
theorem okB2722 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2722 1 = true := by decide +kernel
theorem okB2723 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2723 1 = true := by decide +kernel
theorem okG255 : glueChkR lits W 2714 10 = true := by decide +kernel
theorem okM255 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 1 = true := okB2714
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 2 = true := blkChk_join _ _ _ _ _ 2714 1 1 h0 okB2715
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 3 = true := blkChk_join _ _ _ _ _ 2714 2 1 h1 okB2716
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 4 = true := blkChk_join _ _ _ _ _ 2714 3 1 h2 okB2717
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 5 = true := blkChk_join _ _ _ _ _ 2714 4 1 h3 okB2718
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 6 = true := blkChk_join _ _ _ _ _ 2714 5 1 h4 okB2719
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 7 = true := blkChk_join _ _ _ _ _ 2714 6 1 h5 okB2720
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 8 = true := blkChk_join _ _ _ _ _ 2714 7 1 h6 okB2721
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 9 = true := blkChk_join _ _ _ _ _ 2714 8 1 h7 okB2722
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2714 10 = true := blkChk_join _ _ _ _ _ 2714 9 1 h8 okB2723
  exact h9
end E1.C384X
