module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4791 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4792 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4792 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4793 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4793 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4794 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4794 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4795 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4795 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4796 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4796 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4797 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4797 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4798 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4798 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG470 : glueChkR lits W 4791 8 = true := by
  rw [← glueChkRN_eq lits W 8596 4791 lenT]; decide +kernel
theorem okM470 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 1 = true := okB4791
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 2 = true := blkChk_join _ _ _ _ _ 4791 1 1 h0 okB4792
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 3 = true := blkChk_join _ _ _ _ _ 4791 2 1 h1 okB4793
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 4 = true := blkChk_join _ _ _ _ _ 4791 3 1 h2 okB4794
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 5 = true := blkChk_join _ _ _ _ _ 4791 4 1 h3 okB4795
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 6 = true := blkChk_join _ _ _ _ _ 4791 5 1 h4 okB4796
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 7 = true := blkChk_join _ _ _ _ _ 4791 6 1 h5 okB4797
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4791 8 = true := blkChk_join _ _ _ _ _ 4791 7 1 h6 okB4798
  exact h7
end E1.C236X
