module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1684 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1685 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1686 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1687 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1687 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1688 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1688 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1689 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1689 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1690 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1690 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1691 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1691 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG160 : glueChkR lits W 1684 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1684 lenT]; decide +kernel
theorem okM160 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 1 = true := okB1684
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 2 = true := blkChk_join _ _ _ _ _ 1684 1 1 h0 okB1685
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 3 = true := blkChk_join _ _ _ _ _ 1684 2 1 h1 okB1686
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 4 = true := blkChk_join _ _ _ _ _ 1684 3 1 h2 okB1687
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 5 = true := blkChk_join _ _ _ _ _ 1684 4 1 h3 okB1688
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 6 = true := blkChk_join _ _ _ _ _ 1684 5 1 h4 okB1689
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 7 = true := blkChk_join _ _ _ _ _ 1684 6 1 h5 okB1690
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1684 8 = true := blkChk_join _ _ _ _ _ 1684 7 1 h6 okB1691
  exact h7
end E1.C236X
