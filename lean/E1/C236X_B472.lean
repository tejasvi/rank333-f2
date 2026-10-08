module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4810 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4812 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4813 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4814 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4815 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4816 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4817 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4818 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4819 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4820 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4821 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4821 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4822 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4822 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4823 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4823 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4824 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4824 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4825 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG472 : glueChkR lits W 4810 16 = true := by
  rw [← glueChkRN_eq lits W 8596 4810 lenT]; decide +kernel
theorem okM472 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 16 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 1 = true := okB4810
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 2 = true := blkChk_join _ _ _ _ _ 4810 1 1 h0 okB4811
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 3 = true := blkChk_join _ _ _ _ _ 4810 2 1 h1 okB4812
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 4 = true := blkChk_join _ _ _ _ _ 4810 3 1 h2 okB4813
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 5 = true := blkChk_join _ _ _ _ _ 4810 4 1 h3 okB4814
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 6 = true := blkChk_join _ _ _ _ _ 4810 5 1 h4 okB4815
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 7 = true := blkChk_join _ _ _ _ _ 4810 6 1 h5 okB4816
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 8 = true := blkChk_join _ _ _ _ _ 4810 7 1 h6 okB4817
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 9 = true := blkChk_join _ _ _ _ _ 4810 8 1 h7 okB4818
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 10 = true := blkChk_join _ _ _ _ _ 4810 9 1 h8 okB4819
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 11 = true := blkChk_join _ _ _ _ _ 4810 10 1 h9 okB4820
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 12 = true := blkChk_join _ _ _ _ _ 4810 11 1 h10 okB4821
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 13 = true := blkChk_join _ _ _ _ _ 4810 12 1 h11 okB4822
  have h13 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 14 = true := blkChk_join _ _ _ _ _ 4810 13 1 h12 okB4823
  have h14 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 15 = true := blkChk_join _ _ _ _ _ 4810 14 1 h13 okB4824
  have h15 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4810 16 = true := blkChk_join _ _ _ _ _ 4810 15 1 h14 okB4825
  exact h15
end E1.C236X
