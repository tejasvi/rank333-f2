module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4008 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4009 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4010 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4011 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4012 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4013 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4014 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4015 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG390 : glueChkR lits W 4008 8 = true := by
  rw [← glueChkRN_eq lits W 8596 4008 lenT]; decide +kernel
theorem okM390 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 1 = true := okB4008
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 2 = true := blkChk_join _ _ _ _ _ 4008 1 1 h0 okB4009
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 3 = true := blkChk_join _ _ _ _ _ 4008 2 1 h1 okB4010
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 4 = true := blkChk_join _ _ _ _ _ 4008 3 1 h2 okB4011
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 5 = true := blkChk_join _ _ _ _ _ 4008 4 1 h3 okB4012
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 6 = true := blkChk_join _ _ _ _ _ 4008 5 1 h4 okB4013
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 7 = true := blkChk_join _ _ _ _ _ 4008 6 1 h5 okB4014
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4008 8 = true := blkChk_join _ _ _ _ _ 4008 7 1 h6 okB4015
  exact h7
end E1.C236X
