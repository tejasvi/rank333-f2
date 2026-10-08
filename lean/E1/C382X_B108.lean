module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1230 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 1 = true := by decide +kernel
theorem okB1231 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1231 1 = true := by decide +kernel
theorem okB1232 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1232 1 = true := by decide +kernel
theorem okB1233 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1233 1 = true := by decide +kernel
theorem okB1234 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1234 1 = true := by decide +kernel
theorem okB1235 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1235 1 = true := by decide +kernel
theorem okB1236 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1236 1 = true := by decide +kernel
theorem okB1237 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1237 1 = true := by decide +kernel
theorem okB1238 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1238 1 = true := by decide +kernel
theorem okB1239 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1239 1 = true := by decide +kernel
theorem okB1240 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1240 1 = true := by decide +kernel
theorem okB1241 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1241 1 = true := by decide +kernel
theorem okG108 : glueChkR lits W 1230 12 = true := by decide +kernel
theorem okM108 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 1 = true := okB1230
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 2 = true := blkChk_join _ _ _ _ _ 1230 1 1 h0 okB1231
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 3 = true := blkChk_join _ _ _ _ _ 1230 2 1 h1 okB1232
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 4 = true := blkChk_join _ _ _ _ _ 1230 3 1 h2 okB1233
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 5 = true := blkChk_join _ _ _ _ _ 1230 4 1 h3 okB1234
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 6 = true := blkChk_join _ _ _ _ _ 1230 5 1 h4 okB1235
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 7 = true := blkChk_join _ _ _ _ _ 1230 6 1 h5 okB1236
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 8 = true := blkChk_join _ _ _ _ _ 1230 7 1 h6 okB1237
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 9 = true := blkChk_join _ _ _ _ _ 1230 8 1 h7 okB1238
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 10 = true := blkChk_join _ _ _ _ _ 1230 9 1 h8 okB1239
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 11 = true := blkChk_join _ _ _ _ _ 1230 10 1 h9 okB1240
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1230 12 = true := blkChk_join _ _ _ _ _ 1230 11 1 h10 okB1241
  exact h11
end E1.C382X
