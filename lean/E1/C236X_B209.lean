module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2140 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2141 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2141 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2142 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2143 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2144 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2145 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2146 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2147 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2148 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2149 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG209 : glueChkR lits W 2140 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2140 lenT]; decide +kernel
theorem okM209 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 1 = true := okB2140
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 2 = true := blkChk_join _ _ _ _ _ 2140 1 1 h0 okB2141
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 3 = true := blkChk_join _ _ _ _ _ 2140 2 1 h1 okB2142
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 4 = true := blkChk_join _ _ _ _ _ 2140 3 1 h2 okB2143
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 5 = true := blkChk_join _ _ _ _ _ 2140 4 1 h3 okB2144
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 6 = true := blkChk_join _ _ _ _ _ 2140 5 1 h4 okB2145
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 7 = true := blkChk_join _ _ _ _ _ 2140 6 1 h5 okB2146
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 8 = true := blkChk_join _ _ _ _ _ 2140 7 1 h6 okB2147
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 9 = true := blkChk_join _ _ _ _ _ 2140 8 1 h7 okB2148
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2140 10 = true := blkChk_join _ _ _ _ _ 2140 9 1 h8 okB2149
  exact h9
end E1.C236X
