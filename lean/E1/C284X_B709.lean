module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6890 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6891 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6892 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6893 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6894 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6895 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6896 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6897 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6898 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6899 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6900 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6901 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG709 : glueChkR lits W 6890 12 = true := by
  rw [← glueChkRN_eq lits W 7747 6890 lenT]; decide +kernel
theorem okM709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 1 = true := okB6890
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 2 = true := blkChk_join _ _ _ _ _ 6890 1 1 h0 okB6891
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 3 = true := blkChk_join _ _ _ _ _ 6890 2 1 h1 okB6892
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 4 = true := blkChk_join _ _ _ _ _ 6890 3 1 h2 okB6893
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 5 = true := blkChk_join _ _ _ _ _ 6890 4 1 h3 okB6894
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 6 = true := blkChk_join _ _ _ _ _ 6890 5 1 h4 okB6895
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 7 = true := blkChk_join _ _ _ _ _ 6890 6 1 h5 okB6896
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 8 = true := blkChk_join _ _ _ _ _ 6890 7 1 h6 okB6897
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 9 = true := blkChk_join _ _ _ _ _ 6890 8 1 h7 okB6898
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 10 = true := blkChk_join _ _ _ _ _ 6890 9 1 h8 okB6899
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 11 = true := blkChk_join _ _ _ _ _ 6890 10 1 h9 okB6900
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6890 12 = true := blkChk_join _ _ _ _ _ 6890 11 1 h10 okB6901
  exact h11
end E1.C284X
