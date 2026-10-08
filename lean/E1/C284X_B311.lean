module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2866 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2867 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2868 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2869 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2870 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2871 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG311 : glueChkR lits W 2866 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2866 lenT]; decide +kernel
theorem okM311 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 1 = true := okB2866
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 2 = true := blkChk_join _ _ _ _ _ 2866 1 1 h0 okB2867
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 3 = true := blkChk_join _ _ _ _ _ 2866 2 1 h1 okB2868
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 4 = true := blkChk_join _ _ _ _ _ 2866 3 1 h2 okB2869
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 5 = true := blkChk_join _ _ _ _ _ 2866 4 1 h3 okB2870
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2866 6 = true := blkChk_join _ _ _ _ _ 2866 5 1 h4 okB2871
  exact h5
end E1.C284X
