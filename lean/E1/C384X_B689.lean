module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB7037 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 1 = true := by decide +kernel
theorem okB7038 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7038 1 = true := by decide +kernel
theorem okB7039 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7039 1 = true := by decide +kernel
theorem okB7040 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7040 1 = true := by decide +kernel
theorem okB7041 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7041 1 = true := by decide +kernel
theorem okB7042 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7042 1 = true := by decide +kernel
theorem okB7043 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7043 1 = true := by decide +kernel
theorem okB7044 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7044 1 = true := by decide +kernel
theorem okG689 : glueChkR lits W 7037 8 = true := by decide +kernel
theorem okM689 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 1 = true := okB7037
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 2 = true := blkChk_join _ _ _ _ _ 7037 1 1 h0 okB7038
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 3 = true := blkChk_join _ _ _ _ _ 7037 2 1 h1 okB7039
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 4 = true := blkChk_join _ _ _ _ _ 7037 3 1 h2 okB7040
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 5 = true := blkChk_join _ _ _ _ _ 7037 4 1 h3 okB7041
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 6 = true := blkChk_join _ _ _ _ _ 7037 5 1 h4 okB7042
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 7 = true := blkChk_join _ _ _ _ _ 7037 6 1 h5 okB7043
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7037 8 = true := blkChk_join _ _ _ _ _ 7037 7 1 h6 okB7044
  exact h7
end E1.C384X
