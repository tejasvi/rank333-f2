module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1705 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1706 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1712 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG186 : glueChkR lits W 1705 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1705 lenT]; decide +kernel
theorem okM186 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 1 = true := okB1705
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 2 = true := blkChk_join _ _ _ _ _ 1705 1 1 h0 okB1706
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 3 = true := blkChk_join _ _ _ _ _ 1705 2 1 h1 okB1707
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 4 = true := blkChk_join _ _ _ _ _ 1705 3 1 h2 okB1708
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 5 = true := blkChk_join _ _ _ _ _ 1705 4 1 h3 okB1709
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 6 = true := blkChk_join _ _ _ _ _ 1705 5 1 h4 okB1710
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 7 = true := blkChk_join _ _ _ _ _ 1705 6 1 h5 okB1711
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 8 = true := blkChk_join _ _ _ _ _ 1705 7 1 h6 okB1712
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1705 9 = true := blkChk_join _ _ _ _ _ 1705 8 1 h7 okB1713
  exact h8
end E1.C284X
