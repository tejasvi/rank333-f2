module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5763 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5764 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5764 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5765 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5765 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5766 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5766 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5767 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5767 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5768 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5768 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5769 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5769 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5770 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5770 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5771 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5771 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5772 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5772 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5773 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5773 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5774 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5774 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG608 : glueChkR lits W 5763 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5763 lenT]; decide +kernel
theorem okM608 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 1 = true := okB5763
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 2 = true := blkChk_join _ _ _ _ _ 5763 1 1 h0 okB5764
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 3 = true := blkChk_join _ _ _ _ _ 5763 2 1 h1 okB5765
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 4 = true := blkChk_join _ _ _ _ _ 5763 3 1 h2 okB5766
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 5 = true := blkChk_join _ _ _ _ _ 5763 4 1 h3 okB5767
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 6 = true := blkChk_join _ _ _ _ _ 5763 5 1 h4 okB5768
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 7 = true := blkChk_join _ _ _ _ _ 5763 6 1 h5 okB5769
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 8 = true := blkChk_join _ _ _ _ _ 5763 7 1 h6 okB5770
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 9 = true := blkChk_join _ _ _ _ _ 5763 8 1 h7 okB5771
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 10 = true := blkChk_join _ _ _ _ _ 5763 9 1 h8 okB5772
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 11 = true := blkChk_join _ _ _ _ _ 5763 10 1 h9 okB5773
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5763 12 = true := blkChk_join _ _ _ _ _ 5763 11 1 h10 okB5774
  exact h11
end E1.C284X
