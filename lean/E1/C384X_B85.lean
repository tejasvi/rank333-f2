module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB891 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 1 = true := by decide +kernel
theorem okB892 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 892 1 = true := by decide +kernel
theorem okB893 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 893 1 = true := by decide +kernel
theorem okB894 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 894 1 = true := by decide +kernel
theorem okB895 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 895 1 = true := by decide +kernel
theorem okB896 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 896 1 = true := by decide +kernel
theorem okB897 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 897 1 = true := by decide +kernel
theorem okB898 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 898 1 = true := by decide +kernel
theorem okB899 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 899 1 = true := by decide +kernel
theorem okG85 : glueChkR lits W 891 9 = true := by decide +kernel
theorem okM85 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 1 = true := okB891
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 2 = true := blkChk_join _ _ _ _ _ 891 1 1 h0 okB892
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 3 = true := blkChk_join _ _ _ _ _ 891 2 1 h1 okB893
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 4 = true := blkChk_join _ _ _ _ _ 891 3 1 h2 okB894
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 5 = true := blkChk_join _ _ _ _ _ 891 4 1 h3 okB895
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 6 = true := blkChk_join _ _ _ _ _ 891 5 1 h4 okB896
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 7 = true := blkChk_join _ _ _ _ _ 891 6 1 h5 okB897
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 8 = true := blkChk_join _ _ _ _ _ 891 7 1 h6 okB898
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 891 9 = true := blkChk_join _ _ _ _ _ 891 8 1 h7 okB899
  exact h8
end E1.C384X
