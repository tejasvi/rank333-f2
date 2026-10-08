module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2965 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2966 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2966 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2967 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2968 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2969 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2970 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2971 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2972 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2973 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG321 : glueChkR lits W 2965 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2965 lenT]; decide +kernel
theorem okM321 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 1 = true := okB2965
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 2 = true := blkChk_join _ _ _ _ _ 2965 1 1 h0 okB2966
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 3 = true := blkChk_join _ _ _ _ _ 2965 2 1 h1 okB2967
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 4 = true := blkChk_join _ _ _ _ _ 2965 3 1 h2 okB2968
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 5 = true := blkChk_join _ _ _ _ _ 2965 4 1 h3 okB2969
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 6 = true := blkChk_join _ _ _ _ _ 2965 5 1 h4 okB2970
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 7 = true := blkChk_join _ _ _ _ _ 2965 6 1 h5 okB2971
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 8 = true := blkChk_join _ _ _ _ _ 2965 7 1 h6 okB2972
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2965 9 = true := blkChk_join _ _ _ _ _ 2965 8 1 h7 okB2973
  exact h8
end E1.C284X
