module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2157 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2158 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2158 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2159 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2159 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2160 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2160 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2161 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2161 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2162 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2162 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2163 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2163 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG238 : glueChkR lits W 2157 7 = true := by
  rw [← glueChkRN_eq lits W 7747 2157 lenT]; decide +kernel
theorem okM238 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 1 = true := okB2157
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 2 = true := blkChk_join _ _ _ _ _ 2157 1 1 h0 okB2158
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 3 = true := blkChk_join _ _ _ _ _ 2157 2 1 h1 okB2159
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 4 = true := blkChk_join _ _ _ _ _ 2157 3 1 h2 okB2160
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 5 = true := blkChk_join _ _ _ _ _ 2157 4 1 h3 okB2161
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 6 = true := blkChk_join _ _ _ _ _ 2157 5 1 h4 okB2162
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2157 7 = true := blkChk_join _ _ _ _ _ 2157 6 1 h5 okB2163
  exact h6
end E1.C284X
