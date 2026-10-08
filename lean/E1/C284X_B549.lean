module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5155 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5156 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5156 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5157 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5157 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5158 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5158 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5159 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5159 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5160 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5160 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5161 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5161 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5162 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5162 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG549 : glueChkR lits W 5155 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5155 lenT]; decide +kernel
theorem okM549 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 1 = true := okB5155
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 2 = true := blkChk_join _ _ _ _ _ 5155 1 1 h0 okB5156
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 3 = true := blkChk_join _ _ _ _ _ 5155 2 1 h1 okB5157
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 4 = true := blkChk_join _ _ _ _ _ 5155 3 1 h2 okB5158
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 5 = true := blkChk_join _ _ _ _ _ 5155 4 1 h3 okB5159
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 6 = true := blkChk_join _ _ _ _ _ 5155 5 1 h4 okB5160
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 7 = true := blkChk_join _ _ _ _ _ 5155 6 1 h5 okB5161
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5155 8 = true := blkChk_join _ _ _ _ _ 5155 7 1 h6 okB5162
  exact h7
end E1.C284X
