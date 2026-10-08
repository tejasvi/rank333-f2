module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1941 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1942 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1942 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1943 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1944 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1945 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1946 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1947 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG189 : glueChkR lits W 1941 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1941 lenT]; decide +kernel
theorem okM189 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 1 = true := okB1941
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 2 = true := blkChk_join _ _ _ _ _ 1941 1 1 h0 okB1942
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 3 = true := blkChk_join _ _ _ _ _ 1941 2 1 h1 okB1943
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 4 = true := blkChk_join _ _ _ _ _ 1941 3 1 h2 okB1944
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 5 = true := blkChk_join _ _ _ _ _ 1941 4 1 h3 okB1945
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 6 = true := blkChk_join _ _ _ _ _ 1941 5 1 h4 okB1946
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1941 7 = true := blkChk_join _ _ _ _ _ 1941 6 1 h5 okB1947
  exact h6
end E1.C236X
