module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5665 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5666 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5666 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5667 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5667 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5668 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5669 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5670 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5671 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5672 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5673 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5674 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG549 : glueChkR lits W 5665 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5665 lenT]; decide +kernel
theorem okM549 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 1 = true := okB5665
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 2 = true := blkChk_join _ _ _ _ _ 5665 1 1 h0 okB5666
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 3 = true := blkChk_join _ _ _ _ _ 5665 2 1 h1 okB5667
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 4 = true := blkChk_join _ _ _ _ _ 5665 3 1 h2 okB5668
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 5 = true := blkChk_join _ _ _ _ _ 5665 4 1 h3 okB5669
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 6 = true := blkChk_join _ _ _ _ _ 5665 5 1 h4 okB5670
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 7 = true := blkChk_join _ _ _ _ _ 5665 6 1 h5 okB5671
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 8 = true := blkChk_join _ _ _ _ _ 5665 7 1 h6 okB5672
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 9 = true := blkChk_join _ _ _ _ _ 5665 8 1 h7 okB5673
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5665 10 = true := blkChk_join _ _ _ _ _ 5665 9 1 h8 okB5674
  exact h9
end E1.C236X
