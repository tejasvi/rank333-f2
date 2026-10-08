module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4060 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4061 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4062 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4063 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4064 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4065 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4066 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4067 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4068 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4069 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4070 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4071 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4072 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG431 : glueChkR lits W 4060 13 = true := by
  rw [← glueChkRN_eq lits W 7747 4060 lenT]; decide +kernel
theorem okM431 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 1 = true := okB4060
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 2 = true := blkChk_join _ _ _ _ _ 4060 1 1 h0 okB4061
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 3 = true := blkChk_join _ _ _ _ _ 4060 2 1 h1 okB4062
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 4 = true := blkChk_join _ _ _ _ _ 4060 3 1 h2 okB4063
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 5 = true := blkChk_join _ _ _ _ _ 4060 4 1 h3 okB4064
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 6 = true := blkChk_join _ _ _ _ _ 4060 5 1 h4 okB4065
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 7 = true := blkChk_join _ _ _ _ _ 4060 6 1 h5 okB4066
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 8 = true := blkChk_join _ _ _ _ _ 4060 7 1 h6 okB4067
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 9 = true := blkChk_join _ _ _ _ _ 4060 8 1 h7 okB4068
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 10 = true := blkChk_join _ _ _ _ _ 4060 9 1 h8 okB4069
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 11 = true := blkChk_join _ _ _ _ _ 4060 10 1 h9 okB4070
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 12 = true := blkChk_join _ _ _ _ _ 4060 11 1 h10 okB4071
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4060 13 = true := blkChk_join _ _ _ _ _ 4060 12 1 h11 okB4072
  exact h12
end E1.C284X
