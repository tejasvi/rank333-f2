module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6160 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6161 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6161 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6162 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6162 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6163 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6163 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6164 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6164 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6165 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6165 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6166 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6166 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6167 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6167 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6168 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6168 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6169 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6169 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG645 : glueChkR lits W 6160 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6160 lenT]; decide +kernel
theorem okM645 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 1 = true := okB6160
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 2 = true := blkChk_join _ _ _ _ _ 6160 1 1 h0 okB6161
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 3 = true := blkChk_join _ _ _ _ _ 6160 2 1 h1 okB6162
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 4 = true := blkChk_join _ _ _ _ _ 6160 3 1 h2 okB6163
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 5 = true := blkChk_join _ _ _ _ _ 6160 4 1 h3 okB6164
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 6 = true := blkChk_join _ _ _ _ _ 6160 5 1 h4 okB6165
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 7 = true := blkChk_join _ _ _ _ _ 6160 6 1 h5 okB6166
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 8 = true := blkChk_join _ _ _ _ _ 6160 7 1 h6 okB6167
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 9 = true := blkChk_join _ _ _ _ _ 6160 8 1 h7 okB6168
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6160 10 = true := blkChk_join _ _ _ _ _ 6160 9 1 h8 okB6169
  exact h9
end E1.C284X
