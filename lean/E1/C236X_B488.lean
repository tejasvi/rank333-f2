module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4985 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4986 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4987 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4988 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4989 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4990 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4991 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4992 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4993 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4993 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4994 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4995 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4995 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4996 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4996 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG488 : glueChkR lits W 4985 12 = true := by
  rw [← glueChkRN_eq lits W 8596 4985 lenT]; decide +kernel
theorem okM488 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 1 = true := okB4985
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 2 = true := blkChk_join _ _ _ _ _ 4985 1 1 h0 okB4986
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 3 = true := blkChk_join _ _ _ _ _ 4985 2 1 h1 okB4987
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 4 = true := blkChk_join _ _ _ _ _ 4985 3 1 h2 okB4988
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 5 = true := blkChk_join _ _ _ _ _ 4985 4 1 h3 okB4989
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 6 = true := blkChk_join _ _ _ _ _ 4985 5 1 h4 okB4990
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 7 = true := blkChk_join _ _ _ _ _ 4985 6 1 h5 okB4991
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 8 = true := blkChk_join _ _ _ _ _ 4985 7 1 h6 okB4992
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 9 = true := blkChk_join _ _ _ _ _ 4985 8 1 h7 okB4993
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 10 = true := blkChk_join _ _ _ _ _ 4985 9 1 h8 okB4994
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 11 = true := blkChk_join _ _ _ _ _ 4985 10 1 h9 okB4995
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4985 12 = true := blkChk_join _ _ _ _ _ 4985 11 1 h10 okB4996
  exact h11
end E1.C236X
