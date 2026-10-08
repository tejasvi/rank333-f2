module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4093 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4094 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4094 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4095 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4095 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4096 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4096 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4097 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4097 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4098 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4098 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4099 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4099 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4100 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4101 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG435 : glueChkR lits W 4093 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4093 lenT]; decide +kernel
theorem okM435 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 1 = true := okB4093
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 2 = true := blkChk_join _ _ _ _ _ 4093 1 1 h0 okB4094
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 3 = true := blkChk_join _ _ _ _ _ 4093 2 1 h1 okB4095
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 4 = true := blkChk_join _ _ _ _ _ 4093 3 1 h2 okB4096
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 5 = true := blkChk_join _ _ _ _ _ 4093 4 1 h3 okB4097
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 6 = true := blkChk_join _ _ _ _ _ 4093 5 1 h4 okB4098
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 7 = true := blkChk_join _ _ _ _ _ 4093 6 1 h5 okB4099
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 8 = true := blkChk_join _ _ _ _ _ 4093 7 1 h6 okB4100
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4093 9 = true := blkChk_join _ _ _ _ _ 4093 8 1 h7 okB4101
  exact h8
end E1.C284X
