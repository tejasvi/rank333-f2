module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB551 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB552 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 552 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB553 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 553 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB554 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 554 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB555 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 555 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB556 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 556 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG63 : glueChkR lits W 551 6 = true := by
  rw [← glueChkRN_eq lits W 7747 551 lenT]; decide +kernel
theorem okM63 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 1 = true := okB551
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 2 = true := blkChk_join _ _ _ _ _ 551 1 1 h0 okB552
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 3 = true := blkChk_join _ _ _ _ _ 551 2 1 h1 okB553
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 4 = true := blkChk_join _ _ _ _ _ 551 3 1 h2 okB554
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 5 = true := blkChk_join _ _ _ _ _ 551 4 1 h3 okB555
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 551 6 = true := blkChk_join _ _ _ _ _ 551 5 1 h4 okB556
  exact h5
end E1.C284X
