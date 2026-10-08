module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4754 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4755 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4755 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4756 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4756 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4757 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4757 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4758 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4758 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4759 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4759 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4760 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4760 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4761 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4761 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4762 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4762 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4763 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4763 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG502 : glueChkR lits W 4754 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4754 lenT]; decide +kernel
theorem okM502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 1 = true := okB4754
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 2 = true := blkChk_join _ _ _ _ _ 4754 1 1 h0 okB4755
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 3 = true := blkChk_join _ _ _ _ _ 4754 2 1 h1 okB4756
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 4 = true := blkChk_join _ _ _ _ _ 4754 3 1 h2 okB4757
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 5 = true := blkChk_join _ _ _ _ _ 4754 4 1 h3 okB4758
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 6 = true := blkChk_join _ _ _ _ _ 4754 5 1 h4 okB4759
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 7 = true := blkChk_join _ _ _ _ _ 4754 6 1 h5 okB4760
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 8 = true := blkChk_join _ _ _ _ _ 4754 7 1 h6 okB4761
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 9 = true := blkChk_join _ _ _ _ _ 4754 8 1 h7 okB4762
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4754 10 = true := blkChk_join _ _ _ _ _ 4754 9 1 h8 okB4763
  exact h9
end E1.C284X
