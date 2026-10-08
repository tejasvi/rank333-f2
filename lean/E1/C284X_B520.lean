module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4923 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4924 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4924 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4925 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4925 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4926 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4926 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4927 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4927 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4928 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4928 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG520 : glueChkR lits W 4923 6 = true := by
  rw [← glueChkRN_eq lits W 7747 4923 lenT]; decide +kernel
theorem okM520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 1 = true := okB4923
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 2 = true := blkChk_join _ _ _ _ _ 4923 1 1 h0 okB4924
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 3 = true := blkChk_join _ _ _ _ _ 4923 2 1 h1 okB4925
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 4 = true := blkChk_join _ _ _ _ _ 4923 3 1 h2 okB4926
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 5 = true := blkChk_join _ _ _ _ _ 4923 4 1 h3 okB4927
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4923 6 = true := blkChk_join _ _ _ _ _ 4923 5 1 h4 okB4928
  exact h5
end E1.C284X
