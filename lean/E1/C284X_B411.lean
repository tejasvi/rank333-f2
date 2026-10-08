module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3903 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3904 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3905 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3906 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3907 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3908 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3909 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3910 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3911 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3912 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG411 : glueChkR lits W 3903 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3903 lenT]; decide +kernel
theorem okM411 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 1 = true := okB3903
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 2 = true := blkChk_join _ _ _ _ _ 3903 1 1 h0 okB3904
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 3 = true := blkChk_join _ _ _ _ _ 3903 2 1 h1 okB3905
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 4 = true := blkChk_join _ _ _ _ _ 3903 3 1 h2 okB3906
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 5 = true := blkChk_join _ _ _ _ _ 3903 4 1 h3 okB3907
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 6 = true := blkChk_join _ _ _ _ _ 3903 5 1 h4 okB3908
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 7 = true := blkChk_join _ _ _ _ _ 3903 6 1 h5 okB3909
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 8 = true := blkChk_join _ _ _ _ _ 3903 7 1 h6 okB3910
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 9 = true := blkChk_join _ _ _ _ _ 3903 8 1 h7 okB3911
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3903 10 = true := blkChk_join _ _ _ _ _ 3903 9 1 h8 okB3912
  exact h9
end E1.C284X
