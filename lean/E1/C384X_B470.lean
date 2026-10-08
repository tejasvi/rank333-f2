module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4898 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 1 = true := by decide +kernel
theorem okB4899 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4899 1 = true := by decide +kernel
theorem okB4900 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4900 1 = true := by decide +kernel
theorem okB4901 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4901 1 = true := by decide +kernel
theorem okB4902 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4902 1 = true := by decide +kernel
theorem okB4903 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4903 1 = true := by decide +kernel
theorem okB4904 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4904 1 = true := by decide +kernel
theorem okB4905 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4905 1 = true := by decide +kernel
theorem okG470 : glueChkR lits W 4898 8 = true := by decide +kernel
theorem okM470 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 1 = true := okB4898
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 2 = true := blkChk_join _ _ _ _ _ 4898 1 1 h0 okB4899
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 3 = true := blkChk_join _ _ _ _ _ 4898 2 1 h1 okB4900
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 4 = true := blkChk_join _ _ _ _ _ 4898 3 1 h2 okB4901
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 5 = true := blkChk_join _ _ _ _ _ 4898 4 1 h3 okB4902
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 6 = true := blkChk_join _ _ _ _ _ 4898 5 1 h4 okB4903
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 7 = true := blkChk_join _ _ _ _ _ 4898 6 1 h5 okB4904
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4898 8 = true := blkChk_join _ _ _ _ _ 4898 7 1 h6 okB4905
  exact h7
end E1.C384X
