module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5983 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5984 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5985 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5986 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5987 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5988 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5989 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5990 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5991 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5992 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5993 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5993 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5994 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG628 : glueChkR lits W 5983 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5983 lenT]; decide +kernel
theorem okM628 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 1 = true := okB5983
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 2 = true := blkChk_join _ _ _ _ _ 5983 1 1 h0 okB5984
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 3 = true := blkChk_join _ _ _ _ _ 5983 2 1 h1 okB5985
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 4 = true := blkChk_join _ _ _ _ _ 5983 3 1 h2 okB5986
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 5 = true := blkChk_join _ _ _ _ _ 5983 4 1 h3 okB5987
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 6 = true := blkChk_join _ _ _ _ _ 5983 5 1 h4 okB5988
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 7 = true := blkChk_join _ _ _ _ _ 5983 6 1 h5 okB5989
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 8 = true := blkChk_join _ _ _ _ _ 5983 7 1 h6 okB5990
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 9 = true := blkChk_join _ _ _ _ _ 5983 8 1 h7 okB5991
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 10 = true := blkChk_join _ _ _ _ _ 5983 9 1 h8 okB5992
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 11 = true := blkChk_join _ _ _ _ _ 5983 10 1 h9 okB5993
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5983 12 = true := blkChk_join _ _ _ _ _ 5983 11 1 h10 okB5994
  exact h11
end E1.C284X
