module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB818 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB819 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB820 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB821 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 821 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB822 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 822 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB823 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 823 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB824 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 824 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB825 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG88 : glueChkR lits W 818 8 = true := by
  rw [← glueChkRN_eq lits W 7747 818 lenT]; decide +kernel
theorem okM88 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 1 = true := okB818
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 2 = true := blkChk_join _ _ _ _ _ 818 1 1 h0 okB819
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 3 = true := blkChk_join _ _ _ _ _ 818 2 1 h1 okB820
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 4 = true := blkChk_join _ _ _ _ _ 818 3 1 h2 okB821
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 5 = true := blkChk_join _ _ _ _ _ 818 4 1 h3 okB822
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 6 = true := blkChk_join _ _ _ _ _ 818 5 1 h4 okB823
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 7 = true := blkChk_join _ _ _ _ _ 818 6 1 h5 okB824
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 818 8 = true := blkChk_join _ _ _ _ _ 818 7 1 h6 okB825
  exact h7
end E1.C284X
