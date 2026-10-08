module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB909 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB910 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB911 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB912 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB913 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB914 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB915 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB916 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB917 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB918 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB919 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB920 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG97 : glueChkR lits W 909 12 = true := by
  rw [← glueChkRN_eq lits W 7747 909 lenT]; decide +kernel
theorem okM97 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 1 = true := okB909
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 2 = true := blkChk_join _ _ _ _ _ 909 1 1 h0 okB910
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 3 = true := blkChk_join _ _ _ _ _ 909 2 1 h1 okB911
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 4 = true := blkChk_join _ _ _ _ _ 909 3 1 h2 okB912
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 5 = true := blkChk_join _ _ _ _ _ 909 4 1 h3 okB913
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 6 = true := blkChk_join _ _ _ _ _ 909 5 1 h4 okB914
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 7 = true := blkChk_join _ _ _ _ _ 909 6 1 h5 okB915
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 8 = true := blkChk_join _ _ _ _ _ 909 7 1 h6 okB916
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 9 = true := blkChk_join _ _ _ _ _ 909 8 1 h7 okB917
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 10 = true := blkChk_join _ _ _ _ _ 909 9 1 h8 okB918
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 11 = true := blkChk_join _ _ _ _ _ 909 10 1 h9 okB919
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 909 12 = true := blkChk_join _ _ _ _ _ 909 11 1 h10 okB920
  exact h11
end E1.C284X
