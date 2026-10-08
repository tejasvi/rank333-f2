module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5884 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5885 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5886 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5887 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5888 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5889 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5890 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5891 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5892 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5893 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5894 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5895 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG568 : glueChkR lits W 5884 12 = true := by
  rw [← glueChkRN_eq lits W 8596 5884 lenT]; decide +kernel
theorem okM568 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 1 = true := okB5884
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 2 = true := blkChk_join _ _ _ _ _ 5884 1 1 h0 okB5885
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 3 = true := blkChk_join _ _ _ _ _ 5884 2 1 h1 okB5886
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 4 = true := blkChk_join _ _ _ _ _ 5884 3 1 h2 okB5887
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 5 = true := blkChk_join _ _ _ _ _ 5884 4 1 h3 okB5888
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 6 = true := blkChk_join _ _ _ _ _ 5884 5 1 h4 okB5889
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 7 = true := blkChk_join _ _ _ _ _ 5884 6 1 h5 okB5890
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 8 = true := blkChk_join _ _ _ _ _ 5884 7 1 h6 okB5891
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 9 = true := blkChk_join _ _ _ _ _ 5884 8 1 h7 okB5892
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 10 = true := blkChk_join _ _ _ _ _ 5884 9 1 h8 okB5893
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 11 = true := blkChk_join _ _ _ _ _ 5884 10 1 h9 okB5894
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5884 12 = true := blkChk_join _ _ _ _ _ 5884 11 1 h10 okB5895
  exact h11
end E1.C236X
