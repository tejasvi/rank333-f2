module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6150 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6151 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6151 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6152 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6152 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6153 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6153 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6154 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6154 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6155 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6155 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6156 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6156 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6157 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6157 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6158 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6158 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6159 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6159 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG644 : glueChkR lits W 6150 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6150 lenT]; decide +kernel
theorem okM644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 1 = true := okB6150
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 2 = true := blkChk_join _ _ _ _ _ 6150 1 1 h0 okB6151
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 3 = true := blkChk_join _ _ _ _ _ 6150 2 1 h1 okB6152
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 4 = true := blkChk_join _ _ _ _ _ 6150 3 1 h2 okB6153
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 5 = true := blkChk_join _ _ _ _ _ 6150 4 1 h3 okB6154
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 6 = true := blkChk_join _ _ _ _ _ 6150 5 1 h4 okB6155
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 7 = true := blkChk_join _ _ _ _ _ 6150 6 1 h5 okB6156
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 8 = true := blkChk_join _ _ _ _ _ 6150 7 1 h6 okB6157
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 9 = true := blkChk_join _ _ _ _ _ 6150 8 1 h7 okB6158
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6150 10 = true := blkChk_join _ _ _ _ _ 6150 9 1 h8 okB6159
  exact h9
end E1.C284X
