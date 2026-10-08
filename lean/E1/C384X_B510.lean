module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5328 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 1 = true := by decide +kernel
theorem okB5329 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5329 1 = true := by decide +kernel
theorem okB5330 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5330 1 = true := by decide +kernel
theorem okB5331 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5331 1 = true := by decide +kernel
theorem okB5332 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5332 1 = true := by decide +kernel
theorem okB5333 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5333 1 = true := by decide +kernel
theorem okB5334 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5334 1 = true := by decide +kernel
theorem okB5335 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5335 1 = true := by decide +kernel
theorem okB5336 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5336 1 = true := by decide +kernel
theorem okG510 : glueChkR lits W 5328 9 = true := by decide +kernel
theorem okM510 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 1 = true := okB5328
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 2 = true := blkChk_join _ _ _ _ _ 5328 1 1 h0 okB5329
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 3 = true := blkChk_join _ _ _ _ _ 5328 2 1 h1 okB5330
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 4 = true := blkChk_join _ _ _ _ _ 5328 3 1 h2 okB5331
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 5 = true := blkChk_join _ _ _ _ _ 5328 4 1 h3 okB5332
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 6 = true := blkChk_join _ _ _ _ _ 5328 5 1 h4 okB5333
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 7 = true := blkChk_join _ _ _ _ _ 5328 6 1 h5 okB5334
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 8 = true := blkChk_join _ _ _ _ _ 5328 7 1 h6 okB5335
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5328 9 = true := blkChk_join _ _ _ _ _ 5328 8 1 h7 okB5336
  exact h8
end E1.C384X
