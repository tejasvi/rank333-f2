module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4386 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4387 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4388 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4389 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4389 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4390 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4390 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4391 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4392 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4392 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4393 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4393 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG431 : glueChkR lits W 4386 8 = true := by
  rw [← glueChkRN_eq lits W 8596 4386 lenT]; decide +kernel
theorem okM431 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 1 = true := okB4386
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 2 = true := blkChk_join _ _ _ _ _ 4386 1 1 h0 okB4387
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 3 = true := blkChk_join _ _ _ _ _ 4386 2 1 h1 okB4388
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 4 = true := blkChk_join _ _ _ _ _ 4386 3 1 h2 okB4389
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 5 = true := blkChk_join _ _ _ _ _ 4386 4 1 h3 okB4390
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 6 = true := blkChk_join _ _ _ _ _ 4386 5 1 h4 okB4391
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 7 = true := blkChk_join _ _ _ _ _ 4386 6 1 h5 okB4392
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4386 8 = true := blkChk_join _ _ _ _ _ 4386 7 1 h6 okB4393
  exact h7
end E1.C236X
