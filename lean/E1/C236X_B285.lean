module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2893 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2894 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2895 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2896 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2897 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2898 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2899 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2900 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG285 : glueChkR lits W 2893 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2893 lenT]; decide +kernel
theorem okM285 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 1 = true := okB2893
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 2 = true := blkChk_join _ _ _ _ _ 2893 1 1 h0 okB2894
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 3 = true := blkChk_join _ _ _ _ _ 2893 2 1 h1 okB2895
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 4 = true := blkChk_join _ _ _ _ _ 2893 3 1 h2 okB2896
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 5 = true := blkChk_join _ _ _ _ _ 2893 4 1 h3 okB2897
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 6 = true := blkChk_join _ _ _ _ _ 2893 5 1 h4 okB2898
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 7 = true := blkChk_join _ _ _ _ _ 2893 6 1 h5 okB2899
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2893 8 = true := blkChk_join _ _ _ _ _ 2893 7 1 h6 okB2900
  exact h7
end E1.C236X
