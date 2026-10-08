module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB1216 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 1 = true := by decide +kernel
theorem okB1217 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1217 1 = true := by decide +kernel
theorem okB1218 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1218 1 = true := by decide +kernel
theorem okB1219 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1219 1 = true := by decide +kernel
theorem okB1220 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1220 1 = true := by decide +kernel
theorem okB1221 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1221 1 = true := by decide +kernel
theorem okB1222 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1222 1 = true := by decide +kernel
theorem okB1223 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1223 1 = true := by decide +kernel
theorem okB1224 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1224 1 = true := by decide +kernel
theorem okB1225 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1225 1 = true := by decide +kernel
theorem okB1226 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1226 1 = true := by decide +kernel
theorem okG112 : glueChkR lits W 1216 11 = true := by decide +kernel
theorem okM112 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 11 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 1 = true := okB1216
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 2 = true := blkChk_join _ _ _ _ _ 1216 1 1 h0 okB1217
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 3 = true := blkChk_join _ _ _ _ _ 1216 2 1 h1 okB1218
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 4 = true := blkChk_join _ _ _ _ _ 1216 3 1 h2 okB1219
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 5 = true := blkChk_join _ _ _ _ _ 1216 4 1 h3 okB1220
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 6 = true := blkChk_join _ _ _ _ _ 1216 5 1 h4 okB1221
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 7 = true := blkChk_join _ _ _ _ _ 1216 6 1 h5 okB1222
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 8 = true := blkChk_join _ _ _ _ _ 1216 7 1 h6 okB1223
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 9 = true := blkChk_join _ _ _ _ _ 1216 8 1 h7 okB1224
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 10 = true := blkChk_join _ _ _ _ _ 1216 9 1 h8 okB1225
  have h10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1216 11 = true := blkChk_join _ _ _ _ _ 1216 10 1 h9 okB1226
  exact h10
end E1.C387X
