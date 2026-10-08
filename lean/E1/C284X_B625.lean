module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5951 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5952 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5953 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5954 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5955 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5956 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5957 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5958 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5959 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5960 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG625 : glueChkR lits W 5951 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5951 lenT]; decide +kernel
theorem okM625 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 1 = true := okB5951
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 2 = true := blkChk_join _ _ _ _ _ 5951 1 1 h0 okB5952
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 3 = true := blkChk_join _ _ _ _ _ 5951 2 1 h1 okB5953
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 4 = true := blkChk_join _ _ _ _ _ 5951 3 1 h2 okB5954
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 5 = true := blkChk_join _ _ _ _ _ 5951 4 1 h3 okB5955
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 6 = true := blkChk_join _ _ _ _ _ 5951 5 1 h4 okB5956
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 7 = true := blkChk_join _ _ _ _ _ 5951 6 1 h5 okB5957
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 8 = true := blkChk_join _ _ _ _ _ 5951 7 1 h6 okB5958
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 9 = true := blkChk_join _ _ _ _ _ 5951 8 1 h7 okB5959
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5951 10 = true := blkChk_join _ _ _ _ _ 5951 9 1 h8 okB5960
  exact h9
end E1.C284X
