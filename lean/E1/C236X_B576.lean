module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5985 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5986 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5987 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5988 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5989 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5990 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5991 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5992 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG576 : glueChkR lits W 5985 8 = true := by
  rw [← glueChkRN_eq lits W 8596 5985 lenT]; decide +kernel
theorem okM576 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 1 = true := okB5985
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 2 = true := blkChk_join _ _ _ _ _ 5985 1 1 h0 okB5986
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 3 = true := blkChk_join _ _ _ _ _ 5985 2 1 h1 okB5987
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 4 = true := blkChk_join _ _ _ _ _ 5985 3 1 h2 okB5988
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 5 = true := blkChk_join _ _ _ _ _ 5985 4 1 h3 okB5989
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 6 = true := blkChk_join _ _ _ _ _ 5985 5 1 h4 okB5990
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 7 = true := blkChk_join _ _ _ _ _ 5985 6 1 h5 okB5991
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5985 8 = true := blkChk_join _ _ _ _ _ 5985 7 1 h6 okB5992
  exact h7
end E1.C236X
