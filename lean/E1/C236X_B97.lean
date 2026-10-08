module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1024 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1025 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1025 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1026 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1026 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1027 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1027 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1028 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1029 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1030 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1031 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1032 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1033 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1034 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1035 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG97 : glueChkR lits W 1024 12 = true := by
  rw [← glueChkRN_eq lits W 8596 1024 lenT]; decide +kernel
theorem okM97 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 1 = true := okB1024
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 2 = true := blkChk_join _ _ _ _ _ 1024 1 1 h0 okB1025
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 3 = true := blkChk_join _ _ _ _ _ 1024 2 1 h1 okB1026
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 4 = true := blkChk_join _ _ _ _ _ 1024 3 1 h2 okB1027
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 5 = true := blkChk_join _ _ _ _ _ 1024 4 1 h3 okB1028
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 6 = true := blkChk_join _ _ _ _ _ 1024 5 1 h4 okB1029
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 7 = true := blkChk_join _ _ _ _ _ 1024 6 1 h5 okB1030
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 8 = true := blkChk_join _ _ _ _ _ 1024 7 1 h6 okB1031
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 9 = true := blkChk_join _ _ _ _ _ 1024 8 1 h7 okB1032
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 10 = true := blkChk_join _ _ _ _ _ 1024 9 1 h8 okB1033
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 11 = true := blkChk_join _ _ _ _ _ 1024 10 1 h9 okB1034
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1024 12 = true := blkChk_join _ _ _ _ _ 1024 11 1 h10 okB1035
  exact h11
end E1.C236X
