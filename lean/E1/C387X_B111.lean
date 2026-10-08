module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB1205 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 1 = true := by decide +kernel
theorem okB1206 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1206 1 = true := by decide +kernel
theorem okB1207 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1207 1 = true := by decide +kernel
theorem okB1208 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1208 1 = true := by decide +kernel
theorem okB1209 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1209 1 = true := by decide +kernel
theorem okB1210 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1210 1 = true := by decide +kernel
theorem okB1211 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1211 1 = true := by decide +kernel
theorem okB1212 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1212 1 = true := by decide +kernel
theorem okB1213 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1213 1 = true := by decide +kernel
theorem okB1214 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1214 1 = true := by decide +kernel
theorem okB1215 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1215 1 = true := by decide +kernel
theorem okG111 : glueChkR lits W 1205 11 = true := by decide +kernel
theorem okM111 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 11 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 1 = true := okB1205
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 2 = true := blkChk_join _ _ _ _ _ 1205 1 1 h0 okB1206
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 3 = true := blkChk_join _ _ _ _ _ 1205 2 1 h1 okB1207
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 4 = true := blkChk_join _ _ _ _ _ 1205 3 1 h2 okB1208
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 5 = true := blkChk_join _ _ _ _ _ 1205 4 1 h3 okB1209
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 6 = true := blkChk_join _ _ _ _ _ 1205 5 1 h4 okB1210
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 7 = true := blkChk_join _ _ _ _ _ 1205 6 1 h5 okB1211
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 8 = true := blkChk_join _ _ _ _ _ 1205 7 1 h6 okB1212
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 9 = true := blkChk_join _ _ _ _ _ 1205 8 1 h7 okB1213
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 10 = true := blkChk_join _ _ _ _ _ 1205 9 1 h8 okB1214
  have h10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1205 11 = true := blkChk_join _ _ _ _ _ 1205 10 1 h9 okB1215
  exact h10
end E1.C387X
