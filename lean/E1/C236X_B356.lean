module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3672 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3673 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3674 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3675 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3676 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3677 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3678 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3679 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3680 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3681 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3682 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3683 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG356 : glueChkR lits W 3672 12 = true := by
  rw [← glueChkRN_eq lits W 8596 3672 lenT]; decide +kernel
theorem okM356 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 1 = true := okB3672
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 2 = true := blkChk_join _ _ _ _ _ 3672 1 1 h0 okB3673
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 3 = true := blkChk_join _ _ _ _ _ 3672 2 1 h1 okB3674
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 4 = true := blkChk_join _ _ _ _ _ 3672 3 1 h2 okB3675
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 5 = true := blkChk_join _ _ _ _ _ 3672 4 1 h3 okB3676
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 6 = true := blkChk_join _ _ _ _ _ 3672 5 1 h4 okB3677
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 7 = true := blkChk_join _ _ _ _ _ 3672 6 1 h5 okB3678
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 8 = true := blkChk_join _ _ _ _ _ 3672 7 1 h6 okB3679
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 9 = true := blkChk_join _ _ _ _ _ 3672 8 1 h7 okB3680
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 10 = true := blkChk_join _ _ _ _ _ 3672 9 1 h8 okB3681
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 11 = true := blkChk_join _ _ _ _ _ 3672 10 1 h9 okB3682
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3672 12 = true := blkChk_join _ _ _ _ _ 3672 11 1 h10 okB3683
  exact h11
end E1.C236X
