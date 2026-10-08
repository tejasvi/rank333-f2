module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4016 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4017 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4018 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4019 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG425 : glueChkR lits W 4016 4 = true := by
  rw [← glueChkRN_eq lits W 7747 4016 lenT]; decide +kernel
theorem okM425 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4016 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4016 1 = true := okB4016
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4016 2 = true := blkChk_join _ _ _ _ _ 4016 1 1 h0 okB4017
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4016 3 = true := blkChk_join _ _ _ _ _ 4016 2 1 h1 okB4018
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4016 4 = true := blkChk_join _ _ _ _ _ 4016 3 1 h2 okB4019
  exact h3
end E1.C284X
