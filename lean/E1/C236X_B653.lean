module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6904 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6905 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6906 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6907 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6908 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6909 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6910 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6911 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6912 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG653 : glueChkR lits W 6904 9 = true := by
  rw [← glueChkRN_eq lits W 8596 6904 lenT]; decide +kernel
theorem okM653 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 1 = true := okB6904
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 2 = true := blkChk_join _ _ _ _ _ 6904 1 1 h0 okB6905
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 3 = true := blkChk_join _ _ _ _ _ 6904 2 1 h1 okB6906
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 4 = true := blkChk_join _ _ _ _ _ 6904 3 1 h2 okB6907
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 5 = true := blkChk_join _ _ _ _ _ 6904 4 1 h3 okB6908
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 6 = true := blkChk_join _ _ _ _ _ 6904 5 1 h4 okB6909
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 7 = true := blkChk_join _ _ _ _ _ 6904 6 1 h5 okB6910
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 8 = true := blkChk_join _ _ _ _ _ 6904 7 1 h6 okB6911
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6904 9 = true := blkChk_join _ _ _ _ _ 6904 8 1 h7 okB6912
  exact h8
end E1.C236X
