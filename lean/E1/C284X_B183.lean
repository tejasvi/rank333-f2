module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1681 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1682 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1683 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1684 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1685 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG183 : glueChkR lits W 1679 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1679 lenT]; decide +kernel
theorem okM183 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 1 = true := okB1679
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 2 = true := blkChk_join _ _ _ _ _ 1679 1 1 h0 okB1680
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 3 = true := blkChk_join _ _ _ _ _ 1679 2 1 h1 okB1681
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 4 = true := blkChk_join _ _ _ _ _ 1679 3 1 h2 okB1682
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 5 = true := blkChk_join _ _ _ _ _ 1679 4 1 h3 okB1683
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 6 = true := blkChk_join _ _ _ _ _ 1679 5 1 h4 okB1684
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1679 7 = true := blkChk_join _ _ _ _ _ 1679 6 1 h5 okB1685
  exact h6
end E1.C284X
