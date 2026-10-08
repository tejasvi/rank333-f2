module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5683 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5684 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5685 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5686 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5687 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5687 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5688 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5688 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5689 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5689 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5690 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5690 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5691 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5691 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5692 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5692 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG600 : glueChkR lits W 5683 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5683 lenT]; decide +kernel
theorem okM600 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 1 = true := okB5683
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 2 = true := blkChk_join _ _ _ _ _ 5683 1 1 h0 okB5684
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 3 = true := blkChk_join _ _ _ _ _ 5683 2 1 h1 okB5685
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 4 = true := blkChk_join _ _ _ _ _ 5683 3 1 h2 okB5686
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 5 = true := blkChk_join _ _ _ _ _ 5683 4 1 h3 okB5687
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 6 = true := blkChk_join _ _ _ _ _ 5683 5 1 h4 okB5688
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 7 = true := blkChk_join _ _ _ _ _ 5683 6 1 h5 okB5689
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 8 = true := blkChk_join _ _ _ _ _ 5683 7 1 h6 okB5690
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 9 = true := blkChk_join _ _ _ _ _ 5683 8 1 h7 okB5691
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5683 10 = true := blkChk_join _ _ _ _ _ 5683 9 1 h8 okB5692
  exact h9
end E1.C284X
