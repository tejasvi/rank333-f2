module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2068 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2069 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2070 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2071 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2072 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2073 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2074 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2075 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG228 : glueChkR lits W 2068 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2068 lenT]; decide +kernel
theorem okM228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 1 = true := okB2068
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 2 = true := blkChk_join _ _ _ _ _ 2068 1 1 h0 okB2069
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 3 = true := blkChk_join _ _ _ _ _ 2068 2 1 h1 okB2070
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 4 = true := blkChk_join _ _ _ _ _ 2068 3 1 h2 okB2071
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 5 = true := blkChk_join _ _ _ _ _ 2068 4 1 h3 okB2072
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 6 = true := blkChk_join _ _ _ _ _ 2068 5 1 h4 okB2073
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 7 = true := blkChk_join _ _ _ _ _ 2068 6 1 h5 okB2074
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2068 8 = true := blkChk_join _ _ _ _ _ 2068 7 1 h6 okB2075
  exact h7
end E1.C284X
