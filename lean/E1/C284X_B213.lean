module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1937 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1938 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1938 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1939 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1939 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1940 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1940 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1941 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1942 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1942 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1943 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1944 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1945 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG213 : glueChkR lits W 1937 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1937 lenT]; decide +kernel
theorem okM213 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 1 = true := okB1937
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 2 = true := blkChk_join _ _ _ _ _ 1937 1 1 h0 okB1938
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 3 = true := blkChk_join _ _ _ _ _ 1937 2 1 h1 okB1939
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 4 = true := blkChk_join _ _ _ _ _ 1937 3 1 h2 okB1940
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 5 = true := blkChk_join _ _ _ _ _ 1937 4 1 h3 okB1941
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 6 = true := blkChk_join _ _ _ _ _ 1937 5 1 h4 okB1942
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 7 = true := blkChk_join _ _ _ _ _ 1937 6 1 h5 okB1943
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 8 = true := blkChk_join _ _ _ _ _ 1937 7 1 h6 okB1944
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1937 9 = true := blkChk_join _ _ _ _ _ 1937 8 1 h7 okB1945
  exact h8
end E1.C284X
