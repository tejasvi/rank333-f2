module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3260 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 1 = true := by decide +kernel
theorem okB3261 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3261 1 = true := by decide +kernel
theorem okB3262 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3262 1 = true := by decide +kernel
theorem okB3263 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3263 1 = true := by decide +kernel
theorem okB3264 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3264 1 = true := by decide +kernel
theorem okB3265 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3265 1 = true := by decide +kernel
theorem okB3266 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3266 1 = true := by decide +kernel
theorem okB3267 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3267 1 = true := by decide +kernel
theorem okB3268 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3268 1 = true := by decide +kernel
theorem okB3269 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3269 1 = true := by decide +kernel
theorem okB3270 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3270 1 = true := by decide +kernel
theorem okG311 : glueChkR lits W 3260 11 = true := by decide +kernel
theorem okM311 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 1 = true := okB3260
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 2 = true := blkChk_join _ _ _ _ _ 3260 1 1 h0 okB3261
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 3 = true := blkChk_join _ _ _ _ _ 3260 2 1 h1 okB3262
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 4 = true := blkChk_join _ _ _ _ _ 3260 3 1 h2 okB3263
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 5 = true := blkChk_join _ _ _ _ _ 3260 4 1 h3 okB3264
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 6 = true := blkChk_join _ _ _ _ _ 3260 5 1 h4 okB3265
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 7 = true := blkChk_join _ _ _ _ _ 3260 6 1 h5 okB3266
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 8 = true := blkChk_join _ _ _ _ _ 3260 7 1 h6 okB3267
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 9 = true := blkChk_join _ _ _ _ _ 3260 8 1 h7 okB3268
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 10 = true := blkChk_join _ _ _ _ _ 3260 9 1 h8 okB3269
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3260 11 = true := blkChk_join _ _ _ _ _ 3260 10 1 h9 okB3270
  exact h10
end E1.C384X
