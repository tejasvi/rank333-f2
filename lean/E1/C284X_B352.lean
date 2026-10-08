module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3298 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3299 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3300 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3301 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3302 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3303 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3304 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3305 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3306 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG352 : glueChkR lits W 3298 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3298 lenT]; decide +kernel
theorem okM352 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 1 = true := okB3298
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 2 = true := blkChk_join _ _ _ _ _ 3298 1 1 h0 okB3299
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 3 = true := blkChk_join _ _ _ _ _ 3298 2 1 h1 okB3300
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 4 = true := blkChk_join _ _ _ _ _ 3298 3 1 h2 okB3301
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 5 = true := blkChk_join _ _ _ _ _ 3298 4 1 h3 okB3302
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 6 = true := blkChk_join _ _ _ _ _ 3298 5 1 h4 okB3303
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 7 = true := blkChk_join _ _ _ _ _ 3298 6 1 h5 okB3304
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 8 = true := blkChk_join _ _ _ _ _ 3298 7 1 h6 okB3305
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3298 9 = true := blkChk_join _ _ _ _ _ 3298 8 1 h7 okB3306
  exact h8
end E1.C284X
