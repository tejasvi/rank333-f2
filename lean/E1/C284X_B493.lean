module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4666 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4667 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4667 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4668 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4669 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4670 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG493 : glueChkR lits W 4666 6 = true := by
  rw [← glueChkRN_eq lits W 7747 4666 lenT]; decide +kernel
theorem okM493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 1 = true := okB4666
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 2 = true := blkChk_join _ _ _ _ _ 4666 1 1 h0 okB4667
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 3 = true := blkChk_join _ _ _ _ _ 4666 2 1 h1 okB4668
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 4 = true := blkChk_join _ _ _ _ _ 4666 3 1 h2 okB4669
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 5 = true := blkChk_join _ _ _ _ _ 4666 4 1 h3 okB4670
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4666 6 = true := blkChk_join _ _ _ _ _ 4666 5 1 h4 okB4671
  exact h5
end E1.C284X
