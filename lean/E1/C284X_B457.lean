module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4295 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4296 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4296 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4297 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4297 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4298 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4299 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4300 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4301 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4302 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4303 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4304 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG457 : glueChkR lits W 4295 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4295 lenT]; decide +kernel
theorem okM457 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 1 = true := okB4295
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 2 = true := blkChk_join _ _ _ _ _ 4295 1 1 h0 okB4296
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 3 = true := blkChk_join _ _ _ _ _ 4295 2 1 h1 okB4297
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 4 = true := blkChk_join _ _ _ _ _ 4295 3 1 h2 okB4298
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 5 = true := blkChk_join _ _ _ _ _ 4295 4 1 h3 okB4299
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 6 = true := blkChk_join _ _ _ _ _ 4295 5 1 h4 okB4300
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 7 = true := blkChk_join _ _ _ _ _ 4295 6 1 h5 okB4301
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 8 = true := blkChk_join _ _ _ _ _ 4295 7 1 h6 okB4302
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 9 = true := blkChk_join _ _ _ _ _ 4295 8 1 h7 okB4303
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4295 10 = true := blkChk_join _ _ _ _ _ 4295 9 1 h8 okB4304
  exact h9
end E1.C284X
