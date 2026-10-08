module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2689 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2690 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2690 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2691 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2691 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2692 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2692 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2693 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2693 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2694 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2694 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2695 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2695 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2696 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2696 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG263 : glueChkR lits W 2689 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2689 lenT]; decide +kernel
theorem okM263 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 1 = true := okB2689
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 2 = true := blkChk_join _ _ _ _ _ 2689 1 1 h0 okB2690
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 3 = true := blkChk_join _ _ _ _ _ 2689 2 1 h1 okB2691
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 4 = true := blkChk_join _ _ _ _ _ 2689 3 1 h2 okB2692
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 5 = true := blkChk_join _ _ _ _ _ 2689 4 1 h3 okB2693
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 6 = true := blkChk_join _ _ _ _ _ 2689 5 1 h4 okB2694
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 7 = true := blkChk_join _ _ _ _ _ 2689 6 1 h5 okB2695
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2689 8 = true := blkChk_join _ _ _ _ _ 2689 7 1 h6 okB2696
  exact h7
end E1.C236X
