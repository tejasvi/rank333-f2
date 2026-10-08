module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB1202 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 1 = true := by decide +kernel
theorem okB1203 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1203 1 = true := by decide +kernel
theorem okB1204 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1204 1 = true := by decide +kernel
theorem okB1205 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1205 1 = true := by decide +kernel
theorem okB1206 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1206 1 = true := by decide +kernel
theorem okB1207 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1207 1 = true := by decide +kernel
theorem okB1208 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1208 1 = true := by decide +kernel
theorem okB1209 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1209 1 = true := by decide +kernel
theorem okB1210 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1210 1 = true := by decide +kernel
theorem okB1211 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1211 1 = true := by decide +kernel
theorem okG107 : glueChkR lits W 1202 10 = true := by decide +kernel
theorem okM107 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 1 = true := okB1202
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 2 = true := blkChk_join _ _ _ _ _ 1202 1 1 h0 okB1203
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 3 = true := blkChk_join _ _ _ _ _ 1202 2 1 h1 okB1204
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 4 = true := blkChk_join _ _ _ _ _ 1202 3 1 h2 okB1205
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 5 = true := blkChk_join _ _ _ _ _ 1202 4 1 h3 okB1206
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 6 = true := blkChk_join _ _ _ _ _ 1202 5 1 h4 okB1207
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 7 = true := blkChk_join _ _ _ _ _ 1202 6 1 h5 okB1208
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 8 = true := blkChk_join _ _ _ _ _ 1202 7 1 h6 okB1209
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 9 = true := blkChk_join _ _ _ _ _ 1202 8 1 h7 okB1210
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1202 10 = true := blkChk_join _ _ _ _ _ 1202 9 1 h8 okB1211
  exact h9
end E1.C213X
