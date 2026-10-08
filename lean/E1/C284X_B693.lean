module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6696 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6697 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6698 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6699 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6700 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6701 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6702 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG693 : glueChkR lits W 6696 7 = true := by
  rw [← glueChkRN_eq lits W 7747 6696 lenT]; decide +kernel
theorem okM693 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 1 = true := okB6696
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 2 = true := blkChk_join _ _ _ _ _ 6696 1 1 h0 okB6697
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 3 = true := blkChk_join _ _ _ _ _ 6696 2 1 h1 okB6698
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 4 = true := blkChk_join _ _ _ _ _ 6696 3 1 h2 okB6699
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 5 = true := blkChk_join _ _ _ _ _ 6696 4 1 h3 okB6700
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 6 = true := blkChk_join _ _ _ _ _ 6696 5 1 h4 okB6701
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6696 7 = true := blkChk_join _ _ _ _ _ 6696 6 1 h5 okB6702
  exact h6
end E1.C284X
