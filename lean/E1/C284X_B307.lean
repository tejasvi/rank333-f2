module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2821 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2822 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2822 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2823 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2823 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2824 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2824 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2825 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2826 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2826 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2827 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2827 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2828 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2828 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2829 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2829 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2830 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG307 : glueChkR lits W 2821 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2821 lenT]; decide +kernel
theorem okM307 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 1 = true := okB2821
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 2 = true := blkChk_join _ _ _ _ _ 2821 1 1 h0 okB2822
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 3 = true := blkChk_join _ _ _ _ _ 2821 2 1 h1 okB2823
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 4 = true := blkChk_join _ _ _ _ _ 2821 3 1 h2 okB2824
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 5 = true := blkChk_join _ _ _ _ _ 2821 4 1 h3 okB2825
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 6 = true := blkChk_join _ _ _ _ _ 2821 5 1 h4 okB2826
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 7 = true := blkChk_join _ _ _ _ _ 2821 6 1 h5 okB2827
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 8 = true := blkChk_join _ _ _ _ _ 2821 7 1 h6 okB2828
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 9 = true := blkChk_join _ _ _ _ _ 2821 8 1 h7 okB2829
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2821 10 = true := blkChk_join _ _ _ _ _ 2821 9 1 h8 okB2830
  exact h9
end E1.C284X
