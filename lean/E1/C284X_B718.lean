module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6994 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6995 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6995 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6996 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6996 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6997 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6997 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6998 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6998 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6999 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6999 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7000 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7000 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7001 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7001 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG718 : glueChkR lits W 6994 8 = true := by
  rw [← glueChkRN_eq lits W 7747 6994 lenT]; decide +kernel
theorem okM718 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 1 = true := okB6994
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 2 = true := blkChk_join _ _ _ _ _ 6994 1 1 h0 okB6995
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 3 = true := blkChk_join _ _ _ _ _ 6994 2 1 h1 okB6996
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 4 = true := blkChk_join _ _ _ _ _ 6994 3 1 h2 okB6997
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 5 = true := blkChk_join _ _ _ _ _ 6994 4 1 h3 okB6998
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 6 = true := blkChk_join _ _ _ _ _ 6994 5 1 h4 okB6999
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 7 = true := blkChk_join _ _ _ _ _ 6994 6 1 h5 okB7000
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6994 8 = true := blkChk_join _ _ _ _ _ 6994 7 1 h6 okB7001
  exact h7
end E1.C284X
