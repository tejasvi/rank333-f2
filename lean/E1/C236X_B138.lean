module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1497 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1498 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1499 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1500 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1501 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1502 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1503 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1504 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1505 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1506 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG138 : glueChkR lits W 1497 10 = true := by
  rw [← glueChkRN_eq lits W 8596 1497 lenT]; decide +kernel
theorem okM138 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 1 = true := okB1497
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 2 = true := blkChk_join _ _ _ _ _ 1497 1 1 h0 okB1498
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 3 = true := blkChk_join _ _ _ _ _ 1497 2 1 h1 okB1499
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 4 = true := blkChk_join _ _ _ _ _ 1497 3 1 h2 okB1500
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 5 = true := blkChk_join _ _ _ _ _ 1497 4 1 h3 okB1501
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 6 = true := blkChk_join _ _ _ _ _ 1497 5 1 h4 okB1502
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 7 = true := blkChk_join _ _ _ _ _ 1497 6 1 h5 okB1503
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 8 = true := blkChk_join _ _ _ _ _ 1497 7 1 h6 okB1504
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 9 = true := blkChk_join _ _ _ _ _ 1497 8 1 h7 okB1505
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1497 10 = true := blkChk_join _ _ _ _ _ 1497 9 1 h8 okB1506
  exact h9
end E1.C236X
