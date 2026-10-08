module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4935 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4936 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4936 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4937 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4937 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4938 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4938 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4939 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4939 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4940 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4940 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4941 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG483 : glueChkR lits W 4935 7 = true := by
  rw [← glueChkRN_eq lits W 8596 4935 lenT]; decide +kernel
theorem okM483 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 1 = true := okB4935
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 2 = true := blkChk_join _ _ _ _ _ 4935 1 1 h0 okB4936
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 3 = true := blkChk_join _ _ _ _ _ 4935 2 1 h1 okB4937
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 4 = true := blkChk_join _ _ _ _ _ 4935 3 1 h2 okB4938
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 5 = true := blkChk_join _ _ _ _ _ 4935 4 1 h3 okB4939
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 6 = true := blkChk_join _ _ _ _ _ 4935 5 1 h4 okB4940
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4935 7 = true := blkChk_join _ _ _ _ _ 4935 6 1 h5 okB4941
  exact h6
end E1.C236X
