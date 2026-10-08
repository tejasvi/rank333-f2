module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB125 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB126 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 126 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 127 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 128 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB129 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 129 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB130 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 130 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG12 : glueChkR lits W 125 6 = true := by
  rw [← glueChkRN_eq lits W 7747 125 lenT]; decide +kernel
theorem okM12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 1 = true := okB125
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 2 = true := blkChk_join _ _ _ _ _ 125 1 1 h0 okB126
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 3 = true := blkChk_join _ _ _ _ _ 125 2 1 h1 okB127
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 4 = true := blkChk_join _ _ _ _ _ 125 3 1 h2 okB128
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 5 = true := blkChk_join _ _ _ _ _ 125 4 1 h3 okB129
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 125 6 = true := blkChk_join _ _ _ _ _ 125 5 1 h4 okB130
  exact h5
end E1.C284X
