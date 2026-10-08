module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB234 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 1 = true := by decide +kernel
theorem okB235 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 235 1 = true := by decide +kernel
theorem okB236 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 236 1 = true := by decide +kernel
theorem okB237 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 237 1 = true := by decide +kernel
theorem okB238 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 238 1 = true := by decide +kernel
theorem okB239 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 239 1 = true := by decide +kernel
theorem okB240 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 240 1 = true := by decide +kernel
theorem okB241 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 241 1 = true := by decide +kernel
theorem okG21 : glueChkR lits W 234 8 = true := by decide +kernel
theorem okM21 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 8 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 1 = true := okB234
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 2 = true := blkChk_join _ _ _ _ _ 234 1 1 h0 okB235
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 3 = true := blkChk_join _ _ _ _ _ 234 2 1 h1 okB236
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 4 = true := blkChk_join _ _ _ _ _ 234 3 1 h2 okB237
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 5 = true := blkChk_join _ _ _ _ _ 234 4 1 h3 okB238
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 6 = true := blkChk_join _ _ _ _ _ 234 5 1 h4 okB239
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 7 = true := blkChk_join _ _ _ _ _ 234 6 1 h5 okB240
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 234 8 = true := blkChk_join _ _ _ _ _ 234 7 1 h6 okB241
  exact h7
end E1.C395X
