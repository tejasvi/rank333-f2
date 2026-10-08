module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1223 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1225 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1226 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG134 : glueChkR lits W 1220 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1220 lenT]; decide +kernel
theorem okM134 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 1 = true := okB1220
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 2 = true := blkChk_join _ _ _ _ _ 1220 1 1 h0 okB1221
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 3 = true := blkChk_join _ _ _ _ _ 1220 2 1 h1 okB1222
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 4 = true := blkChk_join _ _ _ _ _ 1220 3 1 h2 okB1223
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 5 = true := blkChk_join _ _ _ _ _ 1220 4 1 h3 okB1224
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 6 = true := blkChk_join _ _ _ _ _ 1220 5 1 h4 okB1225
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 7 = true := blkChk_join _ _ _ _ _ 1220 6 1 h5 okB1226
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1220 8 = true := blkChk_join _ _ _ _ _ 1220 7 1 h6 okB1227
  exact h7
end E1.C284X
