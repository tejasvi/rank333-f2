module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4306 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4307 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4308 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4309 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4310 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG422 : glueChkR lits W 4306 5 = true := by
  rw [← glueChkRN_eq lits W 8596 4306 lenT]; decide +kernel
theorem okM422 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 1 = true := okB4306
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 2 = true := blkChk_join _ _ _ _ _ 4306 1 1 h0 okB4307
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 3 = true := blkChk_join _ _ _ _ _ 4306 2 1 h1 okB4308
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 4 = true := blkChk_join _ _ _ _ _ 4306 3 1 h2 okB4309
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4306 5 = true := blkChk_join _ _ _ _ _ 4306 4 1 h3 okB4310
  exact h4
end E1.C236X
