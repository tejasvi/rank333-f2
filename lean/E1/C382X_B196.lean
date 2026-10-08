module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2230 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 1 = true := by decide +kernel
theorem okB2231 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2231 1 = true := by decide +kernel
theorem okB2232 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2232 1 = true := by decide +kernel
theorem okB2233 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2233 1 = true := by decide +kernel
theorem okB2234 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2234 1 = true := by decide +kernel
theorem okB2235 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2235 1 = true := by decide +kernel
theorem okB2236 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2236 1 = true := by decide +kernel
theorem okB2237 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2237 1 = true := by decide +kernel
theorem okB2238 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2238 1 = true := by decide +kernel
theorem okG196 : glueChkR lits W 2230 9 = true := by decide +kernel
theorem okM196 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 1 = true := okB2230
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 2 = true := blkChk_join _ _ _ _ _ 2230 1 1 h0 okB2231
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 3 = true := blkChk_join _ _ _ _ _ 2230 2 1 h1 okB2232
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 4 = true := blkChk_join _ _ _ _ _ 2230 3 1 h2 okB2233
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 5 = true := blkChk_join _ _ _ _ _ 2230 4 1 h3 okB2234
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 6 = true := blkChk_join _ _ _ _ _ 2230 5 1 h4 okB2235
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 7 = true := blkChk_join _ _ _ _ _ 2230 6 1 h5 okB2236
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 8 = true := blkChk_join _ _ _ _ _ 2230 7 1 h6 okB2237
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2230 9 = true := blkChk_join _ _ _ _ _ 2230 8 1 h7 okB2238
  exact h8
end E1.C382X
