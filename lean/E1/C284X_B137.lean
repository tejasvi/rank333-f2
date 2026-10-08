module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1248 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1249 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1249 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1250 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1250 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1251 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1251 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1252 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1252 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG137 : glueChkR lits W 1248 5 = true := by
  rw [← glueChkRN_eq lits W 7747 1248 lenT]; decide +kernel
theorem okM137 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 1 = true := okB1248
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 2 = true := blkChk_join _ _ _ _ _ 1248 1 1 h0 okB1249
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 3 = true := blkChk_join _ _ _ _ _ 1248 2 1 h1 okB1250
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 4 = true := blkChk_join _ _ _ _ _ 1248 3 1 h2 okB1251
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1248 5 = true := blkChk_join _ _ _ _ _ 1248 4 1 h3 okB1252
  exact h4
end E1.C284X
