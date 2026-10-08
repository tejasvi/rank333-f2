module
public import R22Port.U_d41d8cd98f00
public import E1.C207X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C207X
open E1S
theorem okB1211 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 1 = true := by decide +kernel
theorem okB1212 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1212 1 = true := by decide +kernel
theorem okB1213 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1213 1 = true := by decide +kernel
theorem okB1214 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1214 1 = true := by decide +kernel
theorem okB1215 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1215 1 = true := by decide +kernel
theorem okB1216 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1216 1 = true := by decide +kernel
theorem okB1217 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1217 1 = true := by decide +kernel
theorem okB1218 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1218 1 = true := by decide +kernel
theorem okB1219 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1219 1 = true := by decide +kernel
theorem okB1220 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1220 1 = true := by decide +kernel
theorem okG101 : glueChkR lits W 1211 10 = true := by decide +kernel
theorem okM101 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 10 = true := by
  have h0 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 1 = true := okB1211
  have h1 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 2 = true := blkChk_join _ _ _ _ _ 1211 1 1 h0 okB1212
  have h2 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 3 = true := blkChk_join _ _ _ _ _ 1211 2 1 h1 okB1213
  have h3 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 4 = true := blkChk_join _ _ _ _ _ 1211 3 1 h2 okB1214
  have h4 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 5 = true := blkChk_join _ _ _ _ _ 1211 4 1 h3 okB1215
  have h5 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 6 = true := blkChk_join _ _ _ _ _ 1211 5 1 h4 okB1216
  have h6 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 7 = true := blkChk_join _ _ _ _ _ 1211 6 1 h5 okB1217
  have h7 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 8 = true := blkChk_join _ _ _ _ _ 1211 7 1 h6 okB1218
  have h8 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 9 = true := blkChk_join _ _ _ _ _ 1211 8 1 h7 okB1219
  have h9 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1211 10 = true := blkChk_join _ _ _ _ _ 1211 9 1 h8 okB1220
  exact h9
end E1.C207X
