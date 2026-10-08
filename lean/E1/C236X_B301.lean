module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3065 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3066 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3067 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3068 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3069 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3070 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3071 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3072 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3073 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3074 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3075 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3076 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG301 : glueChkR lits W 3065 12 = true := by
  rw [← glueChkRN_eq lits W 8596 3065 lenT]; decide +kernel
theorem okM301 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 1 = true := okB3065
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 2 = true := blkChk_join _ _ _ _ _ 3065 1 1 h0 okB3066
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 3 = true := blkChk_join _ _ _ _ _ 3065 2 1 h1 okB3067
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 4 = true := blkChk_join _ _ _ _ _ 3065 3 1 h2 okB3068
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 5 = true := blkChk_join _ _ _ _ _ 3065 4 1 h3 okB3069
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 6 = true := blkChk_join _ _ _ _ _ 3065 5 1 h4 okB3070
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 7 = true := blkChk_join _ _ _ _ _ 3065 6 1 h5 okB3071
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 8 = true := blkChk_join _ _ _ _ _ 3065 7 1 h6 okB3072
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 9 = true := blkChk_join _ _ _ _ _ 3065 8 1 h7 okB3073
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 10 = true := blkChk_join _ _ _ _ _ 3065 9 1 h8 okB3074
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 11 = true := blkChk_join _ _ _ _ _ 3065 10 1 h9 okB3075
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3065 12 = true := blkChk_join _ _ _ _ _ 3065 11 1 h10 okB3076
  exact h11
end E1.C236X
