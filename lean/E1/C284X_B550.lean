module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5163 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5164 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5164 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5165 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5165 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5166 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5166 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5167 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5167 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5168 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5168 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5169 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5169 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG550 : glueChkR lits W 5163 7 = true := by
  rw [← glueChkRN_eq lits W 7747 5163 lenT]; decide +kernel
theorem okM550 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 1 = true := okB5163
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 2 = true := blkChk_join _ _ _ _ _ 5163 1 1 h0 okB5164
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 3 = true := blkChk_join _ _ _ _ _ 5163 2 1 h1 okB5165
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 4 = true := blkChk_join _ _ _ _ _ 5163 3 1 h2 okB5166
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 5 = true := blkChk_join _ _ _ _ _ 5163 4 1 h3 okB5167
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 6 = true := blkChk_join _ _ _ _ _ 5163 5 1 h4 okB5168
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5163 7 = true := blkChk_join _ _ _ _ _ 5163 6 1 h5 okB5169
  exact h6
end E1.C284X
