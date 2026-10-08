module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2936 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2937 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2937 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2938 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2938 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2939 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2939 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2940 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2940 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2941 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2942 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2942 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2943 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2944 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2945 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2946 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG318 : glueChkR lits W 2936 11 = true := by
  rw [← glueChkRN_eq lits W 7747 2936 lenT]; decide +kernel
theorem okM318 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 1 = true := okB2936
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 2 = true := blkChk_join _ _ _ _ _ 2936 1 1 h0 okB2937
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 3 = true := blkChk_join _ _ _ _ _ 2936 2 1 h1 okB2938
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 4 = true := blkChk_join _ _ _ _ _ 2936 3 1 h2 okB2939
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 5 = true := blkChk_join _ _ _ _ _ 2936 4 1 h3 okB2940
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 6 = true := blkChk_join _ _ _ _ _ 2936 5 1 h4 okB2941
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 7 = true := blkChk_join _ _ _ _ _ 2936 6 1 h5 okB2942
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 8 = true := blkChk_join _ _ _ _ _ 2936 7 1 h6 okB2943
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 9 = true := blkChk_join _ _ _ _ _ 2936 8 1 h7 okB2944
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 10 = true := blkChk_join _ _ _ _ _ 2936 9 1 h8 okB2945
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2936 11 = true := blkChk_join _ _ _ _ _ 2936 10 1 h9 okB2946
  exact h10
end E1.C284X
