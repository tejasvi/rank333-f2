module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6669 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6670 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6673 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG691 : glueChkR lits W 6669 12 = true := by
  rw [← glueChkRN_eq lits W 7747 6669 lenT]; decide +kernel
theorem okM691 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 1 = true := okB6669
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 2 = true := blkChk_join _ _ _ _ _ 6669 1 1 h0 okB6670
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 3 = true := blkChk_join _ _ _ _ _ 6669 2 1 h1 okB6671
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 4 = true := blkChk_join _ _ _ _ _ 6669 3 1 h2 okB6672
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 5 = true := blkChk_join _ _ _ _ _ 6669 4 1 h3 okB6673
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 6 = true := blkChk_join _ _ _ _ _ 6669 5 1 h4 okB6674
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 7 = true := blkChk_join _ _ _ _ _ 6669 6 1 h5 okB6675
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 8 = true := blkChk_join _ _ _ _ _ 6669 7 1 h6 okB6676
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 9 = true := blkChk_join _ _ _ _ _ 6669 8 1 h7 okB6677
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 10 = true := blkChk_join _ _ _ _ _ 6669 9 1 h8 okB6678
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 11 = true := blkChk_join _ _ _ _ _ 6669 10 1 h9 okB6679
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6669 12 = true := blkChk_join _ _ _ _ _ 6669 11 1 h10 okB6680
  exact h11
end E1.C284X
