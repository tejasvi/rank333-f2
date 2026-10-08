module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG676 : glueChkR lits W 6490 4 = true := by
  rw [← glueChkRN_eq lits W 7747 6490 lenT]; decide +kernel
theorem okM676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6490 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6490 1 = true := okB6490
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6490 2 = true := blkChk_join _ _ _ _ _ 6490 1 1 h0 okB6491
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6490 3 = true := blkChk_join _ _ _ _ _ 6490 2 1 h1 okB6492
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6490 4 = true := blkChk_join _ _ _ _ _ 6490 3 1 h2 okB6493
  exact h3
end E1.C284X
