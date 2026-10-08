module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6139 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6140 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6140 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6141 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6141 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6143 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6146 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6147 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6148 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6149 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG643 : glueChkR lits W 6139 11 = true := by
  rw [← glueChkRN_eq lits W 7747 6139 lenT]; decide +kernel
theorem okM643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 1 = true := okB6139
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 2 = true := blkChk_join _ _ _ _ _ 6139 1 1 h0 okB6140
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 3 = true := blkChk_join _ _ _ _ _ 6139 2 1 h1 okB6141
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 4 = true := blkChk_join _ _ _ _ _ 6139 3 1 h2 okB6142
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 5 = true := blkChk_join _ _ _ _ _ 6139 4 1 h3 okB6143
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 6 = true := blkChk_join _ _ _ _ _ 6139 5 1 h4 okB6144
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 7 = true := blkChk_join _ _ _ _ _ 6139 6 1 h5 okB6145
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 8 = true := blkChk_join _ _ _ _ _ 6139 7 1 h6 okB6146
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 9 = true := blkChk_join _ _ _ _ _ 6139 8 1 h7 okB6147
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 10 = true := blkChk_join _ _ _ _ _ 6139 9 1 h8 okB6148
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6139 11 = true := blkChk_join _ _ _ _ _ 6139 10 1 h9 okB6149
  exact h10
end E1.C284X
