module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1870 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1871 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1872 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1873 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1874 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1875 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1876 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1877 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1878 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG181 : glueChkR lits W 1870 9 = true := by
  rw [← glueChkRN_eq lits W 8596 1870 lenT]; decide +kernel
theorem okM181 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 1 = true := okB1870
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 2 = true := blkChk_join _ _ _ _ _ 1870 1 1 h0 okB1871
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 3 = true := blkChk_join _ _ _ _ _ 1870 2 1 h1 okB1872
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 4 = true := blkChk_join _ _ _ _ _ 1870 3 1 h2 okB1873
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 5 = true := blkChk_join _ _ _ _ _ 1870 4 1 h3 okB1874
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 6 = true := blkChk_join _ _ _ _ _ 1870 5 1 h4 okB1875
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 7 = true := blkChk_join _ _ _ _ _ 1870 6 1 h5 okB1876
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 8 = true := blkChk_join _ _ _ _ _ 1870 7 1 h6 okB1877
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1870 9 = true := blkChk_join _ _ _ _ _ 1870 8 1 h7 okB1878
  exact h8
end E1.C236X
