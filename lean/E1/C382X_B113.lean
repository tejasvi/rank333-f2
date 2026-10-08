module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1272 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 1 = true := by decide +kernel
theorem okB1273 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1273 1 = true := by decide +kernel
theorem okB1274 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1274 1 = true := by decide +kernel
theorem okB1275 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1275 1 = true := by decide +kernel
theorem okB1276 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1276 1 = true := by decide +kernel
theorem okB1277 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1277 1 = true := by decide +kernel
theorem okB1278 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1278 1 = true := by decide +kernel
theorem okB1279 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1279 1 = true := by decide +kernel
theorem okB1280 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1280 1 = true := by decide +kernel
theorem okG113 : glueChkR lits W 1272 9 = true := by decide +kernel
theorem okM113 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 1 = true := okB1272
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 2 = true := blkChk_join _ _ _ _ _ 1272 1 1 h0 okB1273
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 3 = true := blkChk_join _ _ _ _ _ 1272 2 1 h1 okB1274
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 4 = true := blkChk_join _ _ _ _ _ 1272 3 1 h2 okB1275
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 5 = true := blkChk_join _ _ _ _ _ 1272 4 1 h3 okB1276
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 6 = true := blkChk_join _ _ _ _ _ 1272 5 1 h4 okB1277
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 7 = true := blkChk_join _ _ _ _ _ 1272 6 1 h5 okB1278
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 8 = true := blkChk_join _ _ _ _ _ 1272 7 1 h6 okB1279
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1272 9 = true := blkChk_join _ _ _ _ _ 1272 8 1 h7 okB1280
  exact h8
end E1.C382X
