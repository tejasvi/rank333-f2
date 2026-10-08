module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1716 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1716 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1717 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1717 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1718 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1718 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1719 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1719 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1720 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1720 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1721 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1721 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1722 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1722 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1723 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1723 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1724 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1724 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG187 : glueChkR lits W 1714 11 = true := by
  rw [← glueChkRN_eq lits W 7747 1714 lenT]; decide +kernel
theorem okM187 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 1 = true := okB1714
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 2 = true := blkChk_join _ _ _ _ _ 1714 1 1 h0 okB1715
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 3 = true := blkChk_join _ _ _ _ _ 1714 2 1 h1 okB1716
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 4 = true := blkChk_join _ _ _ _ _ 1714 3 1 h2 okB1717
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 5 = true := blkChk_join _ _ _ _ _ 1714 4 1 h3 okB1718
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 6 = true := blkChk_join _ _ _ _ _ 1714 5 1 h4 okB1719
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 7 = true := blkChk_join _ _ _ _ _ 1714 6 1 h5 okB1720
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 8 = true := blkChk_join _ _ _ _ _ 1714 7 1 h6 okB1721
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 9 = true := blkChk_join _ _ _ _ _ 1714 8 1 h7 okB1722
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 10 = true := blkChk_join _ _ _ _ _ 1714 9 1 h8 okB1723
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1714 11 = true := blkChk_join _ _ _ _ _ 1714 10 1 h9 okB1724
  exact h10
end E1.C284X
