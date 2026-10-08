module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB872 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB873 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB874 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB875 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB876 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB877 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB878 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB879 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB880 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB881 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG94 : glueChkR lits W 872 10 = true := by
  rw [← glueChkRN_eq lits W 7747 872 lenT]; decide +kernel
theorem okM94 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 1 = true := okB872
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 2 = true := blkChk_join _ _ _ _ _ 872 1 1 h0 okB873
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 3 = true := blkChk_join _ _ _ _ _ 872 2 1 h1 okB874
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 4 = true := blkChk_join _ _ _ _ _ 872 3 1 h2 okB875
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 5 = true := blkChk_join _ _ _ _ _ 872 4 1 h3 okB876
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 6 = true := blkChk_join _ _ _ _ _ 872 5 1 h4 okB877
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 7 = true := blkChk_join _ _ _ _ _ 872 6 1 h5 okB878
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 8 = true := blkChk_join _ _ _ _ _ 872 7 1 h6 okB879
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 9 = true := blkChk_join _ _ _ _ _ 872 8 1 h7 okB880
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 872 10 = true := blkChk_join _ _ _ _ _ 872 9 1 h8 okB881
  exact h9
end E1.C284X
