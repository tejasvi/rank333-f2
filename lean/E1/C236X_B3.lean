module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB35 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB36 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 36 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB37 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 37 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB38 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 38 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB39 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 39 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB40 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 40 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB41 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 41 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB42 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 42 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB43 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 43 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB44 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 44 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB45 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 45 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG3 : glueChkR lits W 35 11 = true := by
  rw [← glueChkRN_eq lits W 8596 35 lenT]; decide +kernel
theorem okM3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 1 = true := okB35
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 2 = true := blkChk_join _ _ _ _ _ 35 1 1 h0 okB36
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 3 = true := blkChk_join _ _ _ _ _ 35 2 1 h1 okB37
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 4 = true := blkChk_join _ _ _ _ _ 35 3 1 h2 okB38
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 5 = true := blkChk_join _ _ _ _ _ 35 4 1 h3 okB39
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 6 = true := blkChk_join _ _ _ _ _ 35 5 1 h4 okB40
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 7 = true := blkChk_join _ _ _ _ _ 35 6 1 h5 okB41
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 8 = true := blkChk_join _ _ _ _ _ 35 7 1 h6 okB42
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 9 = true := blkChk_join _ _ _ _ _ 35 8 1 h7 okB43
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 10 = true := blkChk_join _ _ _ _ _ 35 9 1 h8 okB44
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 35 11 = true := blkChk_join _ _ _ _ _ 35 10 1 h9 okB45
  exact h10
end E1.C236X
