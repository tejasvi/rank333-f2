module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6189 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6190 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6190 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6191 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6191 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6192 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6192 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6193 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6193 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6194 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6194 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6195 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6195 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6196 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6196 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6197 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6197 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG648 : glueChkR lits W 6189 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6189 lenT]; decide +kernel
theorem okM648 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 1 = true := okB6189
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 2 = true := blkChk_join _ _ _ _ _ 6189 1 1 h0 okB6190
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 3 = true := blkChk_join _ _ _ _ _ 6189 2 1 h1 okB6191
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 4 = true := blkChk_join _ _ _ _ _ 6189 3 1 h2 okB6192
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 5 = true := blkChk_join _ _ _ _ _ 6189 4 1 h3 okB6193
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 6 = true := blkChk_join _ _ _ _ _ 6189 5 1 h4 okB6194
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 7 = true := blkChk_join _ _ _ _ _ 6189 6 1 h5 okB6195
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 8 = true := blkChk_join _ _ _ _ _ 6189 7 1 h6 okB6196
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6189 9 = true := blkChk_join _ _ _ _ _ 6189 8 1 h7 okB6197
  exact h8
end E1.C284X
