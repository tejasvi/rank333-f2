module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB795 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB796 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 796 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB797 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 797 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB798 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 798 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB799 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 799 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB800 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 800 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB801 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 801 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG85 : glueChkR lits W 795 7 = true := by
  rw [← glueChkRN_eq lits W 7747 795 lenT]; decide +kernel
theorem okM85 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 1 = true := okB795
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 2 = true := blkChk_join _ _ _ _ _ 795 1 1 h0 okB796
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 3 = true := blkChk_join _ _ _ _ _ 795 2 1 h1 okB797
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 4 = true := blkChk_join _ _ _ _ _ 795 3 1 h2 okB798
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 5 = true := blkChk_join _ _ _ _ _ 795 4 1 h3 okB799
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 6 = true := blkChk_join _ _ _ _ _ 795 5 1 h4 okB800
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 795 7 = true := blkChk_join _ _ _ _ _ 795 6 1 h5 okB801
  exact h6
end E1.C284X
