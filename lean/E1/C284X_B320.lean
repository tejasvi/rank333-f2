module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2956 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2957 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2958 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2959 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2960 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2961 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2962 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2963 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2963 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2964 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2964 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG320 : glueChkR lits W 2956 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2956 lenT]; decide +kernel
theorem okM320 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 1 = true := okB2956
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 2 = true := blkChk_join _ _ _ _ _ 2956 1 1 h0 okB2957
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 3 = true := blkChk_join _ _ _ _ _ 2956 2 1 h1 okB2958
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 4 = true := blkChk_join _ _ _ _ _ 2956 3 1 h2 okB2959
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 5 = true := blkChk_join _ _ _ _ _ 2956 4 1 h3 okB2960
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 6 = true := blkChk_join _ _ _ _ _ 2956 5 1 h4 okB2961
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 7 = true := blkChk_join _ _ _ _ _ 2956 6 1 h5 okB2962
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 8 = true := blkChk_join _ _ _ _ _ 2956 7 1 h6 okB2963
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2956 9 = true := blkChk_join _ _ _ _ _ 2956 8 1 h7 okB2964
  exact h8
end E1.C284X
