module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB261 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 1 = true := by decide +kernel
theorem okB262 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 262 1 = true := by decide +kernel
theorem okB263 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 263 1 = true := by decide +kernel
theorem okB264 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 264 1 = true := by decide +kernel
theorem okB265 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 265 1 = true := by decide +kernel
theorem okB266 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 266 1 = true := by decide +kernel
theorem okB267 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 267 1 = true := by decide +kernel
theorem okB268 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 268 1 = true := by decide +kernel
theorem okB269 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 269 1 = true := by decide +kernel
theorem okB270 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 270 1 = true := by decide +kernel
theorem okB271 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 271 1 = true := by decide +kernel
theorem okB272 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 272 1 = true := by decide +kernel
theorem okG24 : glueChkR lits W 261 12 = true := by decide +kernel
theorem okM24 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 12 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 1 = true := okB261
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 2 = true := blkChk_join _ _ _ _ _ 261 1 1 h0 okB262
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 3 = true := blkChk_join _ _ _ _ _ 261 2 1 h1 okB263
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 4 = true := blkChk_join _ _ _ _ _ 261 3 1 h2 okB264
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 5 = true := blkChk_join _ _ _ _ _ 261 4 1 h3 okB265
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 6 = true := blkChk_join _ _ _ _ _ 261 5 1 h4 okB266
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 7 = true := blkChk_join _ _ _ _ _ 261 6 1 h5 okB267
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 8 = true := blkChk_join _ _ _ _ _ 261 7 1 h6 okB268
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 9 = true := blkChk_join _ _ _ _ _ 261 8 1 h7 okB269
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 10 = true := blkChk_join _ _ _ _ _ 261 9 1 h8 okB270
  have h10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 11 = true := blkChk_join _ _ _ _ _ 261 10 1 h9 okB271
  have h11 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 261 12 = true := blkChk_join _ _ _ _ _ 261 11 1 h10 okB272
  exact h11
end E1.C387X
