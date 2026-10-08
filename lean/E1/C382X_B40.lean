module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB436 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 1 = true := by decide +kernel
theorem okB437 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 437 1 = true := by decide +kernel
theorem okB438 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 438 1 = true := by decide +kernel
theorem okB439 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 439 1 = true := by decide +kernel
theorem okB440 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 440 1 = true := by decide +kernel
theorem okB441 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 441 1 = true := by decide +kernel
theorem okB442 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 442 1 = true := by decide +kernel
theorem okB443 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 443 1 = true := by decide +kernel
theorem okB444 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 444 1 = true := by decide +kernel
theorem okG40 : glueChkR lits W 436 9 = true := by decide +kernel
theorem okM40 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 1 = true := okB436
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 2 = true := blkChk_join _ _ _ _ _ 436 1 1 h0 okB437
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 3 = true := blkChk_join _ _ _ _ _ 436 2 1 h1 okB438
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 4 = true := blkChk_join _ _ _ _ _ 436 3 1 h2 okB439
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 5 = true := blkChk_join _ _ _ _ _ 436 4 1 h3 okB440
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 6 = true := blkChk_join _ _ _ _ _ 436 5 1 h4 okB441
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 7 = true := blkChk_join _ _ _ _ _ 436 6 1 h5 okB442
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 8 = true := blkChk_join _ _ _ _ _ 436 7 1 h6 okB443
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 436 9 = true := blkChk_join _ _ _ _ _ 436 8 1 h7 okB444
  exact h8
end E1.C382X
