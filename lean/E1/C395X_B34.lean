module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB383 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 1 = true := by decide +kernel
theorem okB384 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 384 1 = true := by decide +kernel
theorem okB385 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 385 1 = true := by decide +kernel
theorem okB386 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 386 1 = true := by decide +kernel
theorem okB387 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 387 1 = true := by decide +kernel
theorem okB388 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 388 1 = true := by decide +kernel
theorem okB389 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 389 1 = true := by decide +kernel
theorem okB390 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 390 1 = true := by decide +kernel
theorem okB391 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 391 1 = true := by decide +kernel
theorem okG34 : glueChkR lits W 383 9 = true := by decide +kernel
theorem okM34 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 9 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 1 = true := okB383
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 2 = true := blkChk_join _ _ _ _ _ 383 1 1 h0 okB384
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 3 = true := blkChk_join _ _ _ _ _ 383 2 1 h1 okB385
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 4 = true := blkChk_join _ _ _ _ _ 383 3 1 h2 okB386
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 5 = true := blkChk_join _ _ _ _ _ 383 4 1 h3 okB387
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 6 = true := blkChk_join _ _ _ _ _ 383 5 1 h4 okB388
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 7 = true := blkChk_join _ _ _ _ _ 383 6 1 h5 okB389
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 8 = true := blkChk_join _ _ _ _ _ 383 7 1 h6 okB390
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 383 9 = true := blkChk_join _ _ _ _ _ 383 8 1 h7 okB391
  exact h8
end E1.C395X
