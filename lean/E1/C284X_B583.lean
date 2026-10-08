module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5505 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5506 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5507 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5507 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5508 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5508 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5509 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5509 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5510 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5510 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5511 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5511 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5512 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5512 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5513 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG583 : glueChkR lits W 5504 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5504 lenT]; decide +kernel
theorem okM583 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 1 = true := okB5504
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 2 = true := blkChk_join _ _ _ _ _ 5504 1 1 h0 okB5505
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 3 = true := blkChk_join _ _ _ _ _ 5504 2 1 h1 okB5506
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 4 = true := blkChk_join _ _ _ _ _ 5504 3 1 h2 okB5507
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 5 = true := blkChk_join _ _ _ _ _ 5504 4 1 h3 okB5508
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 6 = true := blkChk_join _ _ _ _ _ 5504 5 1 h4 okB5509
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 7 = true := blkChk_join _ _ _ _ _ 5504 6 1 h5 okB5510
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 8 = true := blkChk_join _ _ _ _ _ 5504 7 1 h6 okB5511
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 9 = true := blkChk_join _ _ _ _ _ 5504 8 1 h7 okB5512
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5504 10 = true := blkChk_join _ _ _ _ _ 5504 9 1 h8 okB5513
  exact h9
end E1.C284X
