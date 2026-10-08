module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB977 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB978 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB979 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB981 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB982 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG103 : glueChkR lits W 977 6 = true := by
  rw [← glueChkRN_eq lits W 7747 977 lenT]; decide +kernel
theorem okM103 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 1 = true := okB977
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 2 = true := blkChk_join _ _ _ _ _ 977 1 1 h0 okB978
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 3 = true := blkChk_join _ _ _ _ _ 977 2 1 h1 okB979
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 4 = true := blkChk_join _ _ _ _ _ 977 3 1 h2 okB980
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 5 = true := blkChk_join _ _ _ _ _ 977 4 1 h3 okB981
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 977 6 = true := blkChk_join _ _ _ _ _ 977 5 1 h4 okB982
  exact h5
end E1.C284X
