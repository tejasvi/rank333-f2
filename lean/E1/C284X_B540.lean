module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5079 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5080 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5081 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5082 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5082 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5083 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5083 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG540 : glueChkR lits W 5079 5 = true := by
  rw [← glueChkRN_eq lits W 7747 5079 lenT]; decide +kernel
theorem okM540 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 1 = true := okB5079
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 2 = true := blkChk_join _ _ _ _ _ 5079 1 1 h0 okB5080
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 3 = true := blkChk_join _ _ _ _ _ 5079 2 1 h1 okB5081
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 4 = true := blkChk_join _ _ _ _ _ 5079 3 1 h2 okB5082
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5079 5 = true := blkChk_join _ _ _ _ _ 5079 4 1 h3 okB5083
  exact h4
end E1.C284X
