module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB5318 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 1 = true := by decide +kernel
theorem okB5319 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5319 1 = true := by decide +kernel
theorem okB5320 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5320 1 = true := by decide +kernel
theorem okB5321 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5321 1 = true := by decide +kernel
theorem okB5322 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5322 1 = true := by decide +kernel
theorem okB5323 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5323 1 = true := by decide +kernel
theorem okB5324 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5324 1 = true := by decide +kernel
theorem okB5325 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5325 1 = true := by decide +kernel
theorem okG512 : glueChkR lits W 5318 8 = true := by decide +kernel
theorem okM512 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 8 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 1 = true := okB5318
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 2 = true := blkChk_join _ _ _ _ _ 5318 1 1 h0 okB5319
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 3 = true := blkChk_join _ _ _ _ _ 5318 2 1 h1 okB5320
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 4 = true := blkChk_join _ _ _ _ _ 5318 3 1 h2 okB5321
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 5 = true := blkChk_join _ _ _ _ _ 5318 4 1 h3 okB5322
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 6 = true := blkChk_join _ _ _ _ _ 5318 5 1 h4 okB5323
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 7 = true := blkChk_join _ _ _ _ _ 5318 6 1 h5 okB5324
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5318 8 = true := blkChk_join _ _ _ _ _ 5318 7 1 h6 okB5325
  exact h7
end E1.C394X
