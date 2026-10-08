module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2785 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2786 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2786 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2787 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2787 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2788 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2788 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2789 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2789 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2790 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2790 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG303 : glueChkR lits W 2785 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2785 lenT]; decide +kernel
theorem okM303 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 1 = true := okB2785
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 2 = true := blkChk_join _ _ _ _ _ 2785 1 1 h0 okB2786
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 3 = true := blkChk_join _ _ _ _ _ 2785 2 1 h1 okB2787
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 4 = true := blkChk_join _ _ _ _ _ 2785 3 1 h2 okB2788
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 5 = true := blkChk_join _ _ _ _ _ 2785 4 1 h3 okB2789
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2785 6 = true := blkChk_join _ _ _ _ _ 2785 5 1 h4 okB2790
  exact h5
end E1.C284X
