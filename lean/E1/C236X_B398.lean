module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4078 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4079 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4080 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4081 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4082 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4082 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4083 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4083 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4084 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4084 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG398 : glueChkR lits W 4078 7 = true := by
  rw [← glueChkRN_eq lits W 8596 4078 lenT]; decide +kernel
theorem okM398 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 1 = true := okB4078
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 2 = true := blkChk_join _ _ _ _ _ 4078 1 1 h0 okB4079
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 3 = true := blkChk_join _ _ _ _ _ 4078 2 1 h1 okB4080
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 4 = true := blkChk_join _ _ _ _ _ 4078 3 1 h2 okB4081
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 5 = true := blkChk_join _ _ _ _ _ 4078 4 1 h3 okB4082
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 6 = true := blkChk_join _ _ _ _ _ 4078 5 1 h4 okB4083
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4078 7 = true := blkChk_join _ _ _ _ _ 4078 6 1 h5 okB4084
  exact h6
end E1.C236X
