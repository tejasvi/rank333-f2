module
public import R22Port.U_d41d8cd98f00
public import E1.C237X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C237X
open E1S
theorem okB309 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 1 = true := by decide +kernel
theorem okB310 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 310 1 = true := by decide +kernel
theorem okB311 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 311 1 = true := by decide +kernel
theorem okB312 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 312 1 = true := by decide +kernel
theorem okB313 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 313 1 = true := by decide +kernel
theorem okB314 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 314 1 = true := by decide +kernel
theorem okB315 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 315 1 = true := by decide +kernel
theorem okB316 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 316 1 = true := by decide +kernel
theorem okG27 : glueChkR lits W 309 8 = true := by decide +kernel
theorem okM27 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 8 = true := by
  have h0 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 1 = true := okB309
  have h1 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 2 = true := blkChk_join _ _ _ _ _ 309 1 1 h0 okB310
  have h2 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 3 = true := blkChk_join _ _ _ _ _ 309 2 1 h1 okB311
  have h3 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 4 = true := blkChk_join _ _ _ _ _ 309 3 1 h2 okB312
  have h4 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 5 = true := blkChk_join _ _ _ _ _ 309 4 1 h3 okB313
  have h5 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 6 = true := blkChk_join _ _ _ _ _ 309 5 1 h4 okB314
  have h6 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 7 = true := blkChk_join _ _ _ _ _ 309 6 1 h5 okB315
  have h7 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 309 8 = true := blkChk_join _ _ _ _ _ 309 7 1 h6 okB316
  exact h7
end E1.C237X
