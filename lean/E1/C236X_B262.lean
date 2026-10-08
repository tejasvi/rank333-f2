module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2681 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2682 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2683 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2684 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2685 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2686 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2687 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2687 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2688 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2688 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG262 : glueChkR lits W 2681 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2681 lenT]; decide +kernel
theorem okM262 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 1 = true := okB2681
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 2 = true := blkChk_join _ _ _ _ _ 2681 1 1 h0 okB2682
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 3 = true := blkChk_join _ _ _ _ _ 2681 2 1 h1 okB2683
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 4 = true := blkChk_join _ _ _ _ _ 2681 3 1 h2 okB2684
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 5 = true := blkChk_join _ _ _ _ _ 2681 4 1 h3 okB2685
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 6 = true := blkChk_join _ _ _ _ _ 2681 5 1 h4 okB2686
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 7 = true := blkChk_join _ _ _ _ _ 2681 6 1 h5 okB2687
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2681 8 = true := blkChk_join _ _ _ _ _ 2681 7 1 h6 okB2688
  exact h7
end E1.C236X
