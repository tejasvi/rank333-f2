module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6832 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6833 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6833 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6834 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6834 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6835 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6835 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6836 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6836 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6837 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6837 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6838 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6838 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG644 : glueChkR lits W 6832 7 = true := by
  rw [← glueChkRN_eq lits W 8596 6832 lenT]; decide +kernel
theorem okM644 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 1 = true := okB6832
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 2 = true := blkChk_join _ _ _ _ _ 6832 1 1 h0 okB6833
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 3 = true := blkChk_join _ _ _ _ _ 6832 2 1 h1 okB6834
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 4 = true := blkChk_join _ _ _ _ _ 6832 3 1 h2 okB6835
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 5 = true := blkChk_join _ _ _ _ _ 6832 4 1 h3 okB6836
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 6 = true := blkChk_join _ _ _ _ _ 6832 5 1 h4 okB6837
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6832 7 = true := blkChk_join _ _ _ _ _ 6832 6 1 h5 okB6838
  exact h6
end E1.C236X
