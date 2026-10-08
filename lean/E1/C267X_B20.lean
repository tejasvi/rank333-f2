module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB230 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 1 = true := by decide +kernel
theorem okB231 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 231 1 = true := by decide +kernel
theorem okB232 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 232 1 = true := by decide +kernel
theorem okB233 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 233 1 = true := by decide +kernel
theorem okB234 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 234 1 = true := by decide +kernel
theorem okB235 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 235 1 = true := by decide +kernel
theorem okB236 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 236 1 = true := by decide +kernel
theorem okB237 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 237 1 = true := by decide +kernel
theorem okB238 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 238 1 = true := by decide +kernel
theorem okB239 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 239 1 = true := by decide +kernel
theorem okG20 : glueChkR lits W 230 10 = true := by decide +kernel
theorem okM20 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 10 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 1 = true := okB230
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 2 = true := blkChk_join _ _ _ _ _ 230 1 1 h0 okB231
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 3 = true := blkChk_join _ _ _ _ _ 230 2 1 h1 okB232
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 4 = true := blkChk_join _ _ _ _ _ 230 3 1 h2 okB233
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 5 = true := blkChk_join _ _ _ _ _ 230 4 1 h3 okB234
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 6 = true := blkChk_join _ _ _ _ _ 230 5 1 h4 okB235
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 7 = true := blkChk_join _ _ _ _ _ 230 6 1 h5 okB236
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 8 = true := blkChk_join _ _ _ _ _ 230 7 1 h6 okB237
  have h8 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 9 = true := blkChk_join _ _ _ _ _ 230 8 1 h7 okB238
  have h9 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 230 10 = true := blkChk_join _ _ _ _ _ 230 9 1 h8 okB239
  exact h9
end E1.C267X
