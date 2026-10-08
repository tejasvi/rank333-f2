module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1296 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 1 = true := by decide +kernel
theorem okB1297 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1297 1 = true := by decide +kernel
theorem okB1298 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1298 1 = true := by decide +kernel
theorem okB1299 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1299 1 = true := by decide +kernel
theorem okB1300 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1300 1 = true := by decide +kernel
theorem okB1301 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1301 1 = true := by decide +kernel
theorem okB1302 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1302 1 = true := by decide +kernel
theorem okB1303 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1303 1 = true := by decide +kernel
theorem okB1304 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1304 1 = true := by decide +kernel
theorem okG120 : glueChkR lits W 1296 9 = true := by decide +kernel
theorem okM120 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 1 = true := okB1296
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 2 = true := blkChk_join _ _ _ _ _ 1296 1 1 h0 okB1297
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 3 = true := blkChk_join _ _ _ _ _ 1296 2 1 h1 okB1298
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 4 = true := blkChk_join _ _ _ _ _ 1296 3 1 h2 okB1299
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 5 = true := blkChk_join _ _ _ _ _ 1296 4 1 h3 okB1300
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 6 = true := blkChk_join _ _ _ _ _ 1296 5 1 h4 okB1301
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 7 = true := blkChk_join _ _ _ _ _ 1296 6 1 h5 okB1302
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 8 = true := blkChk_join _ _ _ _ _ 1296 7 1 h6 okB1303
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1296 9 = true := blkChk_join _ _ _ _ _ 1296 8 1 h7 okB1304
  exact h8
end E1.C384X
