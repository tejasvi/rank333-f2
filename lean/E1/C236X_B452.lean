module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4621 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4622 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4622 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4623 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4623 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4624 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4624 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4625 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4625 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4626 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4626 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4627 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4627 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4628 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4628 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG452 : glueChkR lits W 4621 8 = true := by
  rw [← glueChkRN_eq lits W 8596 4621 lenT]; decide +kernel
theorem okM452 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 1 = true := okB4621
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 2 = true := blkChk_join _ _ _ _ _ 4621 1 1 h0 okB4622
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 3 = true := blkChk_join _ _ _ _ _ 4621 2 1 h1 okB4623
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 4 = true := blkChk_join _ _ _ _ _ 4621 3 1 h2 okB4624
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 5 = true := blkChk_join _ _ _ _ _ 4621 4 1 h3 okB4625
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 6 = true := blkChk_join _ _ _ _ _ 4621 5 1 h4 okB4626
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 7 = true := blkChk_join _ _ _ _ _ 4621 6 1 h5 okB4627
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4621 8 = true := blkChk_join _ _ _ _ _ 4621 7 1 h6 okB4628
  exact h7
end E1.C236X
