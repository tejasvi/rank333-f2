module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3841 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3842 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3842 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3843 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3843 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3844 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3844 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3845 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3845 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3846 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3846 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3847 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3847 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3848 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3848 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG372 : glueChkR lits W 3841 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3841 lenT]; decide +kernel
theorem okM372 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 1 = true := okB3841
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 2 = true := blkChk_join _ _ _ _ _ 3841 1 1 h0 okB3842
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 3 = true := blkChk_join _ _ _ _ _ 3841 2 1 h1 okB3843
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 4 = true := blkChk_join _ _ _ _ _ 3841 3 1 h2 okB3844
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 5 = true := blkChk_join _ _ _ _ _ 3841 4 1 h3 okB3845
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 6 = true := blkChk_join _ _ _ _ _ 3841 5 1 h4 okB3846
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 7 = true := blkChk_join _ _ _ _ _ 3841 6 1 h5 okB3847
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3841 8 = true := blkChk_join _ _ _ _ _ 3841 7 1 h6 okB3848
  exact h7
end E1.C236X
