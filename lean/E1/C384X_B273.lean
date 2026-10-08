module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2882 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 1 = true := by decide +kernel
theorem okB2883 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2883 1 = true := by decide +kernel
theorem okB2884 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2884 1 = true := by decide +kernel
theorem okB2885 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2885 1 = true := by decide +kernel
theorem okB2886 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2886 1 = true := by decide +kernel
theorem okB2887 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2887 1 = true := by decide +kernel
theorem okB2888 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2888 1 = true := by decide +kernel
theorem okB2889 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2889 1 = true := by decide +kernel
theorem okG273 : glueChkR lits W 2882 8 = true := by decide +kernel
theorem okM273 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 1 = true := okB2882
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 2 = true := blkChk_join _ _ _ _ _ 2882 1 1 h0 okB2883
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 3 = true := blkChk_join _ _ _ _ _ 2882 2 1 h1 okB2884
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 4 = true := blkChk_join _ _ _ _ _ 2882 3 1 h2 okB2885
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 5 = true := blkChk_join _ _ _ _ _ 2882 4 1 h3 okB2886
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 6 = true := blkChk_join _ _ _ _ _ 2882 5 1 h4 okB2887
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 7 = true := blkChk_join _ _ _ _ _ 2882 6 1 h5 okB2888
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2882 8 = true := blkChk_join _ _ _ _ _ 2882 7 1 h6 okB2889
  exact h7
end E1.C384X
