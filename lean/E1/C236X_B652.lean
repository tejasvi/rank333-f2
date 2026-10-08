module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6896 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6897 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6898 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6899 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6900 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6901 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6902 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6903 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG652 : glueChkR lits W 6896 8 = true := by
  rw [← glueChkRN_eq lits W 8596 6896 lenT]; decide +kernel
theorem okM652 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 1 = true := okB6896
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 2 = true := blkChk_join _ _ _ _ _ 6896 1 1 h0 okB6897
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 3 = true := blkChk_join _ _ _ _ _ 6896 2 1 h1 okB6898
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 4 = true := blkChk_join _ _ _ _ _ 6896 3 1 h2 okB6899
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 5 = true := blkChk_join _ _ _ _ _ 6896 4 1 h3 okB6900
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 6 = true := blkChk_join _ _ _ _ _ 6896 5 1 h4 okB6901
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 7 = true := blkChk_join _ _ _ _ _ 6896 6 1 h5 okB6902
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6896 8 = true := blkChk_join _ _ _ _ _ 6896 7 1 h6 okB6903
  exact h7
end E1.C236X
