module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1697 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1698 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1699 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1700 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1701 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1702 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1703 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG185 : glueChkR lits W 1697 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1697 lenT]; decide +kernel
theorem okM185 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 1 = true := okB1697
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 2 = true := blkChk_join _ _ _ _ _ 1697 1 1 h0 okB1698
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 3 = true := blkChk_join _ _ _ _ _ 1697 2 1 h1 okB1699
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 4 = true := blkChk_join _ _ _ _ _ 1697 3 1 h2 okB1700
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 5 = true := blkChk_join _ _ _ _ _ 1697 4 1 h3 okB1701
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 6 = true := blkChk_join _ _ _ _ _ 1697 5 1 h4 okB1702
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 7 = true := blkChk_join _ _ _ _ _ 1697 6 1 h5 okB1703
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1697 8 = true := blkChk_join _ _ _ _ _ 1697 7 1 h6 okB1704
  exact h7
end E1.C284X
