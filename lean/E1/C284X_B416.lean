module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3950 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3951 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3952 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3953 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3954 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3955 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3956 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3957 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3958 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG416 : glueChkR lits W 3950 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3950 lenT]; decide +kernel
theorem okM416 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 1 = true := okB3950
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 2 = true := blkChk_join _ _ _ _ _ 3950 1 1 h0 okB3951
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 3 = true := blkChk_join _ _ _ _ _ 3950 2 1 h1 okB3952
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 4 = true := blkChk_join _ _ _ _ _ 3950 3 1 h2 okB3953
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 5 = true := blkChk_join _ _ _ _ _ 3950 4 1 h3 okB3954
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 6 = true := blkChk_join _ _ _ _ _ 3950 5 1 h4 okB3955
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 7 = true := blkChk_join _ _ _ _ _ 3950 6 1 h5 okB3956
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 8 = true := blkChk_join _ _ _ _ _ 3950 7 1 h6 okB3957
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3950 9 = true := blkChk_join _ _ _ _ _ 3950 8 1 h7 okB3958
  exact h8
end E1.C284X
