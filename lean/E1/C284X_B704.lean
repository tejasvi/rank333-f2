module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6830 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6831 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6831 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6832 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6832 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6833 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6833 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6834 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6834 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6835 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6835 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6836 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6836 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6837 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6837 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6838 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6838 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6839 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6839 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG704 : glueChkR lits W 6830 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6830 lenT]; decide +kernel
theorem okM704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 1 = true := okB6830
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 2 = true := blkChk_join _ _ _ _ _ 6830 1 1 h0 okB6831
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 3 = true := blkChk_join _ _ _ _ _ 6830 2 1 h1 okB6832
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 4 = true := blkChk_join _ _ _ _ _ 6830 3 1 h2 okB6833
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 5 = true := blkChk_join _ _ _ _ _ 6830 4 1 h3 okB6834
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 6 = true := blkChk_join _ _ _ _ _ 6830 5 1 h4 okB6835
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 7 = true := blkChk_join _ _ _ _ _ 6830 6 1 h5 okB6836
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 8 = true := blkChk_join _ _ _ _ _ 6830 7 1 h6 okB6837
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 9 = true := blkChk_join _ _ _ _ _ 6830 8 1 h7 okB6838
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6830 10 = true := blkChk_join _ _ _ _ _ 6830 9 1 h8 okB6839
  exact h9
end E1.C284X
