module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1847 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1848 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1848 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1849 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1849 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1850 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1850 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1851 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1851 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1852 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1853 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1854 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG178 : glueChkR lits W 1847 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1847 lenT]; decide +kernel
theorem okM178 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 1 = true := okB1847
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 2 = true := blkChk_join _ _ _ _ _ 1847 1 1 h0 okB1848
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 3 = true := blkChk_join _ _ _ _ _ 1847 2 1 h1 okB1849
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 4 = true := blkChk_join _ _ _ _ _ 1847 3 1 h2 okB1850
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 5 = true := blkChk_join _ _ _ _ _ 1847 4 1 h3 okB1851
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 6 = true := blkChk_join _ _ _ _ _ 1847 5 1 h4 okB1852
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 7 = true := blkChk_join _ _ _ _ _ 1847 6 1 h5 okB1853
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1847 8 = true := blkChk_join _ _ _ _ _ 1847 7 1 h6 okB1854
  exact h7
end E1.C236X
