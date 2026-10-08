module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4027 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4028 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4029 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4030 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4031 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4032 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4033 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4034 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4035 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG427 : glueChkR lits W 4027 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4027 lenT]; decide +kernel
theorem okM427 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 1 = true := okB4027
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 2 = true := blkChk_join _ _ _ _ _ 4027 1 1 h0 okB4028
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 3 = true := blkChk_join _ _ _ _ _ 4027 2 1 h1 okB4029
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 4 = true := blkChk_join _ _ _ _ _ 4027 3 1 h2 okB4030
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 5 = true := blkChk_join _ _ _ _ _ 4027 4 1 h3 okB4031
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 6 = true := blkChk_join _ _ _ _ _ 4027 5 1 h4 okB4032
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 7 = true := blkChk_join _ _ _ _ _ 4027 6 1 h5 okB4033
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 8 = true := blkChk_join _ _ _ _ _ 4027 7 1 h6 okB4034
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4027 9 = true := blkChk_join _ _ _ _ _ 4027 8 1 h7 okB4035
  exact h8
end E1.C284X
