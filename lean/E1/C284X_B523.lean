module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4942 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4943 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4944 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4945 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4946 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4947 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4948 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4949 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG523 : glueChkR lits W 4942 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4942 lenT]; decide +kernel
theorem okM523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 1 = true := okB4942
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 2 = true := blkChk_join _ _ _ _ _ 4942 1 1 h0 okB4943
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 3 = true := blkChk_join _ _ _ _ _ 4942 2 1 h1 okB4944
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 4 = true := blkChk_join _ _ _ _ _ 4942 3 1 h2 okB4945
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 5 = true := blkChk_join _ _ _ _ _ 4942 4 1 h3 okB4946
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 6 = true := blkChk_join _ _ _ _ _ 4942 5 1 h4 okB4947
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 7 = true := blkChk_join _ _ _ _ _ 4942 6 1 h5 okB4948
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4942 8 = true := blkChk_join _ _ _ _ _ 4942 7 1 h6 okB4949
  exact h7
end E1.C284X
