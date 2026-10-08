module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7000 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7001 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7001 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7002 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7002 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7003 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7004 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7005 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7006 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7007 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7008 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG662 : glueChkR lits W 7000 9 = true := by
  rw [← glueChkRN_eq lits W 8596 7000 lenT]; decide +kernel
theorem okM662 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 1 = true := okB7000
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 2 = true := blkChk_join _ _ _ _ _ 7000 1 1 h0 okB7001
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 3 = true := blkChk_join _ _ _ _ _ 7000 2 1 h1 okB7002
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 4 = true := blkChk_join _ _ _ _ _ 7000 3 1 h2 okB7003
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 5 = true := blkChk_join _ _ _ _ _ 7000 4 1 h3 okB7004
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 6 = true := blkChk_join _ _ _ _ _ 7000 5 1 h4 okB7005
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 7 = true := blkChk_join _ _ _ _ _ 7000 6 1 h5 okB7006
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 8 = true := blkChk_join _ _ _ _ _ 7000 7 1 h6 okB7007
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7000 9 = true := blkChk_join _ _ _ _ _ 7000 8 1 h7 okB7008
  exact h8
end E1.C236X
