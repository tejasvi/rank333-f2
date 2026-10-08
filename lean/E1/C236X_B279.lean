module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2842 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2843 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2843 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2844 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2844 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2845 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2845 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2846 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2846 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG279 : glueChkR lits W 2842 5 = true := by
  rw [← glueChkRN_eq lits W 8596 2842 lenT]; decide +kernel
theorem okM279 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 1 = true := okB2842
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 2 = true := blkChk_join _ _ _ _ _ 2842 1 1 h0 okB2843
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 3 = true := blkChk_join _ _ _ _ _ 2842 2 1 h1 okB2844
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 4 = true := blkChk_join _ _ _ _ _ 2842 3 1 h2 okB2845
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2842 5 = true := blkChk_join _ _ _ _ _ 2842 4 1 h3 okB2846
  exact h4
end E1.C236X
