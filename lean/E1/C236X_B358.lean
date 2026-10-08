module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3694 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3695 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3695 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3696 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3696 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3697 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3698 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3699 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3700 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3701 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG358 : glueChkR lits W 3694 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3694 lenT]; decide +kernel
theorem okM358 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 1 = true := okB3694
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 2 = true := blkChk_join _ _ _ _ _ 3694 1 1 h0 okB3695
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 3 = true := blkChk_join _ _ _ _ _ 3694 2 1 h1 okB3696
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 4 = true := blkChk_join _ _ _ _ _ 3694 3 1 h2 okB3697
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 5 = true := blkChk_join _ _ _ _ _ 3694 4 1 h3 okB3698
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 6 = true := blkChk_join _ _ _ _ _ 3694 5 1 h4 okB3699
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 7 = true := blkChk_join _ _ _ _ _ 3694 6 1 h5 okB3700
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3694 8 = true := blkChk_join _ _ _ _ _ 3694 7 1 h6 okB3701
  exact h7
end E1.C236X
