module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5972 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5973 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5974 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5975 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5976 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5977 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5978 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5979 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5981 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5982 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG627 : glueChkR lits W 5972 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5972 lenT]; decide +kernel
theorem okM627 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 1 = true := okB5972
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 2 = true := blkChk_join _ _ _ _ _ 5972 1 1 h0 okB5973
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 3 = true := blkChk_join _ _ _ _ _ 5972 2 1 h1 okB5974
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 4 = true := blkChk_join _ _ _ _ _ 5972 3 1 h2 okB5975
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 5 = true := blkChk_join _ _ _ _ _ 5972 4 1 h3 okB5976
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 6 = true := blkChk_join _ _ _ _ _ 5972 5 1 h4 okB5977
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 7 = true := blkChk_join _ _ _ _ _ 5972 6 1 h5 okB5978
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 8 = true := blkChk_join _ _ _ _ _ 5972 7 1 h6 okB5979
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 9 = true := blkChk_join _ _ _ _ _ 5972 8 1 h7 okB5980
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 10 = true := blkChk_join _ _ _ _ _ 5972 9 1 h8 okB5981
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5972 11 = true := blkChk_join _ _ _ _ _ 5972 10 1 h9 okB5982
  exact h10
end E1.C284X
