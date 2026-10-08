module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6534 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6535 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6536 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6537 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6538 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6539 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6540 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6541 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6541 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6542 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6542 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6543 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6543 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG620 : glueChkR lits W 6534 10 = true := by
  rw [← glueChkRN_eq lits W 8596 6534 lenT]; decide +kernel
theorem okM620 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 1 = true := okB6534
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 2 = true := blkChk_join _ _ _ _ _ 6534 1 1 h0 okB6535
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 3 = true := blkChk_join _ _ _ _ _ 6534 2 1 h1 okB6536
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 4 = true := blkChk_join _ _ _ _ _ 6534 3 1 h2 okB6537
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 5 = true := blkChk_join _ _ _ _ _ 6534 4 1 h3 okB6538
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 6 = true := blkChk_join _ _ _ _ _ 6534 5 1 h4 okB6539
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 7 = true := blkChk_join _ _ _ _ _ 6534 6 1 h5 okB6540
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 8 = true := blkChk_join _ _ _ _ _ 6534 7 1 h6 okB6541
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 9 = true := blkChk_join _ _ _ _ _ 6534 8 1 h7 okB6542
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6534 10 = true := blkChk_join _ _ _ _ _ 6534 9 1 h8 okB6543
  exact h9
end E1.C236X
