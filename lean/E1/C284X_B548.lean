module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5146 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5147 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5148 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5149 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5150 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5150 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5151 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5151 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5152 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5152 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5153 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5153 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5154 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5154 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG548 : glueChkR lits W 5145 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5145 lenT]; decide +kernel
theorem okM548 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 1 = true := okB5145
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 2 = true := blkChk_join _ _ _ _ _ 5145 1 1 h0 okB5146
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 3 = true := blkChk_join _ _ _ _ _ 5145 2 1 h1 okB5147
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 4 = true := blkChk_join _ _ _ _ _ 5145 3 1 h2 okB5148
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 5 = true := blkChk_join _ _ _ _ _ 5145 4 1 h3 okB5149
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 6 = true := blkChk_join _ _ _ _ _ 5145 5 1 h4 okB5150
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 7 = true := blkChk_join _ _ _ _ _ 5145 6 1 h5 okB5151
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 8 = true := blkChk_join _ _ _ _ _ 5145 7 1 h6 okB5152
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 9 = true := blkChk_join _ _ _ _ _ 5145 8 1 h7 okB5153
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5145 10 = true := blkChk_join _ _ _ _ _ 5145 9 1 h8 okB5154
  exact h9
end E1.C284X
