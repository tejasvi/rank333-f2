module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2056 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2057 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2058 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2059 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2060 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2061 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2062 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2063 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2064 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2065 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2066 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2067 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG227 : glueChkR lits W 2056 12 = true := by
  rw [← glueChkRN_eq lits W 7747 2056 lenT]; decide +kernel
theorem okM227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 1 = true := okB2056
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 2 = true := blkChk_join _ _ _ _ _ 2056 1 1 h0 okB2057
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 3 = true := blkChk_join _ _ _ _ _ 2056 2 1 h1 okB2058
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 4 = true := blkChk_join _ _ _ _ _ 2056 3 1 h2 okB2059
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 5 = true := blkChk_join _ _ _ _ _ 2056 4 1 h3 okB2060
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 6 = true := blkChk_join _ _ _ _ _ 2056 5 1 h4 okB2061
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 7 = true := blkChk_join _ _ _ _ _ 2056 6 1 h5 okB2062
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 8 = true := blkChk_join _ _ _ _ _ 2056 7 1 h6 okB2063
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 9 = true := blkChk_join _ _ _ _ _ 2056 8 1 h7 okB2064
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 10 = true := blkChk_join _ _ _ _ _ 2056 9 1 h8 okB2065
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 11 = true := blkChk_join _ _ _ _ _ 2056 10 1 h9 okB2066
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2056 12 = true := blkChk_join _ _ _ _ _ 2056 11 1 h10 okB2067
  exact h11
end E1.C284X
