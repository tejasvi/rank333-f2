module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2123 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2124 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2124 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2125 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2125 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2126 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2126 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2127 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2128 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2129 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2129 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2130 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2130 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2131 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2131 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2132 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2132 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG234 : glueChkR lits W 2123 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2123 lenT]; decide +kernel
theorem okM234 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 1 = true := okB2123
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 2 = true := blkChk_join _ _ _ _ _ 2123 1 1 h0 okB2124
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 3 = true := blkChk_join _ _ _ _ _ 2123 2 1 h1 okB2125
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 4 = true := blkChk_join _ _ _ _ _ 2123 3 1 h2 okB2126
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 5 = true := blkChk_join _ _ _ _ _ 2123 4 1 h3 okB2127
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 6 = true := blkChk_join _ _ _ _ _ 2123 5 1 h4 okB2128
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 7 = true := blkChk_join _ _ _ _ _ 2123 6 1 h5 okB2129
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 8 = true := blkChk_join _ _ _ _ _ 2123 7 1 h6 okB2130
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 9 = true := blkChk_join _ _ _ _ _ 2123 8 1 h7 okB2131
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2123 10 = true := blkChk_join _ _ _ _ _ 2123 9 1 h8 okB2132
  exact h9
end E1.C284X
