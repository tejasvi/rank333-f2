module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB5300 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 1 = true := by decide +kernel
theorem okB5301 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5301 1 = true := by decide +kernel
theorem okB5302 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5302 1 = true := by decide +kernel
theorem okB5303 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5303 1 = true := by decide +kernel
theorem okB5304 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5304 1 = true := by decide +kernel
theorem okB5305 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5305 1 = true := by decide +kernel
theorem okB5306 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5306 1 = true := by decide +kernel
theorem okB5307 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5307 1 = true := by decide +kernel
theorem okG510 : glueChkR lits W 5300 8 = true := by decide +kernel
theorem okM510 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 8 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 1 = true := okB5300
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 2 = true := blkChk_join _ _ _ _ _ 5300 1 1 h0 okB5301
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 3 = true := blkChk_join _ _ _ _ _ 5300 2 1 h1 okB5302
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 4 = true := blkChk_join _ _ _ _ _ 5300 3 1 h2 okB5303
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 5 = true := blkChk_join _ _ _ _ _ 5300 4 1 h3 okB5304
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 6 = true := blkChk_join _ _ _ _ _ 5300 5 1 h4 okB5305
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 7 = true := blkChk_join _ _ _ _ _ 5300 6 1 h5 okB5306
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5300 8 = true := blkChk_join _ _ _ _ _ 5300 7 1 h6 okB5307
  exact h7
end E1.C394X
