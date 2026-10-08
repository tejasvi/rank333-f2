module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5806 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5807 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5808 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5809 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5810 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5811 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5812 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5813 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5814 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5815 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5816 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5817 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5818 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5819 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5820 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG612 : glueChkR lits W 5806 15 = true := by
  rw [← glueChkRN_eq lits W 7747 5806 lenT]; decide +kernel
theorem okM612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 15 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 1 = true := okB5806
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 2 = true := blkChk_join _ _ _ _ _ 5806 1 1 h0 okB5807
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 3 = true := blkChk_join _ _ _ _ _ 5806 2 1 h1 okB5808
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 4 = true := blkChk_join _ _ _ _ _ 5806 3 1 h2 okB5809
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 5 = true := blkChk_join _ _ _ _ _ 5806 4 1 h3 okB5810
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 6 = true := blkChk_join _ _ _ _ _ 5806 5 1 h4 okB5811
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 7 = true := blkChk_join _ _ _ _ _ 5806 6 1 h5 okB5812
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 8 = true := blkChk_join _ _ _ _ _ 5806 7 1 h6 okB5813
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 9 = true := blkChk_join _ _ _ _ _ 5806 8 1 h7 okB5814
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 10 = true := blkChk_join _ _ _ _ _ 5806 9 1 h8 okB5815
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 11 = true := blkChk_join _ _ _ _ _ 5806 10 1 h9 okB5816
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 12 = true := blkChk_join _ _ _ _ _ 5806 11 1 h10 okB5817
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 13 = true := blkChk_join _ _ _ _ _ 5806 12 1 h11 okB5818
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 14 = true := blkChk_join _ _ _ _ _ 5806 13 1 h12 okB5819
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5806 15 = true := blkChk_join _ _ _ _ _ 5806 14 1 h13 okB5820
  exact h14
end E1.C284X
