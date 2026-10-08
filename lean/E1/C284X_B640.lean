module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6110 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6111 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6111 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6112 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6112 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6113 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6113 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6114 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6114 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6115 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6115 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG640 : glueChkR lits W 6110 6 = true := by
  rw [← glueChkRN_eq lits W 7747 6110 lenT]; decide +kernel
theorem okM640 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 1 = true := okB6110
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 2 = true := blkChk_join _ _ _ _ _ 6110 1 1 h0 okB6111
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 3 = true := blkChk_join _ _ _ _ _ 6110 2 1 h1 okB6112
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 4 = true := blkChk_join _ _ _ _ _ 6110 3 1 h2 okB6113
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 5 = true := blkChk_join _ _ _ _ _ 6110 4 1 h3 okB6114
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6110 6 = true := blkChk_join _ _ _ _ _ 6110 5 1 h4 okB6115
  exact h5
end E1.C284X
