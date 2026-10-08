module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7043 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7044 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7044 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7045 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7045 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7046 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7046 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7047 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7047 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7048 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7048 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7049 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7049 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7050 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7050 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7051 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7051 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7052 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7052 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG722 : glueChkR lits W 7043 10 = true := by
  rw [← glueChkRN_eq lits W 7747 7043 lenT]; decide +kernel
theorem okM722 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 1 = true := okB7043
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 2 = true := blkChk_join _ _ _ _ _ 7043 1 1 h0 okB7044
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 3 = true := blkChk_join _ _ _ _ _ 7043 2 1 h1 okB7045
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 4 = true := blkChk_join _ _ _ _ _ 7043 3 1 h2 okB7046
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 5 = true := blkChk_join _ _ _ _ _ 7043 4 1 h3 okB7047
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 6 = true := blkChk_join _ _ _ _ _ 7043 5 1 h4 okB7048
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 7 = true := blkChk_join _ _ _ _ _ 7043 6 1 h5 okB7049
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 8 = true := blkChk_join _ _ _ _ _ 7043 7 1 h6 okB7050
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 9 = true := blkChk_join _ _ _ _ _ 7043 8 1 h7 okB7051
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7043 10 = true := blkChk_join _ _ _ _ _ 7043 9 1 h8 okB7052
  exact h9
end E1.C284X
