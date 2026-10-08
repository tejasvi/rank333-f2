module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5056 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5057 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5058 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5059 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5060 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5061 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5062 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG536 : glueChkR lits W 5056 7 = true := by
  rw [← glueChkRN_eq lits W 7747 5056 lenT]; decide +kernel
theorem okM536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 1 = true := okB5056
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 2 = true := blkChk_join _ _ _ _ _ 5056 1 1 h0 okB5057
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 3 = true := blkChk_join _ _ _ _ _ 5056 2 1 h1 okB5058
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 4 = true := blkChk_join _ _ _ _ _ 5056 3 1 h2 okB5059
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 5 = true := blkChk_join _ _ _ _ _ 5056 4 1 h3 okB5060
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 6 = true := blkChk_join _ _ _ _ _ 5056 5 1 h4 okB5061
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5056 7 = true := blkChk_join _ _ _ _ _ 5056 6 1 h5 okB5062
  exact h6
end E1.C284X
