module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1022 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1023 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1023 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1024 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1024 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1025 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1025 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1026 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1026 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1027 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1027 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1028 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG109 : glueChkR lits W 1022 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1022 lenT]; decide +kernel
theorem okM109 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 1 = true := okB1022
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 2 = true := blkChk_join _ _ _ _ _ 1022 1 1 h0 okB1023
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 3 = true := blkChk_join _ _ _ _ _ 1022 2 1 h1 okB1024
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 4 = true := blkChk_join _ _ _ _ _ 1022 3 1 h2 okB1025
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 5 = true := blkChk_join _ _ _ _ _ 1022 4 1 h3 okB1026
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 6 = true := blkChk_join _ _ _ _ _ 1022 5 1 h4 okB1027
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1022 7 = true := blkChk_join _ _ _ _ _ 1022 6 1 h5 okB1028
  exact h6
end E1.C284X
