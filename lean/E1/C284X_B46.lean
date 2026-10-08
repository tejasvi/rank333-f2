module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB417 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 417 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB418 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 418 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB419 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 419 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB420 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 420 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG46 : glueChkR lits W 417 4 = true := by
  rw [← glueChkRN_eq lits W 7747 417 lenT]; decide +kernel
theorem okM46 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 417 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 417 1 = true := okB417
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 417 2 = true := blkChk_join _ _ _ _ _ 417 1 1 h0 okB418
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 417 3 = true := blkChk_join _ _ _ _ _ 417 2 1 h1 okB419
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 417 4 = true := blkChk_join _ _ _ _ _ 417 3 1 h2 okB420
  exact h3
end E1.C284X
