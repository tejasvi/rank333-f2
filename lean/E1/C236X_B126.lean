module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1365 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1366 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1367 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1368 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1369 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1370 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1371 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1372 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1373 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1374 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG126 : glueChkR lits W 1365 10 = true := by
  rw [← glueChkRN_eq lits W 8596 1365 lenT]; decide +kernel
theorem okM126 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 1 = true := okB1365
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 2 = true := blkChk_join _ _ _ _ _ 1365 1 1 h0 okB1366
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 3 = true := blkChk_join _ _ _ _ _ 1365 2 1 h1 okB1367
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 4 = true := blkChk_join _ _ _ _ _ 1365 3 1 h2 okB1368
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 5 = true := blkChk_join _ _ _ _ _ 1365 4 1 h3 okB1369
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 6 = true := blkChk_join _ _ _ _ _ 1365 5 1 h4 okB1370
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 7 = true := blkChk_join _ _ _ _ _ 1365 6 1 h5 okB1371
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 8 = true := blkChk_join _ _ _ _ _ 1365 7 1 h6 okB1372
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 9 = true := blkChk_join _ _ _ _ _ 1365 8 1 h7 okB1373
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1365 10 = true := blkChk_join _ _ _ _ _ 1365 9 1 h8 okB1374
  exact h9
end E1.C236X
