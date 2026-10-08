module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1742 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1743 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1743 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1744 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1744 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1745 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1745 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1746 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1746 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1747 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1747 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1748 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1748 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG191 : glueChkR lits W 1742 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1742 lenT]; decide +kernel
theorem okM191 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 1 = true := okB1742
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 2 = true := blkChk_join _ _ _ _ _ 1742 1 1 h0 okB1743
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 3 = true := blkChk_join _ _ _ _ _ 1742 2 1 h1 okB1744
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 4 = true := blkChk_join _ _ _ _ _ 1742 3 1 h2 okB1745
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 5 = true := blkChk_join _ _ _ _ _ 1742 4 1 h3 okB1746
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 6 = true := blkChk_join _ _ _ _ _ 1742 5 1 h4 okB1747
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1742 7 = true := blkChk_join _ _ _ _ _ 1742 6 1 h5 okB1748
  exact h6
end E1.C284X
