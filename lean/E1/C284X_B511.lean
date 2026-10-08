module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4861 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4862 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4863 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4864 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4865 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4866 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4867 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG511 : glueChkR lits W 4861 7 = true := by
  rw [← glueChkRN_eq lits W 7747 4861 lenT]; decide +kernel
theorem okM511 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 1 = true := okB4861
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 2 = true := blkChk_join _ _ _ _ _ 4861 1 1 h0 okB4862
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 3 = true := blkChk_join _ _ _ _ _ 4861 2 1 h1 okB4863
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 4 = true := blkChk_join _ _ _ _ _ 4861 3 1 h2 okB4864
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 5 = true := blkChk_join _ _ _ _ _ 4861 4 1 h3 okB4865
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 6 = true := blkChk_join _ _ _ _ _ 4861 5 1 h4 okB4866
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4861 7 = true := blkChk_join _ _ _ _ _ 4861 6 1 h5 okB4867
  exact h6
end E1.C284X
