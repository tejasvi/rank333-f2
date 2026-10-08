module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB802 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB803 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB804 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB805 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB806 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB807 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG86 : glueChkR lits W 802 6 = true := by
  rw [← glueChkRN_eq lits W 7747 802 lenT]; decide +kernel
theorem okM86 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 1 = true := okB802
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 2 = true := blkChk_join _ _ _ _ _ 802 1 1 h0 okB803
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 3 = true := blkChk_join _ _ _ _ _ 802 2 1 h1 okB804
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 4 = true := blkChk_join _ _ _ _ _ 802 3 1 h2 okB805
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 5 = true := blkChk_join _ _ _ _ _ 802 4 1 h3 okB806
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 802 6 = true := blkChk_join _ _ _ _ _ 802 5 1 h4 okB807
  exact h5
end E1.C284X
