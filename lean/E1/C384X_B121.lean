module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1305 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 1 = true := by decide +kernel
theorem okB1306 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1306 1 = true := by decide +kernel
theorem okB1307 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1307 1 = true := by decide +kernel
theorem okB1308 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1308 1 = true := by decide +kernel
theorem okB1309 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1309 1 = true := by decide +kernel
theorem okB1310 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1310 1 = true := by decide +kernel
theorem okB1311 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1311 1 = true := by decide +kernel
theorem okB1312 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1312 1 = true := by decide +kernel
theorem okB1313 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1313 1 = true := by decide +kernel
theorem okB1314 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1314 1 = true := by decide +kernel
theorem okG121 : glueChkR lits W 1305 10 = true := by decide +kernel
theorem okM121 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 1 = true := okB1305
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 2 = true := blkChk_join _ _ _ _ _ 1305 1 1 h0 okB1306
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 3 = true := blkChk_join _ _ _ _ _ 1305 2 1 h1 okB1307
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 4 = true := blkChk_join _ _ _ _ _ 1305 3 1 h2 okB1308
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 5 = true := blkChk_join _ _ _ _ _ 1305 4 1 h3 okB1309
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 6 = true := blkChk_join _ _ _ _ _ 1305 5 1 h4 okB1310
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 7 = true := blkChk_join _ _ _ _ _ 1305 6 1 h5 okB1311
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 8 = true := blkChk_join _ _ _ _ _ 1305 7 1 h6 okB1312
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 9 = true := blkChk_join _ _ _ _ _ 1305 8 1 h7 okB1313
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1305 10 = true := blkChk_join _ _ _ _ _ 1305 9 1 h8 okB1314
  exact h9
end E1.C384X
