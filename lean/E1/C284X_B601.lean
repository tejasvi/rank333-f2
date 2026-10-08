module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5693 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5694 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5694 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5695 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5695 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5696 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5696 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5697 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5698 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5699 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5700 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5701 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG601 : glueChkR lits W 5693 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5693 lenT]; decide +kernel
theorem okM601 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 1 = true := okB5693
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 2 = true := blkChk_join _ _ _ _ _ 5693 1 1 h0 okB5694
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 3 = true := blkChk_join _ _ _ _ _ 5693 2 1 h1 okB5695
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 4 = true := blkChk_join _ _ _ _ _ 5693 3 1 h2 okB5696
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 5 = true := blkChk_join _ _ _ _ _ 5693 4 1 h3 okB5697
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 6 = true := blkChk_join _ _ _ _ _ 5693 5 1 h4 okB5698
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 7 = true := blkChk_join _ _ _ _ _ 5693 6 1 h5 okB5699
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 8 = true := blkChk_join _ _ _ _ _ 5693 7 1 h6 okB5700
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5693 9 = true := blkChk_join _ _ _ _ _ 5693 8 1 h7 okB5701
  exact h8
end E1.C284X
