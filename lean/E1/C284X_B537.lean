module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5063 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5064 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5065 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5066 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5067 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG537 : glueChkR lits W 5063 5 = true := by
  rw [← glueChkRN_eq lits W 7747 5063 lenT]; decide +kernel
theorem okM537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 1 = true := okB5063
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 2 = true := blkChk_join _ _ _ _ _ 5063 1 1 h0 okB5064
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 3 = true := blkChk_join _ _ _ _ _ 5063 2 1 h1 okB5065
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 4 = true := blkChk_join _ _ _ _ _ 5063 3 1 h2 okB5066
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5063 5 = true := blkChk_join _ _ _ _ _ 5063 4 1 h3 okB5067
  exact h4
end E1.C284X
