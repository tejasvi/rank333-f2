module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB5389 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 1 = true := by decide +kernel
theorem okB5390 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5390 1 = true := by decide +kernel
theorem okB5391 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5391 1 = true := by decide +kernel
theorem okB5392 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5392 1 = true := by decide +kernel
theorem okB5393 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5393 1 = true := by decide +kernel
theorem okB5394 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5394 1 = true := by decide +kernel
theorem okB5395 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5395 1 = true := by decide +kernel
theorem okG520 : glueChkR lits W 5389 7 = true := by decide +kernel
theorem okM520 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 7 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 1 = true := okB5389
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 2 = true := blkChk_join _ _ _ _ _ 5389 1 1 h0 okB5390
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 3 = true := blkChk_join _ _ _ _ _ 5389 2 1 h1 okB5391
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 4 = true := blkChk_join _ _ _ _ _ 5389 3 1 h2 okB5392
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 5 = true := blkChk_join _ _ _ _ _ 5389 4 1 h3 okB5393
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 6 = true := blkChk_join _ _ _ _ _ 5389 5 1 h4 okB5394
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5389 7 = true := blkChk_join _ _ _ _ _ 5389 6 1 h5 okB5395
  exact h6
end E1.C394X
