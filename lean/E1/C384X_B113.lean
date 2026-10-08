module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1217 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 1 = true := by decide +kernel
theorem okB1218 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1218 1 = true := by decide +kernel
theorem okB1219 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1219 1 = true := by decide +kernel
theorem okB1220 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1220 1 = true := by decide +kernel
theorem okB1221 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1221 1 = true := by decide +kernel
theorem okB1222 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1222 1 = true := by decide +kernel
theorem okB1223 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1223 1 = true := by decide +kernel
theorem okB1224 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1224 1 = true := by decide +kernel
theorem okB1225 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1225 1 = true := by decide +kernel
theorem okB1226 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1226 1 = true := by decide +kernel
theorem okB1227 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1227 1 = true := by decide +kernel
theorem okB1228 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1228 1 = true := by decide +kernel
theorem okG113 : glueChkR lits W 1217 12 = true := by decide +kernel
theorem okM113 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 1 = true := okB1217
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 2 = true := blkChk_join _ _ _ _ _ 1217 1 1 h0 okB1218
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 3 = true := blkChk_join _ _ _ _ _ 1217 2 1 h1 okB1219
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 4 = true := blkChk_join _ _ _ _ _ 1217 3 1 h2 okB1220
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 5 = true := blkChk_join _ _ _ _ _ 1217 4 1 h3 okB1221
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 6 = true := blkChk_join _ _ _ _ _ 1217 5 1 h4 okB1222
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 7 = true := blkChk_join _ _ _ _ _ 1217 6 1 h5 okB1223
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 8 = true := blkChk_join _ _ _ _ _ 1217 7 1 h6 okB1224
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 9 = true := blkChk_join _ _ _ _ _ 1217 8 1 h7 okB1225
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 10 = true := blkChk_join _ _ _ _ _ 1217 9 1 h8 okB1226
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 11 = true := blkChk_join _ _ _ _ _ 1217 10 1 h9 okB1227
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1217 12 = true := blkChk_join _ _ _ _ _ 1217 11 1 h10 okB1228
  exact h11
end E1.C384X
