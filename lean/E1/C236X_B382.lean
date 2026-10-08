module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3927 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3928 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3928 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3929 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3929 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3930 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3930 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3931 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3931 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3932 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3932 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3933 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3933 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3934 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3934 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG382 : glueChkR lits W 3927 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3927 lenT]; decide +kernel
theorem okM382 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 1 = true := okB3927
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 2 = true := blkChk_join _ _ _ _ _ 3927 1 1 h0 okB3928
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 3 = true := blkChk_join _ _ _ _ _ 3927 2 1 h1 okB3929
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 4 = true := blkChk_join _ _ _ _ _ 3927 3 1 h2 okB3930
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 5 = true := blkChk_join _ _ _ _ _ 3927 4 1 h3 okB3931
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 6 = true := blkChk_join _ _ _ _ _ 3927 5 1 h4 okB3932
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 7 = true := blkChk_join _ _ _ _ _ 3927 6 1 h5 okB3933
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3927 8 = true := blkChk_join _ _ _ _ _ 3927 7 1 h6 okB3934
  exact h7
end E1.C236X
