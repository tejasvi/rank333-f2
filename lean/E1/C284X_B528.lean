module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4986 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4987 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4988 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4989 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4990 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4991 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4992 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4993 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4993 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4994 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG528 : glueChkR lits W 4986 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4986 lenT]; decide +kernel
theorem okM528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 1 = true := okB4986
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 2 = true := blkChk_join _ _ _ _ _ 4986 1 1 h0 okB4987
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 3 = true := blkChk_join _ _ _ _ _ 4986 2 1 h1 okB4988
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 4 = true := blkChk_join _ _ _ _ _ 4986 3 1 h2 okB4989
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 5 = true := blkChk_join _ _ _ _ _ 4986 4 1 h3 okB4990
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 6 = true := blkChk_join _ _ _ _ _ 4986 5 1 h4 okB4991
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 7 = true := blkChk_join _ _ _ _ _ 4986 6 1 h5 okB4992
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 8 = true := blkChk_join _ _ _ _ _ 4986 7 1 h6 okB4993
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4986 9 = true := blkChk_join _ _ _ _ _ 4986 8 1 h7 okB4994
  exact h8
end E1.C284X
