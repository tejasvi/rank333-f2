module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB33 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB34 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 34 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB35 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 35 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB36 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 36 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB37 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 37 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB38 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 38 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB39 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 39 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB40 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 40 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB41 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 41 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB42 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 42 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB43 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 43 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG3 : glueChkR lits W 33 11 = true := by
  rw [← glueChkRN_eq lits W 7747 33 lenT]; decide +kernel
theorem okM3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 1 = true := okB33
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 2 = true := blkChk_join _ _ _ _ _ 33 1 1 h0 okB34
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 3 = true := blkChk_join _ _ _ _ _ 33 2 1 h1 okB35
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 4 = true := blkChk_join _ _ _ _ _ 33 3 1 h2 okB36
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 5 = true := blkChk_join _ _ _ _ _ 33 4 1 h3 okB37
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 6 = true := blkChk_join _ _ _ _ _ 33 5 1 h4 okB38
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 7 = true := blkChk_join _ _ _ _ _ 33 6 1 h5 okB39
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 8 = true := blkChk_join _ _ _ _ _ 33 7 1 h6 okB40
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 9 = true := blkChk_join _ _ _ _ _ 33 8 1 h7 okB41
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 10 = true := blkChk_join _ _ _ _ _ 33 9 1 h8 okB42
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 33 11 = true := blkChk_join _ _ _ _ _ 33 10 1 h9 okB43
  exact h10
end E1.C284X
