module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6802 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6803 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6804 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6805 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6806 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6807 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6808 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6809 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG641 : glueChkR lits W 6802 8 = true := by
  rw [← glueChkRN_eq lits W 8596 6802 lenT]; decide +kernel
theorem okM641 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 1 = true := okB6802
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 2 = true := blkChk_join _ _ _ _ _ 6802 1 1 h0 okB6803
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 3 = true := blkChk_join _ _ _ _ _ 6802 2 1 h1 okB6804
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 4 = true := blkChk_join _ _ _ _ _ 6802 3 1 h2 okB6805
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 5 = true := blkChk_join _ _ _ _ _ 6802 4 1 h3 okB6806
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 6 = true := blkChk_join _ _ _ _ _ 6802 5 1 h4 okB6807
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 7 = true := blkChk_join _ _ _ _ _ 6802 6 1 h5 okB6808
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6802 8 = true := blkChk_join _ _ _ _ _ 6802 7 1 h6 okB6809
  exact h7
end E1.C236X
