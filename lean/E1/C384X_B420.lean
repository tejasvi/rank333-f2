module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4403 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 1 = true := by decide +kernel
theorem okB4404 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4404 1 = true := by decide +kernel
theorem okB4405 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4405 1 = true := by decide +kernel
theorem okB4406 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4406 1 = true := by decide +kernel
theorem okB4407 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4407 1 = true := by decide +kernel
theorem okB4408 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4408 1 = true := by decide +kernel
theorem okB4409 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4409 1 = true := by decide +kernel
theorem okB4410 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4410 1 = true := by decide +kernel
theorem okG420 : glueChkR lits W 4403 8 = true := by decide +kernel
theorem okM420 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 1 = true := okB4403
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 2 = true := blkChk_join _ _ _ _ _ 4403 1 1 h0 okB4404
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 3 = true := blkChk_join _ _ _ _ _ 4403 2 1 h1 okB4405
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 4 = true := blkChk_join _ _ _ _ _ 4403 3 1 h2 okB4406
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 5 = true := blkChk_join _ _ _ _ _ 4403 4 1 h3 okB4407
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 6 = true := blkChk_join _ _ _ _ _ 4403 5 1 h4 okB4408
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 7 = true := blkChk_join _ _ _ _ _ 4403 6 1 h5 okB4409
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4403 8 = true := blkChk_join _ _ _ _ _ 4403 7 1 h6 okB4410
  exact h7
end E1.C384X
