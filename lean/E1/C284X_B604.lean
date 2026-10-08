module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5721 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5722 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5722 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5723 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5723 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5724 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5724 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5725 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5725 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5726 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5726 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5727 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5727 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5728 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5728 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG604 : glueChkR lits W 5721 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5721 lenT]; decide +kernel
theorem okM604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 1 = true := okB5721
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 2 = true := blkChk_join _ _ _ _ _ 5721 1 1 h0 okB5722
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 3 = true := blkChk_join _ _ _ _ _ 5721 2 1 h1 okB5723
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 4 = true := blkChk_join _ _ _ _ _ 5721 3 1 h2 okB5724
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 5 = true := blkChk_join _ _ _ _ _ 5721 4 1 h3 okB5725
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 6 = true := blkChk_join _ _ _ _ _ 5721 5 1 h4 okB5726
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 7 = true := blkChk_join _ _ _ _ _ 5721 6 1 h5 okB5727
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5721 8 = true := blkChk_join _ _ _ _ _ 5721 7 1 h6 okB5728
  exact h7
end E1.C284X
