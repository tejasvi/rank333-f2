module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5943 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5944 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5945 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5946 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5947 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5948 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5949 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5950 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG624 : glueChkR lits W 5943 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5943 lenT]; decide +kernel
theorem okM624 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 1 = true := okB5943
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 2 = true := blkChk_join _ _ _ _ _ 5943 1 1 h0 okB5944
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 3 = true := blkChk_join _ _ _ _ _ 5943 2 1 h1 okB5945
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 4 = true := blkChk_join _ _ _ _ _ 5943 3 1 h2 okB5946
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 5 = true := blkChk_join _ _ _ _ _ 5943 4 1 h3 okB5947
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 6 = true := blkChk_join _ _ _ _ _ 5943 5 1 h4 okB5948
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 7 = true := blkChk_join _ _ _ _ _ 5943 6 1 h5 okB5949
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5943 8 = true := blkChk_join _ _ _ _ _ 5943 7 1 h6 okB5950
  exact h7
end E1.C284X
