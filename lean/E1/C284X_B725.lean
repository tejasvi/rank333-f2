module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7074 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7075 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7076 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7077 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7078 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7079 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7080 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7081 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7082 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7082 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG725 : glueChkR lits W 7074 9 = true := by
  rw [← glueChkRN_eq lits W 7747 7074 lenT]; decide +kernel
theorem okM725 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 1 = true := okB7074
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 2 = true := blkChk_join _ _ _ _ _ 7074 1 1 h0 okB7075
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 3 = true := blkChk_join _ _ _ _ _ 7074 2 1 h1 okB7076
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 4 = true := blkChk_join _ _ _ _ _ 7074 3 1 h2 okB7077
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 5 = true := blkChk_join _ _ _ _ _ 7074 4 1 h3 okB7078
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 6 = true := blkChk_join _ _ _ _ _ 7074 5 1 h4 okB7079
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 7 = true := blkChk_join _ _ _ _ _ 7074 6 1 h5 okB7080
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 8 = true := blkChk_join _ _ _ _ _ 7074 7 1 h6 okB7081
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7074 9 = true := blkChk_join _ _ _ _ _ 7074 8 1 h7 okB7082
  exact h8
end E1.C284X
