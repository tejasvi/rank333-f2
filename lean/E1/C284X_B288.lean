module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2657 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2658 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2658 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2659 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2659 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2660 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2660 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2661 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2661 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG288 : glueChkR lits W 2657 5 = true := by
  rw [← glueChkRN_eq lits W 7747 2657 lenT]; decide +kernel
theorem okM288 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 1 = true := okB2657
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 2 = true := blkChk_join _ _ _ _ _ 2657 1 1 h0 okB2658
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 3 = true := blkChk_join _ _ _ _ _ 2657 2 1 h1 okB2659
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 4 = true := blkChk_join _ _ _ _ _ 2657 3 1 h2 okB2660
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2657 5 = true := blkChk_join _ _ _ _ _ 2657 4 1 h3 okB2661
  exact h4
end E1.C284X
