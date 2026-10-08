module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB262 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 1 = true := by decide +kernel
theorem okB263 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 263 1 = true := by decide +kernel
theorem okB264 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 264 1 = true := by decide +kernel
theorem okB265 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 265 1 = true := by decide +kernel
theorem okB266 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 266 1 = true := by decide +kernel
theorem okB267 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 267 1 = true := by decide +kernel
theorem okB268 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 268 1 = true := by decide +kernel
theorem okB269 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 269 1 = true := by decide +kernel
theorem okG25 : glueChkR lits W 262 8 = true := by decide +kernel
theorem okM25 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 1 = true := okB262
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 2 = true := blkChk_join _ _ _ _ _ 262 1 1 h0 okB263
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 3 = true := blkChk_join _ _ _ _ _ 262 2 1 h1 okB264
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 4 = true := blkChk_join _ _ _ _ _ 262 3 1 h2 okB265
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 5 = true := blkChk_join _ _ _ _ _ 262 4 1 h3 okB266
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 6 = true := blkChk_join _ _ _ _ _ 262 5 1 h4 okB267
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 7 = true := blkChk_join _ _ _ _ _ 262 6 1 h5 okB268
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 262 8 = true := blkChk_join _ _ _ _ _ 262 7 1 h6 okB269
  exact h7
end E1.C384X
