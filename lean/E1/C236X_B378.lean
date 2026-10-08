module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3894 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3895 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3896 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3897 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3898 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3899 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3900 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3901 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG378 : glueChkR lits W 3894 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3894 lenT]; decide +kernel
theorem okM378 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 1 = true := okB3894
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 2 = true := blkChk_join _ _ _ _ _ 3894 1 1 h0 okB3895
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 3 = true := blkChk_join _ _ _ _ _ 3894 2 1 h1 okB3896
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 4 = true := blkChk_join _ _ _ _ _ 3894 3 1 h2 okB3897
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 5 = true := blkChk_join _ _ _ _ _ 3894 4 1 h3 okB3898
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 6 = true := blkChk_join _ _ _ _ _ 3894 5 1 h4 okB3899
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 7 = true := blkChk_join _ _ _ _ _ 3894 6 1 h5 okB3900
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3894 8 = true := blkChk_join _ _ _ _ _ 3894 7 1 h6 okB3901
  exact h7
end E1.C236X
