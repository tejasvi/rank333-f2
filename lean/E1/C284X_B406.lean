module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3862 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3863 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3864 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3865 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3866 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3867 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3868 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3869 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG406 : glueChkR lits W 3862 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3862 lenT]; decide +kernel
theorem okM406 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 1 = true := okB3862
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 2 = true := blkChk_join _ _ _ _ _ 3862 1 1 h0 okB3863
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 3 = true := blkChk_join _ _ _ _ _ 3862 2 1 h1 okB3864
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 4 = true := blkChk_join _ _ _ _ _ 3862 3 1 h2 okB3865
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 5 = true := blkChk_join _ _ _ _ _ 3862 4 1 h3 okB3866
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 6 = true := blkChk_join _ _ _ _ _ 3862 5 1 h4 okB3867
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 7 = true := blkChk_join _ _ _ _ _ 3862 6 1 h5 okB3868
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3862 8 = true := blkChk_join _ _ _ _ _ 3862 7 1 h6 okB3869
  exact h7
end E1.C284X
