module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4044 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4045 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4045 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4046 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4046 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4047 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4047 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4048 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4048 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4049 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4049 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4050 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4050 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4051 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4051 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4052 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4052 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG429 : glueChkR lits W 4044 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4044 lenT]; decide +kernel
theorem okM429 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 1 = true := okB4044
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 2 = true := blkChk_join _ _ _ _ _ 4044 1 1 h0 okB4045
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 3 = true := blkChk_join _ _ _ _ _ 4044 2 1 h1 okB4046
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 4 = true := blkChk_join _ _ _ _ _ 4044 3 1 h2 okB4047
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 5 = true := blkChk_join _ _ _ _ _ 4044 4 1 h3 okB4048
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 6 = true := blkChk_join _ _ _ _ _ 4044 5 1 h4 okB4049
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 7 = true := blkChk_join _ _ _ _ _ 4044 6 1 h5 okB4050
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 8 = true := blkChk_join _ _ _ _ _ 4044 7 1 h6 okB4051
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4044 9 = true := blkChk_join _ _ _ _ _ 4044 8 1 h7 okB4052
  exact h8
end E1.C284X
