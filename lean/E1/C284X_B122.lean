module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1126 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1127 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1128 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1129 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1129 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1130 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1130 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1131 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1131 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1132 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1132 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1133 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1133 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG122 : glueChkR lits W 1126 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1126 lenT]; decide +kernel
theorem okM122 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 1 = true := okB1126
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 2 = true := blkChk_join _ _ _ _ _ 1126 1 1 h0 okB1127
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 3 = true := blkChk_join _ _ _ _ _ 1126 2 1 h1 okB1128
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 4 = true := blkChk_join _ _ _ _ _ 1126 3 1 h2 okB1129
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 5 = true := blkChk_join _ _ _ _ _ 1126 4 1 h3 okB1130
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 6 = true := blkChk_join _ _ _ _ _ 1126 5 1 h4 okB1131
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 7 = true := blkChk_join _ _ _ _ _ 1126 6 1 h5 okB1132
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1126 8 = true := blkChk_join _ _ _ _ _ 1126 7 1 h6 okB1133
  exact h7
end E1.C284X
