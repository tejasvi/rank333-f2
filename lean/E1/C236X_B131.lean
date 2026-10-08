module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1423 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1424 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1424 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1425 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1425 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1426 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1426 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1427 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1427 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1428 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1428 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1429 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1429 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1430 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1430 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG131 : glueChkR lits W 1423 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1423 lenT]; decide +kernel
theorem okM131 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 1 = true := okB1423
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 2 = true := blkChk_join _ _ _ _ _ 1423 1 1 h0 okB1424
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 3 = true := blkChk_join _ _ _ _ _ 1423 2 1 h1 okB1425
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 4 = true := blkChk_join _ _ _ _ _ 1423 3 1 h2 okB1426
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 5 = true := blkChk_join _ _ _ _ _ 1423 4 1 h3 okB1427
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 6 = true := blkChk_join _ _ _ _ _ 1423 5 1 h4 okB1428
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 7 = true := blkChk_join _ _ _ _ _ 1423 6 1 h5 okB1429
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1423 8 = true := blkChk_join _ _ _ _ _ 1423 7 1 h6 okB1430
  exact h7
end E1.C236X
