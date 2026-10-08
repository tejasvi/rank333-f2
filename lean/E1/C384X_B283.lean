module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2981 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 1 = true := by decide +kernel
theorem okB2982 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2982 1 = true := by decide +kernel
theorem okB2983 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2983 1 = true := by decide +kernel
theorem okB2984 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2984 1 = true := by decide +kernel
theorem okB2985 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2985 1 = true := by decide +kernel
theorem okB2986 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2986 1 = true := by decide +kernel
theorem okB2987 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2987 1 = true := by decide +kernel
theorem okB2988 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2988 1 = true := by decide +kernel
theorem okG283 : glueChkR lits W 2981 8 = true := by decide +kernel
theorem okM283 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 1 = true := okB2981
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 2 = true := blkChk_join _ _ _ _ _ 2981 1 1 h0 okB2982
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 3 = true := blkChk_join _ _ _ _ _ 2981 2 1 h1 okB2983
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 4 = true := blkChk_join _ _ _ _ _ 2981 3 1 h2 okB2984
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 5 = true := blkChk_join _ _ _ _ _ 2981 4 1 h3 okB2985
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 6 = true := blkChk_join _ _ _ _ _ 2981 5 1 h4 okB2986
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 7 = true := blkChk_join _ _ _ _ _ 2981 6 1 h5 okB2987
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2981 8 = true := blkChk_join _ _ _ _ _ 2981 7 1 h6 okB2988
  exact h7
end E1.C384X
