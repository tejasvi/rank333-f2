module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4645 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4645 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4646 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4646 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4647 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4647 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4648 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4648 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4649 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4649 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG490 : glueChkR lits W 4644 6 = true := by
  rw [← glueChkRN_eq lits W 7747 4644 lenT]; decide +kernel
theorem okM490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 1 = true := okB4644
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 2 = true := blkChk_join _ _ _ _ _ 4644 1 1 h0 okB4645
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 3 = true := blkChk_join _ _ _ _ _ 4644 2 1 h1 okB4646
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 4 = true := blkChk_join _ _ _ _ _ 4644 3 1 h2 okB4647
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 5 = true := blkChk_join _ _ _ _ _ 4644 4 1 h3 okB4648
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4644 6 = true := blkChk_join _ _ _ _ _ 4644 5 1 h4 okB4649
  exact h5
end E1.C284X
