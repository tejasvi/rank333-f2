module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3973 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3974 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3975 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3976 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3977 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3978 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG419 : glueChkR lits W 3973 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3973 lenT]; decide +kernel
theorem okM419 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 1 = true := okB3973
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 2 = true := blkChk_join _ _ _ _ _ 3973 1 1 h0 okB3974
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 3 = true := blkChk_join _ _ _ _ _ 3973 2 1 h1 okB3975
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 4 = true := blkChk_join _ _ _ _ _ 3973 3 1 h2 okB3976
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 5 = true := blkChk_join _ _ _ _ _ 3973 4 1 h3 okB3977
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3973 6 = true := blkChk_join _ _ _ _ _ 3973 5 1 h4 okB3978
  exact h5
end E1.C284X
