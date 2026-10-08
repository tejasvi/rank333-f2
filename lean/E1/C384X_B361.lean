module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3760 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 1 = true := by decide +kernel
theorem okB3761 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3761 1 = true := by decide +kernel
theorem okB3762 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3762 1 = true := by decide +kernel
theorem okB3763 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3763 1 = true := by decide +kernel
theorem okB3764 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3764 1 = true := by decide +kernel
theorem okB3765 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3765 1 = true := by decide +kernel
theorem okB3766 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3766 1 = true := by decide +kernel
theorem okB3767 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3767 1 = true := by decide +kernel
theorem okB3768 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3768 1 = true := by decide +kernel
theorem okB3769 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3769 1 = true := by decide +kernel
theorem okB3770 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3770 1 = true := by decide +kernel
theorem okG361 : glueChkR lits W 3760 11 = true := by decide +kernel
theorem okM361 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 1 = true := okB3760
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 2 = true := blkChk_join _ _ _ _ _ 3760 1 1 h0 okB3761
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 3 = true := blkChk_join _ _ _ _ _ 3760 2 1 h1 okB3762
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 4 = true := blkChk_join _ _ _ _ _ 3760 3 1 h2 okB3763
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 5 = true := blkChk_join _ _ _ _ _ 3760 4 1 h3 okB3764
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 6 = true := blkChk_join _ _ _ _ _ 3760 5 1 h4 okB3765
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 7 = true := blkChk_join _ _ _ _ _ 3760 6 1 h5 okB3766
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 8 = true := blkChk_join _ _ _ _ _ 3760 7 1 h6 okB3767
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 9 = true := blkChk_join _ _ _ _ _ 3760 8 1 h7 okB3768
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 10 = true := blkChk_join _ _ _ _ _ 3760 9 1 h8 okB3769
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3760 11 = true := blkChk_join _ _ _ _ _ 3760 10 1 h9 okB3770
  exact h10
end E1.C384X
