module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3890 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3891 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3892 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3893 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3894 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3895 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3896 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG409 : glueChkR lits W 3890 7 = true := by
  rw [← glueChkRN_eq lits W 7747 3890 lenT]; decide +kernel
theorem okM409 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 1 = true := okB3890
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 2 = true := blkChk_join _ _ _ _ _ 3890 1 1 h0 okB3891
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 3 = true := blkChk_join _ _ _ _ _ 3890 2 1 h1 okB3892
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 4 = true := blkChk_join _ _ _ _ _ 3890 3 1 h2 okB3893
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 5 = true := blkChk_join _ _ _ _ _ 3890 4 1 h3 okB3894
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 6 = true := blkChk_join _ _ _ _ _ 3890 5 1 h4 okB3895
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3890 7 = true := blkChk_join _ _ _ _ _ 3890 6 1 h5 okB3896
  exact h6
end E1.C284X
