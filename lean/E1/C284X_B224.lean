module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2028 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2029 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2030 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2031 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2032 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG224 : glueChkR lits W 2028 5 = true := by
  rw [← glueChkRN_eq lits W 7747 2028 lenT]; decide +kernel
theorem okM224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 1 = true := okB2028
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 2 = true := blkChk_join _ _ _ _ _ 2028 1 1 h0 okB2029
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 3 = true := blkChk_join _ _ _ _ _ 2028 2 1 h1 okB2030
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 4 = true := blkChk_join _ _ _ _ _ 2028 3 1 h2 okB2031
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2028 5 = true := blkChk_join _ _ _ _ _ 2028 4 1 h3 okB2032
  exact h4
end E1.C284X
