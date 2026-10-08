module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4673 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG494 : glueChkR lits W 4672 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4672 lenT]; decide +kernel
theorem okM494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 1 = true := okB4672
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 2 = true := blkChk_join _ _ _ _ _ 4672 1 1 h0 okB4673
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 3 = true := blkChk_join _ _ _ _ _ 4672 2 1 h1 okB4674
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 4 = true := blkChk_join _ _ _ _ _ 4672 3 1 h2 okB4675
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 5 = true := blkChk_join _ _ _ _ _ 4672 4 1 h3 okB4676
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 6 = true := blkChk_join _ _ _ _ _ 4672 5 1 h4 okB4677
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 7 = true := blkChk_join _ _ _ _ _ 4672 6 1 h5 okB4678
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 8 = true := blkChk_join _ _ _ _ _ 4672 7 1 h6 okB4679
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4672 9 = true := blkChk_join _ _ _ _ _ 4672 8 1 h7 okB4680
  exact h8
end E1.C284X
