module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4848 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4849 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4849 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4850 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4850 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4851 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4851 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4852 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4853 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4854 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4855 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4855 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4856 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4856 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4857 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4858 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG475 : glueChkR lits W 4848 11 = true := by
  rw [← glueChkRN_eq lits W 8596 4848 lenT]; decide +kernel
theorem okM475 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 1 = true := okB4848
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 2 = true := blkChk_join _ _ _ _ _ 4848 1 1 h0 okB4849
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 3 = true := blkChk_join _ _ _ _ _ 4848 2 1 h1 okB4850
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 4 = true := blkChk_join _ _ _ _ _ 4848 3 1 h2 okB4851
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 5 = true := blkChk_join _ _ _ _ _ 4848 4 1 h3 okB4852
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 6 = true := blkChk_join _ _ _ _ _ 4848 5 1 h4 okB4853
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 7 = true := blkChk_join _ _ _ _ _ 4848 6 1 h5 okB4854
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 8 = true := blkChk_join _ _ _ _ _ 4848 7 1 h6 okB4855
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 9 = true := blkChk_join _ _ _ _ _ 4848 8 1 h7 okB4856
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 10 = true := blkChk_join _ _ _ _ _ 4848 9 1 h8 okB4857
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4848 11 = true := blkChk_join _ _ _ _ _ 4848 10 1 h9 okB4858
  exact h10
end E1.C236X
