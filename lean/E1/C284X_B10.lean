module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB100 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB101 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB102 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB103 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB104 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 104 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB105 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 105 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB106 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 106 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB107 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 107 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB108 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 108 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB109 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 109 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB110 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 110 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG10 : glueChkR lits W 100 11 = true := by
  rw [← glueChkRN_eq lits W 7747 100 lenT]; decide +kernel
theorem okM10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 1 = true := okB100
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 2 = true := blkChk_join _ _ _ _ _ 100 1 1 h0 okB101
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 3 = true := blkChk_join _ _ _ _ _ 100 2 1 h1 okB102
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 4 = true := blkChk_join _ _ _ _ _ 100 3 1 h2 okB103
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 5 = true := blkChk_join _ _ _ _ _ 100 4 1 h3 okB104
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 6 = true := blkChk_join _ _ _ _ _ 100 5 1 h4 okB105
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 7 = true := blkChk_join _ _ _ _ _ 100 6 1 h5 okB106
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 8 = true := blkChk_join _ _ _ _ _ 100 7 1 h6 okB107
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 9 = true := blkChk_join _ _ _ _ _ 100 8 1 h7 okB108
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 10 = true := blkChk_join _ _ _ _ _ 100 9 1 h8 okB109
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 100 11 = true := blkChk_join _ _ _ _ _ 100 10 1 h9 okB110
  exact h10
end E1.C284X
