module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6810 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6812 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6813 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6814 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6815 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6816 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6817 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6818 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6819 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6820 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG642 : glueChkR lits W 6810 11 = true := by
  rw [← glueChkRN_eq lits W 8596 6810 lenT]; decide +kernel
theorem okM642 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 1 = true := okB6810
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 2 = true := blkChk_join _ _ _ _ _ 6810 1 1 h0 okB6811
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 3 = true := blkChk_join _ _ _ _ _ 6810 2 1 h1 okB6812
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 4 = true := blkChk_join _ _ _ _ _ 6810 3 1 h2 okB6813
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 5 = true := blkChk_join _ _ _ _ _ 6810 4 1 h3 okB6814
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 6 = true := blkChk_join _ _ _ _ _ 6810 5 1 h4 okB6815
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 7 = true := blkChk_join _ _ _ _ _ 6810 6 1 h5 okB6816
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 8 = true := blkChk_join _ _ _ _ _ 6810 7 1 h6 okB6817
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 9 = true := blkChk_join _ _ _ _ _ 6810 8 1 h7 okB6818
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 10 = true := blkChk_join _ _ _ _ _ 6810 9 1 h8 okB6819
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6810 11 = true := blkChk_join _ _ _ _ _ 6810 10 1 h9 okB6820
  exact h10
end E1.C236X
