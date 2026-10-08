module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4847 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4848 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4848 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4849 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4849 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4850 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4850 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4851 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4851 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4852 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4853 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4854 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4855 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4855 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4856 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4856 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4857 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4858 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4859 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4859 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4860 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4860 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG510 : glueChkR lits W 4847 14 = true := by
  rw [← glueChkRN_eq lits W 7747 4847 lenT]; decide +kernel
theorem okM510 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 14 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 1 = true := okB4847
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 2 = true := blkChk_join _ _ _ _ _ 4847 1 1 h0 okB4848
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 3 = true := blkChk_join _ _ _ _ _ 4847 2 1 h1 okB4849
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 4 = true := blkChk_join _ _ _ _ _ 4847 3 1 h2 okB4850
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 5 = true := blkChk_join _ _ _ _ _ 4847 4 1 h3 okB4851
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 6 = true := blkChk_join _ _ _ _ _ 4847 5 1 h4 okB4852
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 7 = true := blkChk_join _ _ _ _ _ 4847 6 1 h5 okB4853
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 8 = true := blkChk_join _ _ _ _ _ 4847 7 1 h6 okB4854
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 9 = true := blkChk_join _ _ _ _ _ 4847 8 1 h7 okB4855
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 10 = true := blkChk_join _ _ _ _ _ 4847 9 1 h8 okB4856
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 11 = true := blkChk_join _ _ _ _ _ 4847 10 1 h9 okB4857
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 12 = true := blkChk_join _ _ _ _ _ 4847 11 1 h10 okB4858
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 13 = true := blkChk_join _ _ _ _ _ 4847 12 1 h11 okB4859
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4847 14 = true := blkChk_join _ _ _ _ _ 4847 13 1 h12 okB4860
  exact h13
end E1.C284X
