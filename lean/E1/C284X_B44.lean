module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB408 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 408 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB409 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 409 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB410 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 410 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG44 : glueChkR lits W 408 3 = true := by
  rw [← glueChkRN_eq lits W 7747 408 lenT]; decide +kernel
theorem okM44 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 408 3 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 408 1 = true := okB408
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 408 2 = true := blkChk_join _ _ _ _ _ 408 1 1 h0 okB409
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 408 3 = true := blkChk_join _ _ _ _ _ 408 2 1 h1 okB410
  exact h2
end E1.C284X
