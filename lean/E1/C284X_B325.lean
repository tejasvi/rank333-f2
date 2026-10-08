module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3010 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3011 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3012 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3013 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3014 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3015 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3016 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3017 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3018 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3019 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3020 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3020 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3021 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3021 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3022 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3022 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG325 : glueChkR lits W 3010 13 = true := by
  rw [← glueChkRN_eq lits W 7747 3010 lenT]; decide +kernel
theorem okM325 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 1 = true := okB3010
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 2 = true := blkChk_join _ _ _ _ _ 3010 1 1 h0 okB3011
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 3 = true := blkChk_join _ _ _ _ _ 3010 2 1 h1 okB3012
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 4 = true := blkChk_join _ _ _ _ _ 3010 3 1 h2 okB3013
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 5 = true := blkChk_join _ _ _ _ _ 3010 4 1 h3 okB3014
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 6 = true := blkChk_join _ _ _ _ _ 3010 5 1 h4 okB3015
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 7 = true := blkChk_join _ _ _ _ _ 3010 6 1 h5 okB3016
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 8 = true := blkChk_join _ _ _ _ _ 3010 7 1 h6 okB3017
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 9 = true := blkChk_join _ _ _ _ _ 3010 8 1 h7 okB3018
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 10 = true := blkChk_join _ _ _ _ _ 3010 9 1 h8 okB3019
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 11 = true := blkChk_join _ _ _ _ _ 3010 10 1 h9 okB3020
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 12 = true := blkChk_join _ _ _ _ _ 3010 11 1 h10 okB3021
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3010 13 = true := blkChk_join _ _ _ _ _ 3010 12 1 h11 okB3022
  exact h12
end E1.C284X
