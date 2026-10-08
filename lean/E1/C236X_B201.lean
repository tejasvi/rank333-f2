module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2067 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2068 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2069 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2070 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2071 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2072 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2073 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2074 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2075 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2076 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2077 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2078 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG201 : glueChkR lits W 2067 12 = true := by
  rw [← glueChkRN_eq lits W 8596 2067 lenT]; decide +kernel
theorem okM201 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 1 = true := okB2067
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 2 = true := blkChk_join _ _ _ _ _ 2067 1 1 h0 okB2068
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 3 = true := blkChk_join _ _ _ _ _ 2067 2 1 h1 okB2069
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 4 = true := blkChk_join _ _ _ _ _ 2067 3 1 h2 okB2070
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 5 = true := blkChk_join _ _ _ _ _ 2067 4 1 h3 okB2071
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 6 = true := blkChk_join _ _ _ _ _ 2067 5 1 h4 okB2072
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 7 = true := blkChk_join _ _ _ _ _ 2067 6 1 h5 okB2073
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 8 = true := blkChk_join _ _ _ _ _ 2067 7 1 h6 okB2074
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 9 = true := blkChk_join _ _ _ _ _ 2067 8 1 h7 okB2075
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 10 = true := blkChk_join _ _ _ _ _ 2067 9 1 h8 okB2076
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 11 = true := blkChk_join _ _ _ _ _ 2067 10 1 h9 okB2077
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2067 12 = true := blkChk_join _ _ _ _ _ 2067 11 1 h10 okB2078
  exact h11
end E1.C236X
