module
public import R22Port.U_d41d8cd98f00
public import E1.C304X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C304X
open E1S
theorem okB353 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 353 1 = true := by decide +kernel
theorem okB354 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 354 1 = true := by decide +kernel
theorem okB355 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 355 1 = true := by decide +kernel
theorem okB356 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 356 1 = true := by decide +kernel
theorem okG36 : glueChkR lits W 353 4 = true := by decide +kernel
theorem okM36 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 353 4 = true := by
  have h0 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 353 1 = true := okB353
  have h1 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 353 2 = true := blkChk_join _ _ _ _ _ 353 1 1 h0 okB354
  have h2 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 353 3 = true := blkChk_join _ _ _ _ _ 353 2 1 h1 okB355
  have h3 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 353 4 = true := blkChk_join _ _ _ _ _ 353 3 1 h2 okB356
  exact h3
end E1.C304X
