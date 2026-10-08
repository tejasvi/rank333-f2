module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3941 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3942 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3942 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3943 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3944 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3945 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3946 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3947 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3948 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3949 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG415 : glueChkR lits W 3941 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3941 lenT]; decide +kernel
theorem okM415 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 1 = true := okB3941
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 2 = true := blkChk_join _ _ _ _ _ 3941 1 1 h0 okB3942
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 3 = true := blkChk_join _ _ _ _ _ 3941 2 1 h1 okB3943
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 4 = true := blkChk_join _ _ _ _ _ 3941 3 1 h2 okB3944
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 5 = true := blkChk_join _ _ _ _ _ 3941 4 1 h3 okB3945
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 6 = true := blkChk_join _ _ _ _ _ 3941 5 1 h4 okB3946
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 7 = true := blkChk_join _ _ _ _ _ 3941 6 1 h5 okB3947
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 8 = true := blkChk_join _ _ _ _ _ 3941 7 1 h6 okB3948
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3941 9 = true := blkChk_join _ _ _ _ _ 3941 8 1 h7 okB3949
  exact h8
end E1.C284X
