module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB668 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB669 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB670 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB673 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG74 : glueChkR lits W 668 9 = true := by
  rw [← glueChkRN_eq lits W 7747 668 lenT]; decide +kernel
theorem okM74 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 1 = true := okB668
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 2 = true := blkChk_join _ _ _ _ _ 668 1 1 h0 okB669
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 3 = true := blkChk_join _ _ _ _ _ 668 2 1 h1 okB670
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 4 = true := blkChk_join _ _ _ _ _ 668 3 1 h2 okB671
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 5 = true := blkChk_join _ _ _ _ _ 668 4 1 h3 okB672
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 6 = true := blkChk_join _ _ _ _ _ 668 5 1 h4 okB673
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 7 = true := blkChk_join _ _ _ _ _ 668 6 1 h5 okB674
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 8 = true := blkChk_join _ _ _ _ _ 668 7 1 h6 okB675
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 668 9 = true := blkChk_join _ _ _ _ _ 668 8 1 h7 okB676
  exact h8
end E1.C284X
