module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3197 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3198 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3198 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3199 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3199 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3200 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3200 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3201 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3201 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG313 : glueChkR lits W 3197 5 = true := by
  rw [← glueChkRN_eq lits W 8596 3197 lenT]; decide +kernel
theorem okM313 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 1 = true := okB3197
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 2 = true := blkChk_join _ _ _ _ _ 3197 1 1 h0 okB3198
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 3 = true := blkChk_join _ _ _ _ _ 3197 2 1 h1 okB3199
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 4 = true := blkChk_join _ _ _ _ _ 3197 3 1 h2 okB3200
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3197 5 = true := blkChk_join _ _ _ _ _ 3197 4 1 h3 okB3201
  exact h4
end E1.C236X
