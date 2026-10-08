module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2642 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2643 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2644 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2645 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2645 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2646 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2646 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2647 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2647 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2648 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2648 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2649 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2649 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2650 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2650 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG258 : glueChkR lits W 2642 9 = true := by
  rw [← glueChkRN_eq lits W 8596 2642 lenT]; decide +kernel
theorem okM258 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 1 = true := okB2642
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 2 = true := blkChk_join _ _ _ _ _ 2642 1 1 h0 okB2643
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 3 = true := blkChk_join _ _ _ _ _ 2642 2 1 h1 okB2644
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 4 = true := blkChk_join _ _ _ _ _ 2642 3 1 h2 okB2645
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 5 = true := blkChk_join _ _ _ _ _ 2642 4 1 h3 okB2646
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 6 = true := blkChk_join _ _ _ _ _ 2642 5 1 h4 okB2647
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 7 = true := blkChk_join _ _ _ _ _ 2642 6 1 h5 okB2648
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 8 = true := blkChk_join _ _ _ _ _ 2642 7 1 h6 okB2649
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2642 9 = true := blkChk_join _ _ _ _ _ 2642 8 1 h7 okB2650
  exact h8
end E1.C236X
