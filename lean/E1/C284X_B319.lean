module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2947 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2948 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2949 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2950 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2951 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2952 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2953 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2954 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2955 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG319 : glueChkR lits W 2947 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2947 lenT]; decide +kernel
theorem okM319 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 1 = true := okB2947
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 2 = true := blkChk_join _ _ _ _ _ 2947 1 1 h0 okB2948
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 3 = true := blkChk_join _ _ _ _ _ 2947 2 1 h1 okB2949
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 4 = true := blkChk_join _ _ _ _ _ 2947 3 1 h2 okB2950
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 5 = true := blkChk_join _ _ _ _ _ 2947 4 1 h3 okB2951
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 6 = true := blkChk_join _ _ _ _ _ 2947 5 1 h4 okB2952
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 7 = true := blkChk_join _ _ _ _ _ 2947 6 1 h5 okB2953
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 8 = true := blkChk_join _ _ _ _ _ 2947 7 1 h6 okB2954
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2947 9 = true := blkChk_join _ _ _ _ _ 2947 8 1 h7 okB2955
  exact h8
end E1.C284X
