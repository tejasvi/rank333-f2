module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB801 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB802 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB803 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB804 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB805 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB806 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB807 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB808 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB809 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB810 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB812 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG75 : glueChkR lits W 801 12 = true := by
  rw [← glueChkRN_eq lits W 8596 801 lenT]; decide +kernel
theorem okM75 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 1 = true := okB801
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 2 = true := blkChk_join _ _ _ _ _ 801 1 1 h0 okB802
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 3 = true := blkChk_join _ _ _ _ _ 801 2 1 h1 okB803
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 4 = true := blkChk_join _ _ _ _ _ 801 3 1 h2 okB804
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 5 = true := blkChk_join _ _ _ _ _ 801 4 1 h3 okB805
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 6 = true := blkChk_join _ _ _ _ _ 801 5 1 h4 okB806
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 7 = true := blkChk_join _ _ _ _ _ 801 6 1 h5 okB807
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 8 = true := blkChk_join _ _ _ _ _ 801 7 1 h6 okB808
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 9 = true := blkChk_join _ _ _ _ _ 801 8 1 h7 okB809
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 10 = true := blkChk_join _ _ _ _ _ 801 9 1 h8 okB810
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 11 = true := blkChk_join _ _ _ _ _ 801 10 1 h9 okB811
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 801 12 = true := blkChk_join _ _ _ _ _ 801 11 1 h10 okB812
  exact h11
end E1.C236X
