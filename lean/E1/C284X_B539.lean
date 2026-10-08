module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5072 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5073 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5074 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5075 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5076 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5077 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5078 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG539 : glueChkR lits W 5072 7 = true := by
  rw [← glueChkRN_eq lits W 7747 5072 lenT]; decide +kernel
theorem okM539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 1 = true := okB5072
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 2 = true := blkChk_join _ _ _ _ _ 5072 1 1 h0 okB5073
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 3 = true := blkChk_join _ _ _ _ _ 5072 2 1 h1 okB5074
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 4 = true := blkChk_join _ _ _ _ _ 5072 3 1 h2 okB5075
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 5 = true := blkChk_join _ _ _ _ _ 5072 4 1 h3 okB5076
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 6 = true := blkChk_join _ _ _ _ _ 5072 5 1 h4 okB5077
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5072 7 = true := blkChk_join _ _ _ _ _ 5072 6 1 h5 okB5078
  exact h6
end E1.C284X
