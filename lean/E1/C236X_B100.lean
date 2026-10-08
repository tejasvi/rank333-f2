module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1060 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1061 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1062 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1063 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1064 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1065 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1066 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1067 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG100 : glueChkR lits W 1060 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1060 lenT]; decide +kernel
theorem okM100 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 1 = true := okB1060
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 2 = true := blkChk_join _ _ _ _ _ 1060 1 1 h0 okB1061
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 3 = true := blkChk_join _ _ _ _ _ 1060 2 1 h1 okB1062
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 4 = true := blkChk_join _ _ _ _ _ 1060 3 1 h2 okB1063
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 5 = true := blkChk_join _ _ _ _ _ 1060 4 1 h3 okB1064
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 6 = true := blkChk_join _ _ _ _ _ 1060 5 1 h4 okB1065
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 7 = true := blkChk_join _ _ _ _ _ 1060 6 1 h5 okB1066
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1060 8 = true := blkChk_join _ _ _ _ _ 1060 7 1 h6 okB1067
  exact h7
end E1.C236X
