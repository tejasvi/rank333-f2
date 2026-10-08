module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4950 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4951 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4952 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4953 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4954 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4955 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG524 : glueChkR lits W 4950 6 = true := by
  rw [← glueChkRN_eq lits W 7747 4950 lenT]; decide +kernel
theorem okM524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 1 = true := okB4950
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 2 = true := blkChk_join _ _ _ _ _ 4950 1 1 h0 okB4951
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 3 = true := blkChk_join _ _ _ _ _ 4950 2 1 h1 okB4952
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 4 = true := blkChk_join _ _ _ _ _ 4950 3 1 h2 okB4953
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 5 = true := blkChk_join _ _ _ _ _ 4950 4 1 h3 okB4954
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4950 6 = true := blkChk_join _ _ _ _ _ 4950 5 1 h4 okB4955
  exact h5
end E1.C284X
