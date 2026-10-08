module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3973 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3974 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3975 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3976 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3977 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3978 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3979 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3980 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3981 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG387 : glueChkR lits W 3973 9 = true := by
  rw [← glueChkRN_eq lits W 8596 3973 lenT]; decide +kernel
theorem okM387 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 1 = true := okB3973
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 2 = true := blkChk_join _ _ _ _ _ 3973 1 1 h0 okB3974
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 3 = true := blkChk_join _ _ _ _ _ 3973 2 1 h1 okB3975
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 4 = true := blkChk_join _ _ _ _ _ 3973 3 1 h2 okB3976
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 5 = true := blkChk_join _ _ _ _ _ 3973 4 1 h3 okB3977
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 6 = true := blkChk_join _ _ _ _ _ 3973 5 1 h4 okB3978
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 7 = true := blkChk_join _ _ _ _ _ 3973 6 1 h5 okB3979
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 8 = true := blkChk_join _ _ _ _ _ 3973 7 1 h6 okB3980
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3973 9 = true := blkChk_join _ _ _ _ _ 3973 8 1 h7 okB3981
  exact h8
end E1.C236X
