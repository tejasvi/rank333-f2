module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1981 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1982 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1983 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1984 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1985 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1986 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG218 : glueChkR lits W 1980 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1980 lenT]; decide +kernel
theorem okM218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 1 = true := okB1980
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 2 = true := blkChk_join _ _ _ _ _ 1980 1 1 h0 okB1981
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 3 = true := blkChk_join _ _ _ _ _ 1980 2 1 h1 okB1982
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 4 = true := blkChk_join _ _ _ _ _ 1980 3 1 h2 okB1983
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 5 = true := blkChk_join _ _ _ _ _ 1980 4 1 h3 okB1984
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 6 = true := blkChk_join _ _ _ _ _ 1980 5 1 h4 okB1985
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1980 7 = true := blkChk_join _ _ _ _ _ 1980 6 1 h5 okB1986
  exact h6
end E1.C284X
