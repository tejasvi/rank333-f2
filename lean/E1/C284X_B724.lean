module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7064 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7065 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7066 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7067 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7068 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7069 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7070 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7071 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7072 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7073 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG724 : glueChkR lits W 7064 10 = true := by
  rw [← glueChkRN_eq lits W 7747 7064 lenT]; decide +kernel
theorem okM724 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 1 = true := okB7064
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 2 = true := blkChk_join _ _ _ _ _ 7064 1 1 h0 okB7065
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 3 = true := blkChk_join _ _ _ _ _ 7064 2 1 h1 okB7066
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 4 = true := blkChk_join _ _ _ _ _ 7064 3 1 h2 okB7067
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 5 = true := blkChk_join _ _ _ _ _ 7064 4 1 h3 okB7068
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 6 = true := blkChk_join _ _ _ _ _ 7064 5 1 h4 okB7069
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 7 = true := blkChk_join _ _ _ _ _ 7064 6 1 h5 okB7070
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 8 = true := blkChk_join _ _ _ _ _ 7064 7 1 h6 okB7071
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 9 = true := blkChk_join _ _ _ _ _ 7064 8 1 h7 okB7072
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7064 10 = true := blkChk_join _ _ _ _ _ 7064 9 1 h8 okB7073
  exact h9
end E1.C284X
