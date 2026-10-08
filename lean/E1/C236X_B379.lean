module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3902 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3903 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3904 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3905 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3906 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3907 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG379 : glueChkR lits W 3902 6 = true := by
  rw [← glueChkRN_eq lits W 8596 3902 lenT]; decide +kernel
theorem okM379 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 1 = true := okB3902
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 2 = true := blkChk_join _ _ _ _ _ 3902 1 1 h0 okB3903
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 3 = true := blkChk_join _ _ _ _ _ 3902 2 1 h1 okB3904
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 4 = true := blkChk_join _ _ _ _ _ 3902 3 1 h2 okB3905
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 5 = true := blkChk_join _ _ _ _ _ 3902 4 1 h3 okB3906
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3902 6 = true := blkChk_join _ _ _ _ _ 3902 5 1 h4 okB3907
  exact h5
end E1.C236X
