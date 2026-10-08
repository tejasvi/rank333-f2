module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5128 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5129 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5129 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5130 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5130 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5131 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5131 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5132 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5132 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5133 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5133 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5134 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5134 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5135 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5135 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG546 : glueChkR lits W 5127 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5127 lenT]; decide +kernel
theorem okM546 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 1 = true := okB5127
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 2 = true := blkChk_join _ _ _ _ _ 5127 1 1 h0 okB5128
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 3 = true := blkChk_join _ _ _ _ _ 5127 2 1 h1 okB5129
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 4 = true := blkChk_join _ _ _ _ _ 5127 3 1 h2 okB5130
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 5 = true := blkChk_join _ _ _ _ _ 5127 4 1 h3 okB5131
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 6 = true := blkChk_join _ _ _ _ _ 5127 5 1 h4 okB5132
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 7 = true := blkChk_join _ _ _ _ _ 5127 6 1 h5 okB5133
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 8 = true := blkChk_join _ _ _ _ _ 5127 7 1 h6 okB5134
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5127 9 = true := blkChk_join _ _ _ _ _ 5127 8 1 h7 okB5135
  exact h8
end E1.C284X
