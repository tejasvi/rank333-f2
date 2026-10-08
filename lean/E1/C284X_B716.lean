module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6971 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6972 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6973 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6974 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6975 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6976 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6977 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6978 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6979 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG716 : glueChkR lits W 6971 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6971 lenT]; decide +kernel
theorem okM716 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 1 = true := okB6971
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 2 = true := blkChk_join _ _ _ _ _ 6971 1 1 h0 okB6972
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 3 = true := blkChk_join _ _ _ _ _ 6971 2 1 h1 okB6973
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 4 = true := blkChk_join _ _ _ _ _ 6971 3 1 h2 okB6974
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 5 = true := blkChk_join _ _ _ _ _ 6971 4 1 h3 okB6975
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 6 = true := blkChk_join _ _ _ _ _ 6971 5 1 h4 okB6976
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 7 = true := blkChk_join _ _ _ _ _ 6971 6 1 h5 okB6977
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 8 = true := blkChk_join _ _ _ _ _ 6971 7 1 h6 okB6978
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 9 = true := blkChk_join _ _ _ _ _ 6971 8 1 h7 okB6979
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6971 10 = true := blkChk_join _ _ _ _ _ 6971 9 1 h8 okB6980
  exact h9
end E1.C284X
