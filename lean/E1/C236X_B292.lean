module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2967 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2968 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2969 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2970 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2971 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2972 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2973 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2974 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2975 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2976 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG292 : glueChkR lits W 2967 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2967 lenT]; decide +kernel
theorem okM292 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 1 = true := okB2967
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 2 = true := blkChk_join _ _ _ _ _ 2967 1 1 h0 okB2968
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 3 = true := blkChk_join _ _ _ _ _ 2967 2 1 h1 okB2969
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 4 = true := blkChk_join _ _ _ _ _ 2967 3 1 h2 okB2970
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 5 = true := blkChk_join _ _ _ _ _ 2967 4 1 h3 okB2971
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 6 = true := blkChk_join _ _ _ _ _ 2967 5 1 h4 okB2972
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 7 = true := blkChk_join _ _ _ _ _ 2967 6 1 h5 okB2973
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 8 = true := blkChk_join _ _ _ _ _ 2967 7 1 h6 okB2974
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 9 = true := blkChk_join _ _ _ _ _ 2967 8 1 h7 okB2975
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2967 10 = true := blkChk_join _ _ _ _ _ 2967 9 1 h8 okB2976
  exact h9
end E1.C236X
