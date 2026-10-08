module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB429 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB430 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 430 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB431 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 431 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB432 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 432 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB433 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 433 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG48 : glueChkR lits W 429 5 = true := by
  rw [← glueChkRN_eq lits W 7747 429 lenT]; decide +kernel
theorem okM48 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 1 = true := okB429
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 2 = true := blkChk_join _ _ _ _ _ 429 1 1 h0 okB430
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 3 = true := blkChk_join _ _ _ _ _ 429 2 1 h1 okB431
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 4 = true := blkChk_join _ _ _ _ _ 429 3 1 h2 okB432
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 429 5 = true := blkChk_join _ _ _ _ _ 429 4 1 h3 okB433
  exact h4
end E1.C284X
