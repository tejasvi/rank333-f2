module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2175 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2176 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2177 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2177 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2178 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2178 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2179 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2179 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2180 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2180 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2181 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2181 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2182 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2182 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG240 : glueChkR lits W 2175 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2175 lenT]; decide +kernel
theorem okM240 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 1 = true := okB2175
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 2 = true := blkChk_join _ _ _ _ _ 2175 1 1 h0 okB2176
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 3 = true := blkChk_join _ _ _ _ _ 2175 2 1 h1 okB2177
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 4 = true := blkChk_join _ _ _ _ _ 2175 3 1 h2 okB2178
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 5 = true := blkChk_join _ _ _ _ _ 2175 4 1 h3 okB2179
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 6 = true := blkChk_join _ _ _ _ _ 2175 5 1 h4 okB2180
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 7 = true := blkChk_join _ _ _ _ _ 2175 6 1 h5 okB2181
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2175 8 = true := blkChk_join _ _ _ _ _ 2175 7 1 h6 okB2182
  exact h7
end E1.C284X
