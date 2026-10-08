module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4611 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4612 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4613 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4613 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4614 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4614 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4615 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4615 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4616 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4616 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4617 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4617 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4618 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4618 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4619 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4619 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG487 : glueChkR lits W 4610 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4610 lenT]; decide +kernel
theorem okM487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 1 = true := okB4610
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 2 = true := blkChk_join _ _ _ _ _ 4610 1 1 h0 okB4611
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 3 = true := blkChk_join _ _ _ _ _ 4610 2 1 h1 okB4612
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 4 = true := blkChk_join _ _ _ _ _ 4610 3 1 h2 okB4613
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 5 = true := blkChk_join _ _ _ _ _ 4610 4 1 h3 okB4614
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 6 = true := blkChk_join _ _ _ _ _ 4610 5 1 h4 okB4615
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 7 = true := blkChk_join _ _ _ _ _ 4610 6 1 h5 okB4616
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 8 = true := blkChk_join _ _ _ _ _ 4610 7 1 h6 okB4617
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 9 = true := blkChk_join _ _ _ _ _ 4610 8 1 h7 okB4618
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4610 10 = true := blkChk_join _ _ _ _ _ 4610 9 1 h8 okB4619
  exact h9
end E1.C284X
