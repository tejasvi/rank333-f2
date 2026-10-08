module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4778 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4779 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4779 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4780 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4780 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4781 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4781 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4782 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4782 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4783 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4783 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4784 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4784 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4785 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4785 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4786 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4786 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG504 : glueChkR lits W 4778 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4778 lenT]; decide +kernel
theorem okM504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 1 = true := okB4778
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 2 = true := blkChk_join _ _ _ _ _ 4778 1 1 h0 okB4779
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 3 = true := blkChk_join _ _ _ _ _ 4778 2 1 h1 okB4780
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 4 = true := blkChk_join _ _ _ _ _ 4778 3 1 h2 okB4781
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 5 = true := blkChk_join _ _ _ _ _ 4778 4 1 h3 okB4782
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 6 = true := blkChk_join _ _ _ _ _ 4778 5 1 h4 okB4783
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 7 = true := blkChk_join _ _ _ _ _ 4778 6 1 h5 okB4784
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 8 = true := blkChk_join _ _ _ _ _ 4778 7 1 h6 okB4785
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4778 9 = true := blkChk_join _ _ _ _ _ 4778 8 1 h7 okB4786
  exact h8
end E1.C284X
