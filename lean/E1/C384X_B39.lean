module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB384 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 1 = true := by decide +kernel
theorem okB385 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 385 1 = true := by decide +kernel
theorem okB386 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 386 1 = true := by decide +kernel
theorem okB387 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 387 1 = true := by decide +kernel
theorem okB388 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 388 1 = true := by decide +kernel
theorem okB389 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 389 1 = true := by decide +kernel
theorem okB390 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 390 1 = true := by decide +kernel
theorem okB391 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 391 1 = true := by decide +kernel
theorem okB392 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 392 1 = true := by decide +kernel
theorem okB393 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 393 1 = true := by decide +kernel
theorem okG39 : glueChkR lits W 384 10 = true := by decide +kernel
theorem okM39 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 1 = true := okB384
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 2 = true := blkChk_join _ _ _ _ _ 384 1 1 h0 okB385
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 3 = true := blkChk_join _ _ _ _ _ 384 2 1 h1 okB386
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 4 = true := blkChk_join _ _ _ _ _ 384 3 1 h2 okB387
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 5 = true := blkChk_join _ _ _ _ _ 384 4 1 h3 okB388
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 6 = true := blkChk_join _ _ _ _ _ 384 5 1 h4 okB389
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 7 = true := blkChk_join _ _ _ _ _ 384 6 1 h5 okB390
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 8 = true := blkChk_join _ _ _ _ _ 384 7 1 h6 okB391
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 9 = true := blkChk_join _ _ _ _ _ 384 8 1 h7 okB392
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 384 10 = true := blkChk_join _ _ _ _ _ 384 9 1 h8 okB393
  exact h9
end E1.C384X
