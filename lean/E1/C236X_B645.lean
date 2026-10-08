module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6839 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6840 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6840 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6841 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6841 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6842 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6842 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6843 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6843 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6844 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6844 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6845 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6845 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG645 : glueChkR lits W 6839 7 = true := by
  rw [← glueChkRN_eq lits W 8596 6839 lenT]; decide +kernel
theorem okM645 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 1 = true := okB6839
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 2 = true := blkChk_join _ _ _ _ _ 6839 1 1 h0 okB6840
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 3 = true := blkChk_join _ _ _ _ _ 6839 2 1 h1 okB6841
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 4 = true := blkChk_join _ _ _ _ _ 6839 3 1 h2 okB6842
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 5 = true := blkChk_join _ _ _ _ _ 6839 4 1 h3 okB6843
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 6 = true := blkChk_join _ _ _ _ _ 6839 5 1 h4 okB6844
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6839 7 = true := blkChk_join _ _ _ _ _ 6839 6 1 h5 okB6845
  exact h6
end E1.C236X
