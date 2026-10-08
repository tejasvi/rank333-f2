module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5095 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5096 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5096 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5097 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5097 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5098 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5098 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5099 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5099 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5100 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5101 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5102 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5103 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG497 : glueChkR lits W 5095 9 = true := by
  rw [← glueChkRN_eq lits W 8596 5095 lenT]; decide +kernel
theorem okM497 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 1 = true := okB5095
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 2 = true := blkChk_join _ _ _ _ _ 5095 1 1 h0 okB5096
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 3 = true := blkChk_join _ _ _ _ _ 5095 2 1 h1 okB5097
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 4 = true := blkChk_join _ _ _ _ _ 5095 3 1 h2 okB5098
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 5 = true := blkChk_join _ _ _ _ _ 5095 4 1 h3 okB5099
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 6 = true := blkChk_join _ _ _ _ _ 5095 5 1 h4 okB5100
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 7 = true := blkChk_join _ _ _ _ _ 5095 6 1 h5 okB5101
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 8 = true := blkChk_join _ _ _ _ _ 5095 7 1 h6 okB5102
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5095 9 = true := blkChk_join _ _ _ _ _ 5095 8 1 h7 okB5103
  exact h8
end E1.C236X
