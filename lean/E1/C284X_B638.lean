module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6085 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6086 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6086 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6087 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6087 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6088 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6088 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6089 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6089 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6090 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6090 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6091 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6091 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6092 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6092 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6093 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6093 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6094 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6094 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG638 : glueChkR lits W 6085 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6085 lenT]; decide +kernel
theorem okM638 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 1 = true := okB6085
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 2 = true := blkChk_join _ _ _ _ _ 6085 1 1 h0 okB6086
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 3 = true := blkChk_join _ _ _ _ _ 6085 2 1 h1 okB6087
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 4 = true := blkChk_join _ _ _ _ _ 6085 3 1 h2 okB6088
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 5 = true := blkChk_join _ _ _ _ _ 6085 4 1 h3 okB6089
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 6 = true := blkChk_join _ _ _ _ _ 6085 5 1 h4 okB6090
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 7 = true := blkChk_join _ _ _ _ _ 6085 6 1 h5 okB6091
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 8 = true := blkChk_join _ _ _ _ _ 6085 7 1 h6 okB6092
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 9 = true := blkChk_join _ _ _ _ _ 6085 8 1 h7 okB6093
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6085 10 = true := blkChk_join _ _ _ _ _ 6085 9 1 h8 okB6094
  exact h9
end E1.C284X
