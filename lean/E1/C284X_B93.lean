module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB860 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB861 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 861 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB862 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB863 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB864 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB865 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB866 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB867 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB868 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB869 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB870 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB871 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG93 : glueChkR lits W 860 12 = true := by
  rw [← glueChkRN_eq lits W 7747 860 lenT]; decide +kernel
theorem okM93 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 1 = true := okB860
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 2 = true := blkChk_join _ _ _ _ _ 860 1 1 h0 okB861
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 3 = true := blkChk_join _ _ _ _ _ 860 2 1 h1 okB862
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 4 = true := blkChk_join _ _ _ _ _ 860 3 1 h2 okB863
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 5 = true := blkChk_join _ _ _ _ _ 860 4 1 h3 okB864
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 6 = true := blkChk_join _ _ _ _ _ 860 5 1 h4 okB865
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 7 = true := blkChk_join _ _ _ _ _ 860 6 1 h5 okB866
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 8 = true := blkChk_join _ _ _ _ _ 860 7 1 h6 okB867
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 9 = true := blkChk_join _ _ _ _ _ 860 8 1 h7 okB868
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 10 = true := blkChk_join _ _ _ _ _ 860 9 1 h8 okB869
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 11 = true := blkChk_join _ _ _ _ _ 860 10 1 h9 okB870
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 860 12 = true := blkChk_join _ _ _ _ _ 860 11 1 h10 okB871
  exact h11
end E1.C284X
