module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2133 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2134 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2134 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2135 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2135 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2136 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2136 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2137 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2137 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2138 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2138 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2139 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2139 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2140 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2140 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2141 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2141 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG235 : glueChkR lits W 2133 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2133 lenT]; decide +kernel
theorem okM235 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 1 = true := okB2133
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 2 = true := blkChk_join _ _ _ _ _ 2133 1 1 h0 okB2134
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 3 = true := blkChk_join _ _ _ _ _ 2133 2 1 h1 okB2135
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 4 = true := blkChk_join _ _ _ _ _ 2133 3 1 h2 okB2136
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 5 = true := blkChk_join _ _ _ _ _ 2133 4 1 h3 okB2137
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 6 = true := blkChk_join _ _ _ _ _ 2133 5 1 h4 okB2138
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 7 = true := blkChk_join _ _ _ _ _ 2133 6 1 h5 okB2139
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 8 = true := blkChk_join _ _ _ _ _ 2133 7 1 h6 okB2140
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2133 9 = true := blkChk_join _ _ _ _ _ 2133 8 1 h7 okB2141
  exact h8
end E1.C284X
