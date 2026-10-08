module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3883 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3884 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3885 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3886 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3887 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3888 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3889 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3890 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3891 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3892 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3893 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG377 : glueChkR lits W 3883 11 = true := by
  rw [← glueChkRN_eq lits W 8596 3883 lenT]; decide +kernel
theorem okM377 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 1 = true := okB3883
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 2 = true := blkChk_join _ _ _ _ _ 3883 1 1 h0 okB3884
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 3 = true := blkChk_join _ _ _ _ _ 3883 2 1 h1 okB3885
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 4 = true := blkChk_join _ _ _ _ _ 3883 3 1 h2 okB3886
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 5 = true := blkChk_join _ _ _ _ _ 3883 4 1 h3 okB3887
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 6 = true := blkChk_join _ _ _ _ _ 3883 5 1 h4 okB3888
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 7 = true := blkChk_join _ _ _ _ _ 3883 6 1 h5 okB3889
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 8 = true := blkChk_join _ _ _ _ _ 3883 7 1 h6 okB3890
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 9 = true := blkChk_join _ _ _ _ _ 3883 8 1 h7 okB3891
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 10 = true := blkChk_join _ _ _ _ _ 3883 9 1 h8 okB3892
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3883 11 = true := blkChk_join _ _ _ _ _ 3883 10 1 h9 okB3893
  exact h10
end E1.C236X
