module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2143 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2146 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2147 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2148 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2149 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG236 : glueChkR lits W 2142 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2142 lenT]; decide +kernel
theorem okM236 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 1 = true := okB2142
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 2 = true := blkChk_join _ _ _ _ _ 2142 1 1 h0 okB2143
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 3 = true := blkChk_join _ _ _ _ _ 2142 2 1 h1 okB2144
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 4 = true := blkChk_join _ _ _ _ _ 2142 3 1 h2 okB2145
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 5 = true := blkChk_join _ _ _ _ _ 2142 4 1 h3 okB2146
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 6 = true := blkChk_join _ _ _ _ _ 2142 5 1 h4 okB2147
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 7 = true := blkChk_join _ _ _ _ _ 2142 6 1 h5 okB2148
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2142 8 = true := blkChk_join _ _ _ _ _ 2142 7 1 h6 okB2149
  exact h7
end E1.C284X
