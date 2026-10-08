module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1310 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1311 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1312 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1313 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1314 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1314 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1315 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1315 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1316 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1316 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1317 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1317 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG144 : glueChkR lits W 1310 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1310 lenT]; decide +kernel
theorem okM144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 1 = true := okB1310
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 2 = true := blkChk_join _ _ _ _ _ 1310 1 1 h0 okB1311
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 3 = true := blkChk_join _ _ _ _ _ 1310 2 1 h1 okB1312
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 4 = true := blkChk_join _ _ _ _ _ 1310 3 1 h2 okB1313
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 5 = true := blkChk_join _ _ _ _ _ 1310 4 1 h3 okB1314
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 6 = true := blkChk_join _ _ _ _ _ 1310 5 1 h4 okB1315
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 7 = true := blkChk_join _ _ _ _ _ 1310 6 1 h5 okB1316
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1310 8 = true := blkChk_join _ _ _ _ _ 1310 7 1 h6 okB1317
  exact h7
end E1.C284X
