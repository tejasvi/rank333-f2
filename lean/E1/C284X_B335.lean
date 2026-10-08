module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3132 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3133 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3133 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3134 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3134 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3135 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3135 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3136 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3136 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3137 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3137 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3138 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3138 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3139 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3139 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG335 : glueChkR lits W 3132 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3132 lenT]; decide +kernel
theorem okM335 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 1 = true := okB3132
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 2 = true := blkChk_join _ _ _ _ _ 3132 1 1 h0 okB3133
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 3 = true := blkChk_join _ _ _ _ _ 3132 2 1 h1 okB3134
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 4 = true := blkChk_join _ _ _ _ _ 3132 3 1 h2 okB3135
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 5 = true := blkChk_join _ _ _ _ _ 3132 4 1 h3 okB3136
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 6 = true := blkChk_join _ _ _ _ _ 3132 5 1 h4 okB3137
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 7 = true := blkChk_join _ _ _ _ _ 3132 6 1 h5 okB3138
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3132 8 = true := blkChk_join _ _ _ _ _ 3132 7 1 h6 okB3139
  exact h7
end E1.C284X
