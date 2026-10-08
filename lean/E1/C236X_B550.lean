module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5675 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5676 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5677 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5678 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5679 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5680 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5681 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5682 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5683 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5684 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG550 : glueChkR lits W 5675 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5675 lenT]; decide +kernel
theorem okM550 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 1 = true := okB5675
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 2 = true := blkChk_join _ _ _ _ _ 5675 1 1 h0 okB5676
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 3 = true := blkChk_join _ _ _ _ _ 5675 2 1 h1 okB5677
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 4 = true := blkChk_join _ _ _ _ _ 5675 3 1 h2 okB5678
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 5 = true := blkChk_join _ _ _ _ _ 5675 4 1 h3 okB5679
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 6 = true := blkChk_join _ _ _ _ _ 5675 5 1 h4 okB5680
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 7 = true := blkChk_join _ _ _ _ _ 5675 6 1 h5 okB5681
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 8 = true := blkChk_join _ _ _ _ _ 5675 7 1 h6 okB5682
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 9 = true := blkChk_join _ _ _ _ _ 5675 8 1 h7 okB5683
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5675 10 = true := blkChk_join _ _ _ _ _ 5675 9 1 h8 okB5684
  exact h9
end E1.C236X
