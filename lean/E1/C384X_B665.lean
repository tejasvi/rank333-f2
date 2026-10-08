module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6823 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 1 = true := by decide +kernel
theorem okB6824 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6824 1 = true := by decide +kernel
theorem okB6825 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6825 1 = true := by decide +kernel
theorem okB6826 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6826 1 = true := by decide +kernel
theorem okB6827 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6827 1 = true := by decide +kernel
theorem okB6828 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6828 1 = true := by decide +kernel
theorem okB6829 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6829 1 = true := by decide +kernel
theorem okB6830 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6830 1 = true := by decide +kernel
theorem okG665 : glueChkR lits W 6823 8 = true := by decide +kernel
theorem okM665 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 1 = true := okB6823
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 2 = true := blkChk_join _ _ _ _ _ 6823 1 1 h0 okB6824
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 3 = true := blkChk_join _ _ _ _ _ 6823 2 1 h1 okB6825
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 4 = true := blkChk_join _ _ _ _ _ 6823 3 1 h2 okB6826
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 5 = true := blkChk_join _ _ _ _ _ 6823 4 1 h3 okB6827
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 6 = true := blkChk_join _ _ _ _ _ 6823 5 1 h4 okB6828
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 7 = true := blkChk_join _ _ _ _ _ 6823 6 1 h5 okB6829
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6823 8 = true := blkChk_join _ _ _ _ _ 6823 7 1 h6 okB6830
  exact h7
end E1.C384X
