module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB427 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 1 = true := by decide +kernel
theorem okB428 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 428 1 = true := by decide +kernel
theorem okB429 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 429 1 = true := by decide +kernel
theorem okB430 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 430 1 = true := by decide +kernel
theorem okB431 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 431 1 = true := by decide +kernel
theorem okB432 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 432 1 = true := by decide +kernel
theorem okB433 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 433 1 = true := by decide +kernel
theorem okB434 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 434 1 = true := by decide +kernel
theorem okB435 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 435 1 = true := by decide +kernel
theorem okG38 : glueChkR lits W 427 9 = true := by decide +kernel
theorem okM38 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 9 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 1 = true := okB427
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 2 = true := blkChk_join _ _ _ _ _ 427 1 1 h0 okB428
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 3 = true := blkChk_join _ _ _ _ _ 427 2 1 h1 okB429
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 4 = true := blkChk_join _ _ _ _ _ 427 3 1 h2 okB430
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 5 = true := blkChk_join _ _ _ _ _ 427 4 1 h3 okB431
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 6 = true := blkChk_join _ _ _ _ _ 427 5 1 h4 okB432
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 7 = true := blkChk_join _ _ _ _ _ 427 6 1 h5 okB433
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 8 = true := blkChk_join _ _ _ _ _ 427 7 1 h6 okB434
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 427 9 = true := blkChk_join _ _ _ _ _ 427 8 1 h7 okB435
  exact h8
end E1.C395X
