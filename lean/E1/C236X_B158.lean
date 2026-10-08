module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1666 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1667 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1667 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1668 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1669 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1670 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1671 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1672 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG158 : glueChkR lits W 1666 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1666 lenT]; decide +kernel
theorem okM158 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 1 = true := okB1666
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 2 = true := blkChk_join _ _ _ _ _ 1666 1 1 h0 okB1667
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 3 = true := blkChk_join _ _ _ _ _ 1666 2 1 h1 okB1668
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 4 = true := blkChk_join _ _ _ _ _ 1666 3 1 h2 okB1669
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 5 = true := blkChk_join _ _ _ _ _ 1666 4 1 h3 okB1670
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 6 = true := blkChk_join _ _ _ _ _ 1666 5 1 h4 okB1671
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1666 7 = true := blkChk_join _ _ _ _ _ 1666 6 1 h5 okB1672
  exact h6
end E1.C236X
