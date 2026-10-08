module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB3383 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 1 = true := by decide +kernel
theorem okB3384 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3384 1 = true := by decide +kernel
theorem okB3385 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3385 1 = true := by decide +kernel
theorem okB3386 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3386 1 = true := by decide +kernel
theorem okB3387 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3387 1 = true := by decide +kernel
theorem okB3388 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3388 1 = true := by decide +kernel
theorem okB3389 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3389 1 = true := by decide +kernel
theorem okB3390 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3390 1 = true := by decide +kernel
theorem okB3391 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3391 1 = true := by decide +kernel
theorem okB3392 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3392 1 = true := by decide +kernel
theorem okG320 : glueChkR lits W 3383 10 = true := by decide +kernel
theorem okM320 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 1 = true := okB3383
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 2 = true := blkChk_join _ _ _ _ _ 3383 1 1 h0 okB3384
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 3 = true := blkChk_join _ _ _ _ _ 3383 2 1 h1 okB3385
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 4 = true := blkChk_join _ _ _ _ _ 3383 3 1 h2 okB3386
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 5 = true := blkChk_join _ _ _ _ _ 3383 4 1 h3 okB3387
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 6 = true := blkChk_join _ _ _ _ _ 3383 5 1 h4 okB3388
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 7 = true := blkChk_join _ _ _ _ _ 3383 6 1 h5 okB3389
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 8 = true := blkChk_join _ _ _ _ _ 3383 7 1 h6 okB3390
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 9 = true := blkChk_join _ _ _ _ _ 3383 8 1 h7 okB3391
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3383 10 = true := blkChk_join _ _ _ _ _ 3383 9 1 h8 okB3392
  exact h9
end E1.C213X
