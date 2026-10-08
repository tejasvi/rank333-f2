module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5802 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5803 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5804 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5805 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5806 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5807 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5808 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5809 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5810 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG562 : glueChkR lits W 5802 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5802 lenT]; decide +kernel
theorem okM562 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 1 = true := okB5802
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 2 = true := blkChk_join _ _ _ _ _ 5802 1 1 h0 okB5803
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 3 = true := blkChk_join _ _ _ _ _ 5802 2 1 h1 okB5804
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 4 = true := blkChk_join _ _ _ _ _ 5802 3 1 h2 okB5805
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 5 = true := blkChk_join _ _ _ _ _ 5802 4 1 h3 okB5806
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 6 = true := blkChk_join _ _ _ _ _ 5802 5 1 h4 okB5807
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 7 = true := blkChk_join _ _ _ _ _ 5802 6 1 h5 okB5808
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 8 = true := blkChk_join _ _ _ _ _ 5802 7 1 h6 okB5809
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 9 = true := blkChk_join _ _ _ _ _ 5802 8 1 h7 okB5810
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5802 10 = true := blkChk_join _ _ _ _ _ 5802 9 1 h8 okB5811
  exact h9
end E1.C236X
