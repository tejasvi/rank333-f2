module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB1286 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 1 = true := by decide +kernel
theorem okB1287 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1287 1 = true := by decide +kernel
theorem okB1288 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1288 1 = true := by decide +kernel
theorem okB1289 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1289 1 = true := by decide +kernel
theorem okB1290 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1290 1 = true := by decide +kernel
theorem okB1291 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1291 1 = true := by decide +kernel
theorem okB1292 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1292 1 = true := by decide +kernel
theorem okB1293 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1293 1 = true := by decide +kernel
theorem okB1294 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1294 1 = true := by decide +kernel
theorem okB1295 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1295 1 = true := by decide +kernel
theorem okG117 : glueChkR lits W 1286 10 = true := by decide +kernel
theorem okM117 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 1 = true := okB1286
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 2 = true := blkChk_join _ _ _ _ _ 1286 1 1 h0 okB1287
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 3 = true := blkChk_join _ _ _ _ _ 1286 2 1 h1 okB1288
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 4 = true := blkChk_join _ _ _ _ _ 1286 3 1 h2 okB1289
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 5 = true := blkChk_join _ _ _ _ _ 1286 4 1 h3 okB1290
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 6 = true := blkChk_join _ _ _ _ _ 1286 5 1 h4 okB1291
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 7 = true := blkChk_join _ _ _ _ _ 1286 6 1 h5 okB1292
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 8 = true := blkChk_join _ _ _ _ _ 1286 7 1 h6 okB1293
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 9 = true := blkChk_join _ _ _ _ _ 1286 8 1 h7 okB1294
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1286 10 = true := blkChk_join _ _ _ _ _ 1286 9 1 h8 okB1295
  exact h9
end E1.C213X
