module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4813 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4814 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4815 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4816 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4817 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4818 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4819 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4820 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4821 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4821 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4822 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4822 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4823 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4823 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG507 : glueChkR lits W 4813 11 = true := by
  rw [← glueChkRN_eq lits W 7747 4813 lenT]; decide +kernel
theorem okM507 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 1 = true := okB4813
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 2 = true := blkChk_join _ _ _ _ _ 4813 1 1 h0 okB4814
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 3 = true := blkChk_join _ _ _ _ _ 4813 2 1 h1 okB4815
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 4 = true := blkChk_join _ _ _ _ _ 4813 3 1 h2 okB4816
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 5 = true := blkChk_join _ _ _ _ _ 4813 4 1 h3 okB4817
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 6 = true := blkChk_join _ _ _ _ _ 4813 5 1 h4 okB4818
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 7 = true := blkChk_join _ _ _ _ _ 4813 6 1 h5 okB4819
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 8 = true := blkChk_join _ _ _ _ _ 4813 7 1 h6 okB4820
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 9 = true := blkChk_join _ _ _ _ _ 4813 8 1 h7 okB4821
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 10 = true := blkChk_join _ _ _ _ _ 4813 9 1 h8 okB4822
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4813 11 = true := blkChk_join _ _ _ _ _ 4813 10 1 h9 okB4823
  exact h10
end E1.C284X
