module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5645 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5645 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5646 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5646 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5647 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5647 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5648 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5648 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5649 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5649 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5650 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5650 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5651 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5651 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5652 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5652 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5653 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5653 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5654 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5654 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5655 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5655 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG597 : glueChkR lits W 5644 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5644 lenT]; decide +kernel
theorem okM597 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 1 = true := okB5644
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 2 = true := blkChk_join _ _ _ _ _ 5644 1 1 h0 okB5645
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 3 = true := blkChk_join _ _ _ _ _ 5644 2 1 h1 okB5646
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 4 = true := blkChk_join _ _ _ _ _ 5644 3 1 h2 okB5647
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 5 = true := blkChk_join _ _ _ _ _ 5644 4 1 h3 okB5648
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 6 = true := blkChk_join _ _ _ _ _ 5644 5 1 h4 okB5649
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 7 = true := blkChk_join _ _ _ _ _ 5644 6 1 h5 okB5650
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 8 = true := blkChk_join _ _ _ _ _ 5644 7 1 h6 okB5651
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 9 = true := blkChk_join _ _ _ _ _ 5644 8 1 h7 okB5652
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 10 = true := blkChk_join _ _ _ _ _ 5644 9 1 h8 okB5653
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 11 = true := blkChk_join _ _ _ _ _ 5644 10 1 h9 okB5654
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5644 12 = true := blkChk_join _ _ _ _ _ 5644 11 1 h10 okB5655
  exact h11
end E1.C284X
