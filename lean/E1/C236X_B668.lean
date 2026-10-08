module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7059 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7060 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7061 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7062 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7063 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7064 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7065 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7066 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7067 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG668 : glueChkR lits W 7059 9 = true := by
  rw [← glueChkRN_eq lits W 8596 7059 lenT]; decide +kernel
theorem okM668 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 1 = true := okB7059
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 2 = true := blkChk_join _ _ _ _ _ 7059 1 1 h0 okB7060
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 3 = true := blkChk_join _ _ _ _ _ 7059 2 1 h1 okB7061
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 4 = true := blkChk_join _ _ _ _ _ 7059 3 1 h2 okB7062
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 5 = true := blkChk_join _ _ _ _ _ 7059 4 1 h3 okB7063
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 6 = true := blkChk_join _ _ _ _ _ 7059 5 1 h4 okB7064
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 7 = true := blkChk_join _ _ _ _ _ 7059 6 1 h5 okB7065
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 8 = true := blkChk_join _ _ _ _ _ 7059 7 1 h6 okB7066
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7059 9 = true := blkChk_join _ _ _ _ _ 7059 8 1 h7 okB7067
  exact h8
end E1.C236X
