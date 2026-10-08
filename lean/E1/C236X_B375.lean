module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3867 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3868 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3869 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3870 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3871 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3872 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3873 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3874 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG375 : glueChkR lits W 3867 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3867 lenT]; decide +kernel
theorem okM375 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 1 = true := okB3867
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 2 = true := blkChk_join _ _ _ _ _ 3867 1 1 h0 okB3868
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 3 = true := blkChk_join _ _ _ _ _ 3867 2 1 h1 okB3869
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 4 = true := blkChk_join _ _ _ _ _ 3867 3 1 h2 okB3870
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 5 = true := blkChk_join _ _ _ _ _ 3867 4 1 h3 okB3871
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 6 = true := blkChk_join _ _ _ _ _ 3867 5 1 h4 okB3872
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 7 = true := blkChk_join _ _ _ _ _ 3867 6 1 h5 okB3873
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3867 8 = true := blkChk_join _ _ _ _ _ 3867 7 1 h6 okB3874
  exact h7
end E1.C236X
