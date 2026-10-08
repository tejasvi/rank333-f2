module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2618 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2619 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2619 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2620 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2620 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2621 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2621 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2622 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2622 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2623 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2623 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2624 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2624 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2625 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2625 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2626 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2626 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2627 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2627 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2628 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2628 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2629 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2629 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG284 : glueChkR lits W 2618 12 = true := by
  rw [← glueChkRN_eq lits W 7747 2618 lenT]; decide +kernel
theorem okM284 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 1 = true := okB2618
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 2 = true := blkChk_join _ _ _ _ _ 2618 1 1 h0 okB2619
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 3 = true := blkChk_join _ _ _ _ _ 2618 2 1 h1 okB2620
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 4 = true := blkChk_join _ _ _ _ _ 2618 3 1 h2 okB2621
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 5 = true := blkChk_join _ _ _ _ _ 2618 4 1 h3 okB2622
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 6 = true := blkChk_join _ _ _ _ _ 2618 5 1 h4 okB2623
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 7 = true := blkChk_join _ _ _ _ _ 2618 6 1 h5 okB2624
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 8 = true := blkChk_join _ _ _ _ _ 2618 7 1 h6 okB2625
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 9 = true := blkChk_join _ _ _ _ _ 2618 8 1 h7 okB2626
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 10 = true := blkChk_join _ _ _ _ _ 2618 9 1 h8 okB2627
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 11 = true := blkChk_join _ _ _ _ _ 2618 10 1 h9 okB2628
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2618 12 = true := blkChk_join _ _ _ _ _ 2618 11 1 h10 okB2629
  exact h11
end E1.C284X
