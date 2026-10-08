module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1946 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1947 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1948 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1949 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1950 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1951 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1952 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1953 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG214 : glueChkR lits W 1946 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1946 lenT]; decide +kernel
theorem okM214 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 1 = true := okB1946
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 2 = true := blkChk_join _ _ _ _ _ 1946 1 1 h0 okB1947
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 3 = true := blkChk_join _ _ _ _ _ 1946 2 1 h1 okB1948
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 4 = true := blkChk_join _ _ _ _ _ 1946 3 1 h2 okB1949
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 5 = true := blkChk_join _ _ _ _ _ 1946 4 1 h3 okB1950
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 6 = true := blkChk_join _ _ _ _ _ 1946 5 1 h4 okB1951
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 7 = true := blkChk_join _ _ _ _ _ 1946 6 1 h5 okB1952
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1946 8 = true := blkChk_join _ _ _ _ _ 1946 7 1 h6 okB1953
  exact h7
end E1.C284X
