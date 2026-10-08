module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1863 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1864 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1865 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1866 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1867 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1868 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1869 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG180 : glueChkR lits W 1863 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1863 lenT]; decide +kernel
theorem okM180 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 1 = true := okB1863
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 2 = true := blkChk_join _ _ _ _ _ 1863 1 1 h0 okB1864
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 3 = true := blkChk_join _ _ _ _ _ 1863 2 1 h1 okB1865
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 4 = true := blkChk_join _ _ _ _ _ 1863 3 1 h2 okB1866
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 5 = true := blkChk_join _ _ _ _ _ 1863 4 1 h3 okB1867
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 6 = true := blkChk_join _ _ _ _ _ 1863 5 1 h4 okB1868
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1863 7 = true := blkChk_join _ _ _ _ _ 1863 6 1 h5 okB1869
  exact h6
end E1.C236X
