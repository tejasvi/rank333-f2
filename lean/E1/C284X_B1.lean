module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB16 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB17 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 17 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB18 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 18 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB19 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 19 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB20 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 20 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB21 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 21 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB22 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 22 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB23 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 23 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG1 : glueChkR lits W 16 8 = true := by
  rw [← glueChkRN_eq lits W 7747 16 lenT]; decide +kernel
theorem okM1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 1 = true := okB16
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 2 = true := blkChk_join _ _ _ _ _ 16 1 1 h0 okB17
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 3 = true := blkChk_join _ _ _ _ _ 16 2 1 h1 okB18
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 4 = true := blkChk_join _ _ _ _ _ 16 3 1 h2 okB19
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 5 = true := blkChk_join _ _ _ _ _ 16 4 1 h3 okB20
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 6 = true := blkChk_join _ _ _ _ _ 16 5 1 h4 okB21
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 7 = true := blkChk_join _ _ _ _ _ 16 6 1 h5 okB22
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 16 8 = true := blkChk_join _ _ _ _ _ 16 7 1 h6 okB23
  exact h7
end E1.C284X
