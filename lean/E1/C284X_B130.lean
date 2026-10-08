module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1190 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1191 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1191 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1192 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1192 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1193 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1193 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1194 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1194 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1195 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1195 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1196 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1196 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1197 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1197 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG130 : glueChkR lits W 1190 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1190 lenT]; decide +kernel
theorem okM130 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 1 = true := okB1190
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 2 = true := blkChk_join _ _ _ _ _ 1190 1 1 h0 okB1191
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 3 = true := blkChk_join _ _ _ _ _ 1190 2 1 h1 okB1192
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 4 = true := blkChk_join _ _ _ _ _ 1190 3 1 h2 okB1193
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 5 = true := blkChk_join _ _ _ _ _ 1190 4 1 h3 okB1194
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 6 = true := blkChk_join _ _ _ _ _ 1190 5 1 h4 okB1195
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 7 = true := blkChk_join _ _ _ _ _ 1190 6 1 h5 okB1196
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1190 8 = true := blkChk_join _ _ _ _ _ 1190 7 1 h6 okB1197
  exact h7
end E1.C284X
