module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3702 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3703 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3704 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3705 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3706 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3707 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3708 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG359 : glueChkR lits W 3702 7 = true := by
  rw [← glueChkRN_eq lits W 8596 3702 lenT]; decide +kernel
theorem okM359 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 1 = true := okB3702
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 2 = true := blkChk_join _ _ _ _ _ 3702 1 1 h0 okB3703
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 3 = true := blkChk_join _ _ _ _ _ 3702 2 1 h1 okB3704
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 4 = true := blkChk_join _ _ _ _ _ 3702 3 1 h2 okB3705
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 5 = true := blkChk_join _ _ _ _ _ 3702 4 1 h3 okB3706
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 6 = true := blkChk_join _ _ _ _ _ 3702 5 1 h4 okB3707
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3702 7 = true := blkChk_join _ _ _ _ _ 3702 6 1 h5 okB3708
  exact h6
end E1.C236X
