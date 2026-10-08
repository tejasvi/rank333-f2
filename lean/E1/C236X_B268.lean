module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2735 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2736 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2736 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2737 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2737 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2738 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2738 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2739 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2739 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2740 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2740 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG268 : glueChkR lits W 2735 6 = true := by
  rw [← glueChkRN_eq lits W 8596 2735 lenT]; decide +kernel
theorem okM268 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 1 = true := okB2735
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 2 = true := blkChk_join _ _ _ _ _ 2735 1 1 h0 okB2736
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 3 = true := blkChk_join _ _ _ _ _ 2735 2 1 h1 okB2737
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 4 = true := blkChk_join _ _ _ _ _ 2735 3 1 h2 okB2738
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 5 = true := blkChk_join _ _ _ _ _ 2735 4 1 h3 okB2739
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2735 6 = true := blkChk_join _ _ _ _ _ 2735 5 1 h4 okB2740
  exact h5
end E1.C236X
