module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB8010 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8011 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8012 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8013 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8014 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8015 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8016 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8017 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8018 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8019 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8020 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8020 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB8021 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8021 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG750 : glueChkR lits W 8010 12 = true := by
  rw [← glueChkRN_eq lits W 8596 8010 lenT]; decide +kernel
theorem okM750 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 1 = true := okB8010
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 2 = true := blkChk_join _ _ _ _ _ 8010 1 1 h0 okB8011
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 3 = true := blkChk_join _ _ _ _ _ 8010 2 1 h1 okB8012
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 4 = true := blkChk_join _ _ _ _ _ 8010 3 1 h2 okB8013
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 5 = true := blkChk_join _ _ _ _ _ 8010 4 1 h3 okB8014
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 6 = true := blkChk_join _ _ _ _ _ 8010 5 1 h4 okB8015
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 7 = true := blkChk_join _ _ _ _ _ 8010 6 1 h5 okB8016
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 8 = true := blkChk_join _ _ _ _ _ 8010 7 1 h6 okB8017
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 9 = true := blkChk_join _ _ _ _ _ 8010 8 1 h7 okB8018
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 10 = true := blkChk_join _ _ _ _ _ 8010 9 1 h8 okB8019
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 11 = true := blkChk_join _ _ _ _ _ 8010 10 1 h9 okB8020
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 8010 12 = true := blkChk_join _ _ _ _ _ 8010 11 1 h10 okB8021
  exact h11
end E1.C236X
