module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3684 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3685 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3686 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3687 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3687 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3688 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3688 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3689 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3689 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3690 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3690 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3691 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3691 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3692 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3692 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3693 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3693 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG357 : glueChkR lits W 3684 10 = true := by
  rw [← glueChkRN_eq lits W 8596 3684 lenT]; decide +kernel
theorem okM357 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 1 = true := okB3684
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 2 = true := blkChk_join _ _ _ _ _ 3684 1 1 h0 okB3685
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 3 = true := blkChk_join _ _ _ _ _ 3684 2 1 h1 okB3686
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 4 = true := blkChk_join _ _ _ _ _ 3684 3 1 h2 okB3687
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 5 = true := blkChk_join _ _ _ _ _ 3684 4 1 h3 okB3688
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 6 = true := blkChk_join _ _ _ _ _ 3684 5 1 h4 okB3689
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 7 = true := blkChk_join _ _ _ _ _ 3684 6 1 h5 okB3690
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 8 = true := blkChk_join _ _ _ _ _ 3684 7 1 h6 okB3691
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 9 = true := blkChk_join _ _ _ _ _ 3684 8 1 h7 okB3692
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3684 10 = true := blkChk_join _ _ _ _ _ 3684 9 1 h8 okB3693
  exact h9
end E1.C236X
