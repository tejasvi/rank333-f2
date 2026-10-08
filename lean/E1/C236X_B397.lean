module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4073 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4074 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4075 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4076 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4077 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG397 : glueChkR lits W 4073 5 = true := by
  rw [← glueChkRN_eq lits W 8596 4073 lenT]; decide +kernel
theorem okM397 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 1 = true := okB4073
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 2 = true := blkChk_join _ _ _ _ _ 4073 1 1 h0 okB4074
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 3 = true := blkChk_join _ _ _ _ _ 4073 2 1 h1 okB4075
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 4 = true := blkChk_join _ _ _ _ _ 4073 3 1 h2 okB4076
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4073 5 = true := blkChk_join _ _ _ _ _ 4073 4 1 h3 okB4077
  exact h4
end E1.C236X
