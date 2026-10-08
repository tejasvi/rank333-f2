module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB44 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB45 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 45 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB46 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 46 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB47 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 47 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB48 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 48 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB49 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 49 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB50 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 50 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB51 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 51 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB52 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 52 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB53 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 53 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG4 : glueChkR lits W 44 10 = true := by
  rw [← glueChkRN_eq lits W 7747 44 lenT]; decide +kernel
theorem okM4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 1 = true := okB44
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 2 = true := blkChk_join _ _ _ _ _ 44 1 1 h0 okB45
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 3 = true := blkChk_join _ _ _ _ _ 44 2 1 h1 okB46
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 4 = true := blkChk_join _ _ _ _ _ 44 3 1 h2 okB47
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 5 = true := blkChk_join _ _ _ _ _ 44 4 1 h3 okB48
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 6 = true := blkChk_join _ _ _ _ _ 44 5 1 h4 okB49
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 7 = true := blkChk_join _ _ _ _ _ 44 6 1 h5 okB50
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 8 = true := blkChk_join _ _ _ _ _ 44 7 1 h6 okB51
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 9 = true := blkChk_join _ _ _ _ _ 44 8 1 h7 okB52
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 44 10 = true := blkChk_join _ _ _ _ _ 44 9 1 h8 okB53
  exact h9
end E1.C284X
