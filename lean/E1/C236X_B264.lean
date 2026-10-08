module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2697 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2698 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2699 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2700 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2701 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2702 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2703 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2704 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2705 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2706 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG264 : glueChkR lits W 2697 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2697 lenT]; decide +kernel
theorem okM264 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 1 = true := okB2697
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 2 = true := blkChk_join _ _ _ _ _ 2697 1 1 h0 okB2698
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 3 = true := blkChk_join _ _ _ _ _ 2697 2 1 h1 okB2699
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 4 = true := blkChk_join _ _ _ _ _ 2697 3 1 h2 okB2700
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 5 = true := blkChk_join _ _ _ _ _ 2697 4 1 h3 okB2701
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 6 = true := blkChk_join _ _ _ _ _ 2697 5 1 h4 okB2702
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 7 = true := blkChk_join _ _ _ _ _ 2697 6 1 h5 okB2703
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 8 = true := blkChk_join _ _ _ _ _ 2697 7 1 h6 okB2704
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 9 = true := blkChk_join _ _ _ _ _ 2697 8 1 h7 okB2705
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2697 10 = true := blkChk_join _ _ _ _ _ 2697 9 1 h8 okB2706
  exact h9
end E1.C236X
