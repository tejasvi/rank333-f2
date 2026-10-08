module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4650 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4651 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4651 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4652 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4652 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4653 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4653 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4654 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4654 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4655 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4655 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4656 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4656 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG456 : glueChkR lits W 4650 7 = true := by
  rw [← glueChkRN_eq lits W 8596 4650 lenT]; decide +kernel
theorem okM456 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 1 = true := okB4650
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 2 = true := blkChk_join _ _ _ _ _ 4650 1 1 h0 okB4651
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 3 = true := blkChk_join _ _ _ _ _ 4650 2 1 h1 okB4652
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 4 = true := blkChk_join _ _ _ _ _ 4650 3 1 h2 okB4653
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 5 = true := blkChk_join _ _ _ _ _ 4650 4 1 h3 okB4654
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 6 = true := blkChk_join _ _ _ _ _ 4650 5 1 h4 okB4655
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4650 7 = true := blkChk_join _ _ _ _ _ 4650 6 1 h5 okB4656
  exact h6
end E1.C236X
