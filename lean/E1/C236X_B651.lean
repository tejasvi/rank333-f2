module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6887 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6888 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6889 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6890 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6891 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6892 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6893 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6894 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6895 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG651 : glueChkR lits W 6887 9 = true := by
  rw [← glueChkRN_eq lits W 8596 6887 lenT]; decide +kernel
theorem okM651 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 1 = true := okB6887
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 2 = true := blkChk_join _ _ _ _ _ 6887 1 1 h0 okB6888
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 3 = true := blkChk_join _ _ _ _ _ 6887 2 1 h1 okB6889
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 4 = true := blkChk_join _ _ _ _ _ 6887 3 1 h2 okB6890
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 5 = true := blkChk_join _ _ _ _ _ 6887 4 1 h3 okB6891
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 6 = true := blkChk_join _ _ _ _ _ 6887 5 1 h4 okB6892
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 7 = true := blkChk_join _ _ _ _ _ 6887 6 1 h5 okB6893
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 8 = true := blkChk_join _ _ _ _ _ 6887 7 1 h6 okB6894
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6887 9 = true := blkChk_join _ _ _ _ _ 6887 8 1 h7 okB6895
  exact h8
end E1.C236X
