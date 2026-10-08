module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3023 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3024 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3024 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3025 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3025 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3026 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3026 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3027 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3027 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3028 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3029 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3030 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3031 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3032 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG326 : glueChkR lits W 3023 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3023 lenT]; decide +kernel
theorem okM326 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 1 = true := okB3023
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 2 = true := blkChk_join _ _ _ _ _ 3023 1 1 h0 okB3024
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 3 = true := blkChk_join _ _ _ _ _ 3023 2 1 h1 okB3025
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 4 = true := blkChk_join _ _ _ _ _ 3023 3 1 h2 okB3026
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 5 = true := blkChk_join _ _ _ _ _ 3023 4 1 h3 okB3027
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 6 = true := blkChk_join _ _ _ _ _ 3023 5 1 h4 okB3028
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 7 = true := blkChk_join _ _ _ _ _ 3023 6 1 h5 okB3029
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 8 = true := blkChk_join _ _ _ _ _ 3023 7 1 h6 okB3030
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 9 = true := blkChk_join _ _ _ _ _ 3023 8 1 h7 okB3031
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3023 10 = true := blkChk_join _ _ _ _ _ 3023 9 1 h8 okB3032
  exact h9
end E1.C284X
