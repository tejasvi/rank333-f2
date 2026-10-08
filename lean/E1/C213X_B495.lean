module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB5421 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 1 = true := by decide +kernel
theorem okB5422 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5422 1 = true := by decide +kernel
theorem okB5423 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5423 1 = true := by decide +kernel
theorem okB5424 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5424 1 = true := by decide +kernel
theorem okB5425 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5425 1 = true := by decide +kernel
theorem okB5426 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5426 1 = true := by decide +kernel
theorem okB5427 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5427 1 = true := by decide +kernel
theorem okB5428 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5428 1 = true := by decide +kernel
theorem okG495 : glueChkR lits W 5421 8 = true := by decide +kernel
theorem okM495 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 8 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 1 = true := okB5421
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 2 = true := blkChk_join _ _ _ _ _ 5421 1 1 h0 okB5422
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 3 = true := blkChk_join _ _ _ _ _ 5421 2 1 h1 okB5423
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 4 = true := blkChk_join _ _ _ _ _ 5421 3 1 h2 okB5424
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 5 = true := blkChk_join _ _ _ _ _ 5421 4 1 h3 okB5425
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 6 = true := blkChk_join _ _ _ _ _ 5421 5 1 h4 okB5426
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 7 = true := blkChk_join _ _ _ _ _ 5421 6 1 h5 okB5427
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5421 8 = true := blkChk_join _ _ _ _ _ 5421 7 1 h6 okB5428
  exact h7
end E1.C213X
