module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5042 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5043 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5043 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5044 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5044 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5045 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5045 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5046 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5046 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5047 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5047 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG534 : glueChkR lits W 5042 6 = true := by
  rw [← glueChkRN_eq lits W 7747 5042 lenT]; decide +kernel
theorem okM534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 1 = true := okB5042
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 2 = true := blkChk_join _ _ _ _ _ 5042 1 1 h0 okB5043
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 3 = true := blkChk_join _ _ _ _ _ 5042 2 1 h1 okB5044
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 4 = true := blkChk_join _ _ _ _ _ 5042 3 1 h2 okB5045
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 5 = true := blkChk_join _ _ _ _ _ 5042 4 1 h3 okB5046
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5042 6 = true := blkChk_join _ _ _ _ _ 5042 5 1 h4 okB5047
  exact h5
end E1.C284X
