module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3956 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3957 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3958 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3959 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3960 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3961 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3962 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3963 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3963 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3964 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3964 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG385 : glueChkR lits W 3956 9 = true := by
  rw [← glueChkRN_eq lits W 8596 3956 lenT]; decide +kernel
theorem okM385 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 1 = true := okB3956
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 2 = true := blkChk_join _ _ _ _ _ 3956 1 1 h0 okB3957
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 3 = true := blkChk_join _ _ _ _ _ 3956 2 1 h1 okB3958
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 4 = true := blkChk_join _ _ _ _ _ 3956 3 1 h2 okB3959
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 5 = true := blkChk_join _ _ _ _ _ 3956 4 1 h3 okB3960
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 6 = true := blkChk_join _ _ _ _ _ 3956 5 1 h4 okB3961
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 7 = true := blkChk_join _ _ _ _ _ 3956 6 1 h5 okB3962
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 8 = true := blkChk_join _ _ _ _ _ 3956 7 1 h6 okB3963
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3956 9 = true := blkChk_join _ _ _ _ _ 3956 8 1 h7 okB3964
  exact h8
end E1.C236X
