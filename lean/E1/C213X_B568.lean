module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB6295 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 1 = true := by decide +kernel
theorem okB6296 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6296 1 = true := by decide +kernel
theorem okB6297 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6297 1 = true := by decide +kernel
theorem okB6298 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6298 1 = true := by decide +kernel
theorem okB6299 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6299 1 = true := by decide +kernel
theorem okB6300 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6300 1 = true := by decide +kernel
theorem okB6301 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6301 1 = true := by decide +kernel
theorem okB6302 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6302 1 = true := by decide +kernel
theorem okB6303 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6303 1 = true := by decide +kernel
theorem okB6304 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6304 1 = true := by decide +kernel
theorem okG568 : glueChkR lits W 6295 10 = true := by decide +kernel
theorem okM568 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 1 = true := okB6295
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 2 = true := blkChk_join _ _ _ _ _ 6295 1 1 h0 okB6296
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 3 = true := blkChk_join _ _ _ _ _ 6295 2 1 h1 okB6297
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 4 = true := blkChk_join _ _ _ _ _ 6295 3 1 h2 okB6298
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 5 = true := blkChk_join _ _ _ _ _ 6295 4 1 h3 okB6299
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 6 = true := blkChk_join _ _ _ _ _ 6295 5 1 h4 okB6300
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 7 = true := blkChk_join _ _ _ _ _ 6295 6 1 h5 okB6301
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 8 = true := blkChk_join _ _ _ _ _ 6295 7 1 h6 okB6302
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 9 = true := blkChk_join _ _ _ _ _ 6295 8 1 h7 okB6303
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6295 10 = true := blkChk_join _ _ _ _ _ 6295 9 1 h8 okB6304
  exact h9
end E1.C213X
