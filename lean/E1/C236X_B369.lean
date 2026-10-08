module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3812 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3813 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3814 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3815 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3816 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3817 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3818 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG369 : glueChkR lits W 3811 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3811 lenT]; decide +kernel
theorem okM369 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 1 = true := okB3811
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 2 = true := blkChk_join _ _ _ _ _ 3811 1 1 h0 okB3812
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 3 = true := blkChk_join _ _ _ _ _ 3811 2 1 h1 okB3813
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 4 = true := blkChk_join _ _ _ _ _ 3811 3 1 h2 okB3814
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 5 = true := blkChk_join _ _ _ _ _ 3811 4 1 h3 okB3815
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 6 = true := blkChk_join _ _ _ _ _ 3811 5 1 h4 okB3816
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 7 = true := blkChk_join _ _ _ _ _ 3811 6 1 h5 okB3817
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3811 8 = true := blkChk_join _ _ _ _ _ 3811 7 1 h6 okB3818
  exact h7
end E1.C236X
