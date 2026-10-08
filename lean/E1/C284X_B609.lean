module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5775 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5776 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5776 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5777 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5777 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5778 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5778 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5779 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5779 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5780 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5780 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5781 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5781 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5782 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5782 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5783 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5783 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG609 : glueChkR lits W 5775 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5775 lenT]; decide +kernel
theorem okM609 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 1 = true := okB5775
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 2 = true := blkChk_join _ _ _ _ _ 5775 1 1 h0 okB5776
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 3 = true := blkChk_join _ _ _ _ _ 5775 2 1 h1 okB5777
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 4 = true := blkChk_join _ _ _ _ _ 5775 3 1 h2 okB5778
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 5 = true := blkChk_join _ _ _ _ _ 5775 4 1 h3 okB5779
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 6 = true := blkChk_join _ _ _ _ _ 5775 5 1 h4 okB5780
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 7 = true := blkChk_join _ _ _ _ _ 5775 6 1 h5 okB5781
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 8 = true := blkChk_join _ _ _ _ _ 5775 7 1 h6 okB5782
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5775 9 = true := blkChk_join _ _ _ _ _ 5775 8 1 h7 okB5783
  exact h8
end E1.C284X
