module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4053 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4054 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4054 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4055 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4055 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4056 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4057 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4058 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4059 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG430 : glueChkR lits W 4053 7 = true := by
  rw [← glueChkRN_eq lits W 7747 4053 lenT]; decide +kernel
theorem okM430 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 1 = true := okB4053
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 2 = true := blkChk_join _ _ _ _ _ 4053 1 1 h0 okB4054
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 3 = true := blkChk_join _ _ _ _ _ 4053 2 1 h1 okB4055
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 4 = true := blkChk_join _ _ _ _ _ 4053 3 1 h2 okB4056
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 5 = true := blkChk_join _ _ _ _ _ 4053 4 1 h3 okB4057
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 6 = true := blkChk_join _ _ _ _ _ 4053 5 1 h4 okB4058
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4053 7 = true := blkChk_join _ _ _ _ _ 4053 6 1 h5 okB4059
  exact h6
end E1.C284X
