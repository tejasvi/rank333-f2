module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3849 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3850 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3850 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3851 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3851 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3852 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3853 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3854 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3855 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3855 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3856 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3856 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG373 : glueChkR lits W 3849 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3849 lenT]; decide +kernel
theorem okM373 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 1 = true := okB3849
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 2 = true := blkChk_join _ _ _ _ _ 3849 1 1 h0 okB3850
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 3 = true := blkChk_join _ _ _ _ _ 3849 2 1 h1 okB3851
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 4 = true := blkChk_join _ _ _ _ _ 3849 3 1 h2 okB3852
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 5 = true := blkChk_join _ _ _ _ _ 3849 4 1 h3 okB3853
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 6 = true := blkChk_join _ _ _ _ _ 3849 5 1 h4 okB3854
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 7 = true := blkChk_join _ _ _ _ _ 3849 6 1 h5 okB3855
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3849 8 = true := blkChk_join _ _ _ _ _ 3849 7 1 h6 okB3856
  exact h7
end E1.C236X
