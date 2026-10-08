module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB270 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 1 = true := by decide +kernel
theorem okB271 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 271 1 = true := by decide +kernel
theorem okB272 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 272 1 = true := by decide +kernel
theorem okB273 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 273 1 = true := by decide +kernel
theorem okB274 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 274 1 = true := by decide +kernel
theorem okB275 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 275 1 = true := by decide +kernel
theorem okB276 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 276 1 = true := by decide +kernel
theorem okB277 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 277 1 = true := by decide +kernel
theorem okB278 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 278 1 = true := by decide +kernel
theorem okG25 : glueChkR lits W 270 9 = true := by decide +kernel
theorem okM25 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 1 = true := okB270
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 2 = true := blkChk_join _ _ _ _ _ 270 1 1 h0 okB271
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 3 = true := blkChk_join _ _ _ _ _ 270 2 1 h1 okB272
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 4 = true := blkChk_join _ _ _ _ _ 270 3 1 h2 okB273
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 5 = true := blkChk_join _ _ _ _ _ 270 4 1 h3 okB274
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 6 = true := blkChk_join _ _ _ _ _ 270 5 1 h4 okB275
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 7 = true := blkChk_join _ _ _ _ _ 270 6 1 h5 okB276
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 8 = true := blkChk_join _ _ _ _ _ 270 7 1 h6 okB277
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 270 9 = true := blkChk_join _ _ _ _ _ 270 8 1 h7 okB278
  exact h8
end E1.C382X
