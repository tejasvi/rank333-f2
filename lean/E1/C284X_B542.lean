module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5090 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5091 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5091 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5092 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5092 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5093 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5093 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5094 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5094 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5095 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5095 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5096 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5096 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5097 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5097 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5098 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5098 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG542 : glueChkR lits W 5090 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5090 lenT]; decide +kernel
theorem okM542 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 1 = true := okB5090
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 2 = true := blkChk_join _ _ _ _ _ 5090 1 1 h0 okB5091
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 3 = true := blkChk_join _ _ _ _ _ 5090 2 1 h1 okB5092
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 4 = true := blkChk_join _ _ _ _ _ 5090 3 1 h2 okB5093
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 5 = true := blkChk_join _ _ _ _ _ 5090 4 1 h3 okB5094
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 6 = true := blkChk_join _ _ _ _ _ 5090 5 1 h4 okB5095
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 7 = true := blkChk_join _ _ _ _ _ 5090 6 1 h5 okB5096
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 8 = true := blkChk_join _ _ _ _ _ 5090 7 1 h6 okB5097
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5090 9 = true := blkChk_join _ _ _ _ _ 5090 8 1 h7 okB5098
  exact h8
end E1.C284X
