module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3945 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3946 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3947 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3948 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3949 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3950 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3951 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3952 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3953 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3954 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3955 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG384 : glueChkR lits W 3945 11 = true := by
  rw [← glueChkRN_eq lits W 8596 3945 lenT]; decide +kernel
theorem okM384 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 1 = true := okB3945
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 2 = true := blkChk_join _ _ _ _ _ 3945 1 1 h0 okB3946
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 3 = true := blkChk_join _ _ _ _ _ 3945 2 1 h1 okB3947
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 4 = true := blkChk_join _ _ _ _ _ 3945 3 1 h2 okB3948
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 5 = true := blkChk_join _ _ _ _ _ 3945 4 1 h3 okB3949
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 6 = true := blkChk_join _ _ _ _ _ 3945 5 1 h4 okB3950
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 7 = true := blkChk_join _ _ _ _ _ 3945 6 1 h5 okB3951
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 8 = true := blkChk_join _ _ _ _ _ 3945 7 1 h6 okB3952
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 9 = true := blkChk_join _ _ _ _ _ 3945 8 1 h7 okB3953
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 10 = true := blkChk_join _ _ _ _ _ 3945 9 1 h8 okB3954
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3945 11 = true := blkChk_join _ _ _ _ _ 3945 10 1 h9 okB3955
  exact h10
end E1.C236X
