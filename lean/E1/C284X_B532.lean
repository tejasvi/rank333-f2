module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5021 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5022 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5022 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5023 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5023 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5024 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5024 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5025 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5025 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5026 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5026 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5027 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5027 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5028 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5029 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5030 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG532 : glueChkR lits W 5021 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5021 lenT]; decide +kernel
theorem okM532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 1 = true := okB5021
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 2 = true := blkChk_join _ _ _ _ _ 5021 1 1 h0 okB5022
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 3 = true := blkChk_join _ _ _ _ _ 5021 2 1 h1 okB5023
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 4 = true := blkChk_join _ _ _ _ _ 5021 3 1 h2 okB5024
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 5 = true := blkChk_join _ _ _ _ _ 5021 4 1 h3 okB5025
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 6 = true := blkChk_join _ _ _ _ _ 5021 5 1 h4 okB5026
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 7 = true := blkChk_join _ _ _ _ _ 5021 6 1 h5 okB5027
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 8 = true := blkChk_join _ _ _ _ _ 5021 7 1 h6 okB5028
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 9 = true := blkChk_join _ _ _ _ _ 5021 8 1 h7 okB5029
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5021 10 = true := blkChk_join _ _ _ _ _ 5021 9 1 h8 okB5030
  exact h9
end E1.C284X
