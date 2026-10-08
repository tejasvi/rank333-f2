module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1029 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1030 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1031 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1032 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1033 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1034 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1035 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG110 : glueChkR lits W 1029 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1029 lenT]; decide +kernel
theorem okM110 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 1 = true := okB1029
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 2 = true := blkChk_join _ _ _ _ _ 1029 1 1 h0 okB1030
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 3 = true := blkChk_join _ _ _ _ _ 1029 2 1 h1 okB1031
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 4 = true := blkChk_join _ _ _ _ _ 1029 3 1 h2 okB1032
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 5 = true := blkChk_join _ _ _ _ _ 1029 4 1 h3 okB1033
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 6 = true := blkChk_join _ _ _ _ _ 1029 5 1 h4 okB1034
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1029 7 = true := blkChk_join _ _ _ _ _ 1029 6 1 h5 okB1035
  exact h6
end E1.C284X
