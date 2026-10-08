module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3110 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3111 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3111 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3112 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3112 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3113 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3113 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3114 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3114 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3115 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3115 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3116 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3116 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3117 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3117 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3118 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3118 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3119 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3119 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG333 : glueChkR lits W 3110 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3110 lenT]; decide +kernel
theorem okM333 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 1 = true := okB3110
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 2 = true := blkChk_join _ _ _ _ _ 3110 1 1 h0 okB3111
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 3 = true := blkChk_join _ _ _ _ _ 3110 2 1 h1 okB3112
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 4 = true := blkChk_join _ _ _ _ _ 3110 3 1 h2 okB3113
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 5 = true := blkChk_join _ _ _ _ _ 3110 4 1 h3 okB3114
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 6 = true := blkChk_join _ _ _ _ _ 3110 5 1 h4 okB3115
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 7 = true := blkChk_join _ _ _ _ _ 3110 6 1 h5 okB3116
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 8 = true := blkChk_join _ _ _ _ _ 3110 7 1 h6 okB3117
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 9 = true := blkChk_join _ _ _ _ _ 3110 8 1 h7 okB3118
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3110 10 = true := blkChk_join _ _ _ _ _ 3110 9 1 h8 okB3119
  exact h9
end E1.C284X
