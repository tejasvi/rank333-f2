module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5048 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5049 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5049 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5050 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5050 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5051 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5051 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5052 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5052 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5053 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5053 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5054 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5054 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5055 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5055 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG535 : glueChkR lits W 5048 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5048 lenT]; decide +kernel
theorem okM535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 1 = true := okB5048
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 2 = true := blkChk_join _ _ _ _ _ 5048 1 1 h0 okB5049
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 3 = true := blkChk_join _ _ _ _ _ 5048 2 1 h1 okB5050
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 4 = true := blkChk_join _ _ _ _ _ 5048 3 1 h2 okB5051
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 5 = true := blkChk_join _ _ _ _ _ 5048 4 1 h3 okB5052
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 6 = true := blkChk_join _ _ _ _ _ 5048 5 1 h4 okB5053
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 7 = true := blkChk_join _ _ _ _ _ 5048 6 1 h5 okB5054
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5048 8 = true := blkChk_join _ _ _ _ _ 5048 7 1 h6 okB5055
  exact h7
end E1.C284X
