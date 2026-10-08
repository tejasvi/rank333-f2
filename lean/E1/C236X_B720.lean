module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7664 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7665 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7665 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7666 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7666 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7667 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7667 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7668 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7669 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7670 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7671 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG720 : glueChkR lits W 7664 8 = true := by
  rw [← glueChkRN_eq lits W 8596 7664 lenT]; decide +kernel
theorem okM720 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 1 = true := okB7664
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 2 = true := blkChk_join _ _ _ _ _ 7664 1 1 h0 okB7665
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 3 = true := blkChk_join _ _ _ _ _ 7664 2 1 h1 okB7666
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 4 = true := blkChk_join _ _ _ _ _ 7664 3 1 h2 okB7667
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 5 = true := blkChk_join _ _ _ _ _ 7664 4 1 h3 okB7668
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 6 = true := blkChk_join _ _ _ _ _ 7664 5 1 h4 okB7669
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 7 = true := blkChk_join _ _ _ _ _ 7664 6 1 h5 okB7670
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7664 8 = true := blkChk_join _ _ _ _ _ 7664 7 1 h6 okB7671
  exact h7
end E1.C236X
