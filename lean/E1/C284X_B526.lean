module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4966 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4967 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4968 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4969 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4970 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4971 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4972 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4973 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG526 : glueChkR lits W 4966 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4966 lenT]; decide +kernel
theorem okM526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 1 = true := okB4966
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 2 = true := blkChk_join _ _ _ _ _ 4966 1 1 h0 okB4967
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 3 = true := blkChk_join _ _ _ _ _ 4966 2 1 h1 okB4968
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 4 = true := blkChk_join _ _ _ _ _ 4966 3 1 h2 okB4969
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 5 = true := blkChk_join _ _ _ _ _ 4966 4 1 h3 okB4970
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 6 = true := blkChk_join _ _ _ _ _ 4966 5 1 h4 okB4971
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 7 = true := blkChk_join _ _ _ _ _ 4966 6 1 h5 okB4972
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4966 8 = true := blkChk_join _ _ _ _ _ 4966 7 1 h6 okB4973
  exact h7
end E1.C284X
