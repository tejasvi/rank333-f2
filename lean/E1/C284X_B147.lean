module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1336 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1337 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1337 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1338 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1338 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1339 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1339 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1340 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1340 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1341 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1341 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1342 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1342 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1343 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1343 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1344 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1344 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1345 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1345 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG147 : glueChkR lits W 1336 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1336 lenT]; decide +kernel
theorem okM147 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 1 = true := okB1336
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 2 = true := blkChk_join _ _ _ _ _ 1336 1 1 h0 okB1337
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 3 = true := blkChk_join _ _ _ _ _ 1336 2 1 h1 okB1338
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 4 = true := blkChk_join _ _ _ _ _ 1336 3 1 h2 okB1339
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 5 = true := blkChk_join _ _ _ _ _ 1336 4 1 h3 okB1340
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 6 = true := blkChk_join _ _ _ _ _ 1336 5 1 h4 okB1341
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 7 = true := blkChk_join _ _ _ _ _ 1336 6 1 h5 okB1342
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 8 = true := blkChk_join _ _ _ _ _ 1336 7 1 h6 okB1343
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 9 = true := blkChk_join _ _ _ _ _ 1336 8 1 h7 okB1344
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1336 10 = true := blkChk_join _ _ _ _ _ 1336 9 1 h8 okB1345
  exact h9
end E1.C284X
