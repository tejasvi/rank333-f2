module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5423 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 1 = true := by decide +kernel
theorem okB5424 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5424 1 = true := by decide +kernel
theorem okB5425 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5425 1 = true := by decide +kernel
theorem okB5426 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5426 1 = true := by decide +kernel
theorem okB5427 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5427 1 = true := by decide +kernel
theorem okB5428 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5428 1 = true := by decide +kernel
theorem okB5429 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5429 1 = true := by decide +kernel
theorem okB5430 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5430 1 = true := by decide +kernel
theorem okB5431 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5431 1 = true := by decide +kernel
theorem okG519 : glueChkR lits W 5423 9 = true := by decide +kernel
theorem okM519 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 1 = true := okB5423
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 2 = true := blkChk_join _ _ _ _ _ 5423 1 1 h0 okB5424
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 3 = true := blkChk_join _ _ _ _ _ 5423 2 1 h1 okB5425
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 4 = true := blkChk_join _ _ _ _ _ 5423 3 1 h2 okB5426
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 5 = true := blkChk_join _ _ _ _ _ 5423 4 1 h3 okB5427
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 6 = true := blkChk_join _ _ _ _ _ 5423 5 1 h4 okB5428
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 7 = true := blkChk_join _ _ _ _ _ 5423 6 1 h5 okB5429
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 8 = true := blkChk_join _ _ _ _ _ 5423 7 1 h6 okB5430
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5423 9 = true := blkChk_join _ _ _ _ _ 5423 8 1 h7 okB5431
  exact h8
end E1.C384X
