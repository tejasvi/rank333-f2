module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5107 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5108 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5108 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5109 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5109 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5110 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5110 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5111 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5111 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5112 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5112 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5113 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5113 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5114 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5114 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5115 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5115 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG544 : glueChkR lits W 5107 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5107 lenT]; decide +kernel
theorem okM544 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 1 = true := okB5107
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 2 = true := blkChk_join _ _ _ _ _ 5107 1 1 h0 okB5108
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 3 = true := blkChk_join _ _ _ _ _ 5107 2 1 h1 okB5109
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 4 = true := blkChk_join _ _ _ _ _ 5107 3 1 h2 okB5110
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 5 = true := blkChk_join _ _ _ _ _ 5107 4 1 h3 okB5111
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 6 = true := blkChk_join _ _ _ _ _ 5107 5 1 h4 okB5112
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 7 = true := blkChk_join _ _ _ _ _ 5107 6 1 h5 okB5113
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 8 = true := blkChk_join _ _ _ _ _ 5107 7 1 h6 okB5114
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5107 9 = true := blkChk_join _ _ _ _ _ 5107 8 1 h7 okB5115
  exact h8
end E1.C284X
