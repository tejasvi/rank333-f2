module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6095 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6096 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6096 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6097 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6097 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6098 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6098 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6099 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6099 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6100 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6101 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6102 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6103 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6104 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6104 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6105 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6105 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6106 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6106 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6107 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6107 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6108 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6108 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6109 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6109 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG639 : glueChkR lits W 6095 15 = true := by
  rw [← glueChkRN_eq lits W 7747 6095 lenT]; decide +kernel
theorem okM639 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 15 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 1 = true := okB6095
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 2 = true := blkChk_join _ _ _ _ _ 6095 1 1 h0 okB6096
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 3 = true := blkChk_join _ _ _ _ _ 6095 2 1 h1 okB6097
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 4 = true := blkChk_join _ _ _ _ _ 6095 3 1 h2 okB6098
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 5 = true := blkChk_join _ _ _ _ _ 6095 4 1 h3 okB6099
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 6 = true := blkChk_join _ _ _ _ _ 6095 5 1 h4 okB6100
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 7 = true := blkChk_join _ _ _ _ _ 6095 6 1 h5 okB6101
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 8 = true := blkChk_join _ _ _ _ _ 6095 7 1 h6 okB6102
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 9 = true := blkChk_join _ _ _ _ _ 6095 8 1 h7 okB6103
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 10 = true := blkChk_join _ _ _ _ _ 6095 9 1 h8 okB6104
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 11 = true := blkChk_join _ _ _ _ _ 6095 10 1 h9 okB6105
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 12 = true := blkChk_join _ _ _ _ _ 6095 11 1 h10 okB6106
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 13 = true := blkChk_join _ _ _ _ _ 6095 12 1 h11 okB6107
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 14 = true := blkChk_join _ _ _ _ _ 6095 13 1 h12 okB6108
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6095 15 = true := blkChk_join _ _ _ _ _ 6095 14 1 h13 okB6109
  exact h14
end E1.C284X
