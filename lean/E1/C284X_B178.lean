module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1656 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1657 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1657 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1658 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1658 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1659 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1659 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1660 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1660 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1661 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1661 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG178 : glueChkR lits W 1656 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1656 lenT]; decide +kernel
theorem okM178 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 1 = true := okB1656
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 2 = true := blkChk_join _ _ _ _ _ 1656 1 1 h0 okB1657
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 3 = true := blkChk_join _ _ _ _ _ 1656 2 1 h1 okB1658
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 4 = true := blkChk_join _ _ _ _ _ 1656 3 1 h2 okB1659
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 5 = true := blkChk_join _ _ _ _ _ 1656 4 1 h3 okB1660
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1656 6 = true := blkChk_join _ _ _ _ _ 1656 5 1 h4 okB1661
  exact h5
end E1.C284X
