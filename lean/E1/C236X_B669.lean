module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7068 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7069 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7070 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7071 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7072 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7073 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7074 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7075 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG669 : glueChkR lits W 7068 8 = true := by
  rw [← glueChkRN_eq lits W 8596 7068 lenT]; decide +kernel
theorem okM669 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 1 = true := okB7068
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 2 = true := blkChk_join _ _ _ _ _ 7068 1 1 h0 okB7069
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 3 = true := blkChk_join _ _ _ _ _ 7068 2 1 h1 okB7070
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 4 = true := blkChk_join _ _ _ _ _ 7068 3 1 h2 okB7071
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 5 = true := blkChk_join _ _ _ _ _ 7068 4 1 h3 okB7072
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 6 = true := blkChk_join _ _ _ _ _ 7068 5 1 h4 okB7073
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 7 = true := blkChk_join _ _ _ _ _ 7068 6 1 h5 okB7074
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7068 8 = true := blkChk_join _ _ _ _ _ 7068 7 1 h6 okB7075
  exact h7
end E1.C236X
