module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1009 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1010 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1011 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1012 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1013 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1014 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1015 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG107 : glueChkR lits W 1009 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1009 lenT]; decide +kernel
theorem okM107 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 1 = true := okB1009
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 2 = true := blkChk_join _ _ _ _ _ 1009 1 1 h0 okB1010
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 3 = true := blkChk_join _ _ _ _ _ 1009 2 1 h1 okB1011
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 4 = true := blkChk_join _ _ _ _ _ 1009 3 1 h2 okB1012
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 5 = true := blkChk_join _ _ _ _ _ 1009 4 1 h3 okB1013
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 6 = true := blkChk_join _ _ _ _ _ 1009 5 1 h4 okB1014
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1009 7 = true := blkChk_join _ _ _ _ _ 1009 6 1 h5 okB1015
  exact h6
end E1.C284X
