module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5084 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5085 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5085 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5086 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5086 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5087 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5087 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5088 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5088 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5089 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5089 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG541 : glueChkR lits W 5084 6 = true := by
  rw [← glueChkRN_eq lits W 7747 5084 lenT]; decide +kernel
theorem okM541 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 1 = true := okB5084
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 2 = true := blkChk_join _ _ _ _ _ 5084 1 1 h0 okB5085
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 3 = true := blkChk_join _ _ _ _ _ 5084 2 1 h1 okB5086
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 4 = true := blkChk_join _ _ _ _ _ 5084 3 1 h2 okB5087
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 5 = true := blkChk_join _ _ _ _ _ 5084 4 1 h3 okB5088
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5084 6 = true := blkChk_join _ _ _ _ _ 5084 5 1 h4 okB5089
  exact h5
end E1.C284X
